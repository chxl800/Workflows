using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication7.Model;

namespace WebApplication7.Common
{
    /// <summary>
    /// 流程核心帮助类：发起流程、审批通过、驳回等核心方法。
    /// 基于 WFNew_FlowSet*（设计期表）和 WFNew_FlowRun*（运行期表）实现。
    /// </summary>
    public static class FlowNewHelper
    {
        #region 流程发起

        /// <summary>
        /// 流程发起结果
        /// </summary>
        public class FlowApplyResult
        {
            /// <summary>是否成功</summary>
            public bool Success { get; set; }
            /// <summary>结果消息</summary>
            public string Message { get; set; }
            /// <summary>流程实例编码（成功时返回）</summary>
            public string InstanceCode { get; set; }
            /// <summary>待办任务数量</summary>
            public int TaskCount { get; set; }
        }

        /// <summary>
        /// 发起审批流程核心方法。
        /// 流程：校验模板 → 查找开始节点 → 条件评估查找下一节点 → 解析审批人 → 创建实例+任务+历史（事务）。
        /// </summary>
        /// <param name="templateCode">流程模板编码（必须为启用状态）</param>
        /// <param name="bizOrderNo">业务单据号（工单单号，核心关联）</param>
        /// <param name="applyUserNo">发起人账号（Sys_User.UserName）</param>
        /// <param name="applyUserName">发起人姓名</param>
        /// <param name="applyRemark">发起备注</param>
        /// <param name="formData">业务表单数据（字段名→字段值），传入时条件评估优先从此取值，不传则回退查业务表</param>
        /// <returns>FlowApplyResult，包含成功状态、消息、实例编码</returns>
        public static FlowApplyResult FlowApply(string templateCode, string bizOrderNo,
            string applyUserNo, string applyUserName, string applyRemark,
            Dictionary<string, string> formData = null)
        {
            var result = new FlowApplyResult();
            var db = DBHelper.SqlServerClient;

            try
            {
                // —— 1. 参数校验 ——
                if (string.IsNullOrEmpty(templateCode))
                { result.Message = "模板编码不能为空"; return result; }
                if (string.IsNullOrEmpty(bizOrderNo))
                { result.Message = "业务单据号不能为空"; return result; }
                if (string.IsNullOrEmpty(applyUserNo))
                { result.Message = "发起人账号不能为空"; return result; }

                // —— 2. 查找启用的流程模板 ——
                var template = db.Queryable<WFNew_FlowSetTemplate>()
                    .Where(t => t.TemplateCode == templateCode && t.IsEnable == 1)
                    .First();
                if (template == null)
                { result.Message = "流程模板不存在或未启用"; return result; }

                // —— 3. 加载模板节点与条件 ——
                var nodes = db.Queryable<WFNew_FlowSetNode>()
                    .Where(n => n.TemplateCode == templateCode)
                    .OrderBy(n => n.NodeSort)
                    .ToList();
                if (nodes == null || nodes.Count == 0)
                { result.Message = "流程节点未配置"; return result; }

                var conditions = db.Queryable<WFNew_FlowSetCondition>()
                    .Where(c => c.TemplateCode == templateCode)
                    .ToList();

                // —— 4. 查找开始节点 ——
                var startNode = nodes.FirstOrDefault(n => n.NodeType == (int)ENodeType.开始节点);
                if (startNode == null)
                { result.Message = "未找到开始节点"; return result; }

                // —— 5. 从开始节点出发，根据条件评估查找下一个节点 ——
                string nextNodeCode = ResolveNextNode(db, nodes, conditions,
                    startNode.NodeCode, template.BizTableName, template.BizOrderField, bizOrderNo, formData);
                if (string.IsNullOrEmpty(nextNodeCode))
                { result.Message = "未找到下一个审批节点"; return result; }

                var nextNode = nodes.FirstOrDefault(n => n.NodeCode == nextNodeCode);
                if (nextNode == null)
                { result.Message = "下一节点不存在：" + nextNodeCode; return result; }

                // —— 6. 解析审批人 ——
                var auditors = ResolveAuditors(db, nextNode, applyUserNo, applyUserName);
                if (auditors == null || auditors.Count == 0)
                {
                    result.Message = "审批节点【" + nextNode.NodeName + "】未解析到审批人";
                    return result;
                }

                // —— 7. 事务：创建实例 + 待办任务 + 历史记录 ——
                string instanceCode = "INS" + DateTime.Now.ToString("yyyyMMddHHmmssfff");

                db.Ado.BeginTran();
                try
                {
                    // 如果下一节点是结束节点，流程直接完成
                    bool isEnd = nextNode.NodeType == (int)ENodeType.结束节点;

                    // 7.1 创建流程实例
                    var instance = new WFNew_FlowRunInstance
                    {
                        InstanceCode = instanceCode,
                        TemplateCode = templateCode,
                        TemplateVersion = template.TemplateVersion,
                        BizOrderNo = bizOrderNo,
                        BizTableName = template.BizTableName ?? "",
                        ApplyUserNo = applyUserNo,
                        ApplyUserName = applyUserName ?? "",
                        InstanceStatus = isEnd ? (int)EInstanceStatus.审批全部通过 : (int)EInstanceStatus.审批中,
                        CurrentNodeCode = isEnd ? "" : nextNode.NodeCode,
                        FormPageUrl = template.FormPageUrl ?? "",
                        ApplyRemark = applyRemark ?? "",
                        FinishTime = isEnd ? (DateTime?)DateTime.Now : null,
                        AddTime = DateTime.Now,
                        AddUserNo = applyUserNo
                    };
                    db.Insertable(instance).ExecuteCommand();

                    // 7.2 创建待办任务（每个审批人一条）
                    if (!isEnd)
                    {
                        foreach (var auditor in auditors)
                        {
                            var task = new WFNew_FlowRunTask
                            {
                                TaskCode = "TASK" + DateTime.Now.ToString("yyyyMMddHHmmssfff")
                                    + Guid.NewGuid().ToString("N").Substring(0, 6),
                                InstanceCode = instanceCode,
                                NodeCode = nextNode.NodeCode,
                                AuditUserNo = auditor.UserNo,
                                AuditUserName = auditor.UserName,
                                TaskStatus = (int)ETaskStatus.待审批,
                                AddTime = DateTime.Now,
                                AddUserNo = applyUserNo
                            };
                            db.Insertable(task).ExecuteCommand();
                        }
                    }

                    // 7.3 创建历史记录（发起提交）
                    var history = new WFNew_FlowRunHistory
                    {
                        HistoryCode = "HIS" + DateTime.Now.ToString("yyyyMMddHHmmssfff"),
                        InstanceCode = instanceCode,
                        FromNodeCode = startNode.NodeCode,
                        ToNodeCode = nextNode.NodeCode,
                        OperateType = (int)EOperateType.发起提交,
                        OperateUserNo = applyUserNo,
                        OperateUserName = applyUserName ?? "",
                        Opinion = applyRemark ?? "",
                        OperateTime = DateTime.Now,
                        FormData= formData != null ? Newtonsoft.Json.JsonConvert.SerializeObject(formData) : ""
                    };
                    db.Insertable(history).ExecuteCommand();

                    db.Ado.CommitTran();

                    result.Success = true;
                    result.InstanceCode = instanceCode;
                    result.TaskCount = isEnd ? 0 : auditors.Count;
                    result.Message = isEnd
                        ? "流程已发起并自动完成（下一节点为结束节点），实例编码：" + instanceCode
                        : "流程发起成功，已生成" + auditors.Count + "条待办任务，实例编码：" + instanceCode;
                }
                catch (Exception ex)
                {
                    db.Ado.RollbackTran();
                    result.Message = "发起失败（事务回滚）：" + ex.Message;
                }
            }
            catch (Exception ex)
            {
                result.Message = "系统异常：" + ex.Message;
            }
            return result;
        }

        #endregion

        #region 审批处理

        /// <summary>
        /// 审批处理结果
        /// </summary>
        public class FlowApprovalResult
        {
            /// <summary>是否成功</summary>
            public bool Success { get; set; }
            /// <summary>结果消息</summary>
            public string Message { get; set; }
            /// <summary>流程实例编码</summary>
            public string InstanceCode { get; set; }
            /// <summary>下一批次待办任务数（0 表示流程结束，-1 表示会签等待中）</summary>
            public int NextTaskCount { get; set; }
        }

        /// <summary>
        /// 公用审批处理方法：审批通过/驳回。
        /// 逻辑：校验任务→更新任务状态→历史记录→（通过时）条件评估下一节点→生成新待办/结束流程。
        /// </summary>
        /// <param name="taskCode">待办任务编码</param>
        /// <param name="auditUserNo">当前审批人账号（需与任务审批人匹配）</param>
        /// <param name="auditOperType">审批操作类型：EAuditOperType.通过 或 EAuditOperType.驳回</param>
        /// <param name="auditOpinion">审批意见</param>
        /// <param name="formData">业务表单数据（用于条件分支评估），可空</param>
        /// <returns>FlowApprovalResult</returns>
        public static FlowApprovalResult FlowApproval(string taskCode, string auditUserNo,
            EAuditOperType auditOperType, string auditOpinion, Dictionary<string, string> formData = null)
        {
            var result = new FlowApprovalResult();
            var db = DBHelper.SqlServerClient;

            try
            {
                if (string.IsNullOrEmpty(taskCode)) { result.Message = "任务编码不能为空"; return result; }
                if (string.IsNullOrEmpty(auditUserNo)) { result.Message = "审批人账号不能为空"; return result; }

                // —— 1. 查找待办任务 ——
                var task = db.Queryable<WFNew_FlowRunTask>()
                    .Where(t => t.TaskCode == taskCode)
                    .First();
                if (task == null) { result.Message = "待办任务不存在"; return result; }
                if (task.TaskStatus != (int)ETaskStatus.待审批) { result.Message = "当前任务状态不是待审批"; return result; }
                if (task.AuditUserNo != auditUserNo) { result.Message = "您不是该任务的审批人"; return result; }

                // —— 2. 查找所属实例 ——
                var instance = db.Queryable<WFNew_FlowRunInstance>()
                    .Where(i => i.InstanceCode == task.InstanceCode)
                    .First();
                if (instance == null) { result.Message = "流程实例不存在"; return result; }
                result.InstanceCode = instance.InstanceCode;

                // —— 3. 加载模板节点与条件（锁定实例版本） ——
                var template = db.Queryable<WFNew_FlowSetTemplate>()
                    .Where(t => t.TemplateCode == instance.TemplateCode
                        && t.TemplateVersion == instance.TemplateVersion)
                    .First();
                var nodes = db.Queryable<WFNew_FlowSetNode>()
                    .Where(n => n.TemplateCode == instance.TemplateCode)
                    .OrderBy(n => n.NodeSort)
                    .ToList();
                var conditions = db.Queryable<WFNew_FlowSetCondition>()
                    .Where(c => c.TemplateCode == instance.TemplateCode)
                    .ToList();
                var currentNode = nodes.FirstOrDefault(n => n.NodeCode == task.NodeCode);

                db.Ado.BeginTran();
                try
                {
                    // —— 4. 更新本任务状态与意见 ——
                    var now = DateTime.Now;
                    int taskStatus, historyOperType;
                    if (auditOperType == EAuditOperType.通过)
                    {
                        taskStatus = (int)ETaskStatus.通过;
                        historyOperType = (int)EOperateType.审批通过;
                    }
                    else
                    {
                        taskStatus = (int)ETaskStatus.驳回;
                        historyOperType = (int)EOperateType.审批驳回;
                    }
                    task.TaskStatus = taskStatus;
                    task.AuditOpinion = auditOpinion ?? "";
                    task.AuditTime = now;
                    db.Updateable(task)
                        .UpdateColumns(t => new { t.TaskStatus, t.AuditOpinion, t.AuditTime })
                        .ExecuteCommand();

                    // —— 5. 写历史记录 ——
                    var history = new WFNew_FlowRunHistory
                    {
                        HistoryCode = "HIS" + now.ToString("yyyyMMddHHmmssfff"),
                        InstanceCode = instance.InstanceCode,
                        FromNodeCode = task.NodeCode,
                        ToNodeCode = "",
                        OperateType = historyOperType,
                        OperateUserNo = auditUserNo,
                        Opinion = auditOpinion ?? "",
                        OperateTime = now,
                        FormData= formData != null ? Newtonsoft.Json.JsonConvert.SerializeObject(formData) : "",
                    };
                    // 先查审批人姓名补到历史
                    var auditor = db.Queryable<Sys_User>()
                        .Where(u => u.UserName == auditUserNo)
                        .Select(u => new { u.Name })
                        .First();
                    if (auditor != null) history.OperateUserName = auditor.Name;

                    // —— 6. 处理驳回 vs 通过 ——
                    if (auditOperType == EAuditOperType.驳回)
                    {
                        // 驳回：实例状态=被驳回，流程结束
                        history.ToNodeCode = "";
                        instance.InstanceStatus = (int)EInstanceStatus.被驳回;
                        instance.CurrentNodeCode = "";
                        instance.FinishTime = now;

                        // 同一节点下其他待办同时作废（使用原生SQL以兼容精简版SqlSugar）
                        CancelSameNodeTasks(db, instance.InstanceCode, task.NodeCode, task.TaskCode);

                        db.Insertable(history).ExecuteCommand();
                        db.Updateable(instance)
                            .UpdateColumns(i => new { i.InstanceStatus, i.CurrentNodeCode, i.FinishTime })
                            .ExecuteCommand();

                        db.Ado.CommitTran();
                        result.Success = true;
                        result.NextTaskCount = 0;
                        result.Message = "审批驳回成功，流程已结束";
                    }
                    else
                    {
                        // 通过：若该节点还有其他待办（会签），暂不推进
                        var sameNodeTodo = db.Queryable<WFNew_FlowRunTask>()
                            .Where(t => t.InstanceCode == instance.InstanceCode
                                && t.NodeCode == task.NodeCode
                                && t.TaskCode != task.TaskCode
                                && t.TaskStatus == (int)ETaskStatus.待审批)
                            .Any();

                        // 会签节点需全部通过
                        bool isCounterSign = currentNode != null && currentNode.IsCounterSign == 1;
                        if (isCounterSign && sameNodeTodo)
                        {
                            // 会签未完成，不推进
                            history.ToNodeCode = task.NodeCode;
                            db.Insertable(history).ExecuteCommand();
                            db.Ado.CommitTran();
                            result.Success = true;
                            result.Message = "审批通过，当前节点为会签模式，等待其他审批人";
                            result.NextTaskCount = -1; // 会签等待中
                            return result;
                        }

                        // 同节点其他待办作废（或签已满足，使用原生SQL以兼容精简版SqlSugar）
                        if (sameNodeTodo)
                        {
                            CancelSameNodeTasks(db, instance.InstanceCode, task.NodeCode, task.TaskCode);
                        }

                        // —— 7. 条件评估查找下一节点 ——
                        string nextNodeCode = ResolveNextNode(db, nodes, conditions,
                            task.NodeCode, template?.BizTableName, template?.BizOrderField,
                            instance.BizOrderNo, formData);

                        var nextNode = !string.IsNullOrEmpty(nextNodeCode)
                            ? nodes.FirstOrDefault(n => n.NodeCode == nextNodeCode)
                            : null;
                        bool isEnd = nextNode == null || nextNode.NodeType == (int)ENodeType.结束节点;

                        history.ToNodeCode = nextNode?.NodeCode ?? "";
                        db.Insertable(history).ExecuteCommand();

                        if (isEnd)
                        {
                            // 流程结束
                            instance.InstanceStatus = (int)EInstanceStatus.审批全部通过;
                            instance.CurrentNodeCode = "";
                            instance.FinishTime = now;
                            db.Updateable(instance)
                                .UpdateColumns(i => new { i.InstanceStatus, i.CurrentNodeCode, i.FinishTime })
                                .ExecuteCommand();
                            db.Ado.CommitTran();
                            result.Success = true;
                            result.NextTaskCount = 0;
                            result.Message = "审批通过，流程已全部完成";
                        }
                        else
                        {
                            // 下一节点必须为审批节点，解析审批人
                            if (nextNode.NodeType != (int)ENodeType.审批节点)
                            {
                                db.Ado.RollbackTran();
                                result.Message = "下一节点不是审批节点：" + nextNode.NodeName;
                                return result;
                            }
                            var nextAuditors = ResolveAuditors(db, nextNode,
                                instance.ApplyUserNo, instance.ApplyUserName);
                            if (nextAuditors == null || nextAuditors.Count == 0)
                            {
                                db.Ado.RollbackTran();
                                result.Message = "下一节点【" + nextNode.NodeName + "】未解析到审批人";
                                return result;
                            }

                            // 更新实例当前节点
                            instance.CurrentNodeCode = nextNode.NodeCode;
                            db.Updateable(instance)
                                .UpdateColumns(i => new { i.CurrentNodeCode })
                                .ExecuteCommand();

                            // 生成下一批待办
                            foreach (var au in nextAuditors)
                            {
                                var nextTask = new WFNew_FlowRunTask
                                {
                                    TaskCode = "TASK" + now.ToString("yyyyMMddHHmmssfff")
                                        + Guid.NewGuid().ToString("N").Substring(0, 6),
                                    InstanceCode = instance.InstanceCode,
                                    NodeCode = nextNode.NodeCode,
                                    AuditUserNo = au.UserNo,
                                    AuditUserName = au.UserName,
                                    TaskStatus = (int)ETaskStatus.待审批,
                                    AddTime = now,
                                    AddUserNo = auditUserNo
                                };
                                db.Insertable(nextTask).ExecuteCommand();
                                result.NextTaskCount++;
                            }

                            db.Ado.CommitTran();
                            result.Success = true;
                            result.Message = "审批通过，已流转至【" + nextNode.NodeName
                                + "】，生成" + result.NextTaskCount + "条待办任务";
                        }
                    }
                }
                catch (Exception ex)
                {
                    db.Ado.RollbackTran();
                    result.Message = "审批失败（事务回滚）：" + ex.Message;
                }
            }
            catch (Exception ex)
            {
                result.Message = "系统异常：" + ex.Message;
            }
            return result;
        }

        #endregion

        #region 公用方法

        /// <summary>
        /// 解析下一节点：从当前节点出发，根据条件连线匹配目标节点。
        /// 1. 无条件连线时取第一个审批节点作为默认。
        /// 2. 有连线时按优先级逐个评估：无业务字段的为直连，有业务字段的需比对业务数据。
        /// 3. 所有条件都不满足时，取第一条连线目标作为兜底。
        /// </summary>
        /// <param name="db">SqlSugar客户端</param>
        /// <param name="nodes">模板节点列表</param>
        /// <param name="conditions">模板条件连线列表</param>
        /// <param name="sourceNodeCode">当前节点编码</param>
        /// <param name="bizTableName">业务主表名（来自模板配置）</param>
        /// <param name="bizOrderField">业务单号字段名（来自模板配置）</param>
        /// <param name="bizOrderNo">业务单据号</param>
        /// <param name="formData">业务表单数据（字段名→字段值），传入时优先从此取值</param>
        /// <returns>下一节点编码，未找到返回 null</returns>
        private static string ResolveNextNode(SqlSugarClient db, List<WFNew_FlowSetNode> nodes,
            List<WFNew_FlowSetCondition> conditions, string sourceNodeCode,
            string bizTableName, string bizOrderField, string bizOrderNo,
            Dictionary<string, string> formData)
        {
            // 获取从当前节点出发的所有条件连线，按优先级排序
            var conds = conditions
                .Where(c => c.SourceNodeCode == sourceNodeCode)
                .OrderBy(c => c.Priority ?? int.MaxValue)
                .ToList();

            if (conds.Count == 0)
            {
                // 无连线，取第一个审批节点
                var firstApproval = nodes.FirstOrDefault(n => n.NodeType == (int)ENodeType.审批节点);
                return firstApproval?.NodeCode;
            }

            // 按优先级逐个匹配条件
            foreach (var cond in conds)
            {
                // 无业务字段 = 直连线，直接返回目标节点
                if (string.IsNullOrEmpty(cond.BizField))
                {
                    return cond.TargetNodeCode;
                }

                // 有业务字段，需评估条件是否满足
                if (EvaluateCondition(db, cond, bizTableName, bizOrderField, bizOrderNo, formData))
                {
                    return cond.TargetNodeCode;
                }
            }

            // 所有条件都不满足，取第一条连线目标作为兜底
            return conds[0].TargetNodeCode;
        }

        /// <summary>
        /// 评估单个条件是否满足：优先从 formData 取字段值，无则回退查询业务表，再与比较值按符号对比。
        /// </summary>
        /// <param name="db">SqlSugar客户端</param>
        /// <param name="cond">条件对象（含 BizField/Symbol/CompareValue）</param>
        /// <param name="bizTableName">业务主表名</param>
        /// <param name="bizOrderField">业务单号字段名</param>
        /// <param name="bizOrderNo">业务单据号</param>
        /// <param name="formData">业务表单数据（字段名→字段值），传入时优先从此取值</param>
        /// <returns>条件是否满足</returns>
        private static bool EvaluateCondition(SqlSugarClient db, WFNew_FlowSetCondition cond,
            string bizTableName, string bizOrderField, string bizOrderNo,
            Dictionary<string, string> formData)
        {
            string fieldValue = null;

            // 优先从传入的表单数据中取值
            if (formData != null && formData.ContainsKey(cond.BizField))
            {
                fieldValue = formData[cond.BizField];
            }
            else
            {
                // 回退：动态查询业务表中指定字段的值（参数化防注入）
                if (string.IsNullOrEmpty(bizTableName) || string.IsNullOrEmpty(bizOrderField))
                    return false;

                try
                {
                    string sql = $"SELECT {cond.BizField} FROM {bizTableName} WHERE {bizOrderField} = @orderNo";
                    fieldValue = db.Ado.SqlQuerySingle<string>(sql, new { orderNo = bizOrderNo });
                }
                catch
                {
                    // 业务表不存在或查询失败，条件视为不满足
                    return false;
                }
            }

            return CompareValues(fieldValue, (ESymbol)(cond.Symbol ?? 0), cond.CompareValue);
        }

        /// <summary>
        /// 按比较符号（ESymbol）对比实际值与期望值。
        /// 数值型比较（大于/小于等）自动尝试 decimal 解析；字符串型比较（等于/包含等）直接对比。
        /// </summary>
        /// <param name="actualValue">业务表字段实际值</param>
        /// <param name="symbol">比较符号</param>
        /// <param name="compareValue">条件配置的对比值</param>
        /// <returns>比较结果</returns>
        private static bool CompareValues(string actualValue, ESymbol symbol, string compareValue)
        {
            if (actualValue == null) actualValue = "";
            if (compareValue == null) compareValue = "";

            switch (symbol)
            {
                case ESymbol.等于:
                    return actualValue == compareValue;
                case ESymbol.不等于:
                    return actualValue != compareValue;
                case ESymbol.大于:
                    return decimal.TryParse(actualValue, out var a1) && decimal.TryParse(compareValue, out var b1) && a1 > b1;
                case ESymbol.大于等于:
                    return decimal.TryParse(actualValue, out var a2) && decimal.TryParse(compareValue, out var b2) && a2 >= b2;
                case ESymbol.小于:
                    return decimal.TryParse(actualValue, out var a3) && decimal.TryParse(compareValue, out var b3) && a3 < b3;
                case ESymbol.小于等于:
                    return decimal.TryParse(actualValue, out var a4) && decimal.TryParse(compareValue, out var b4) && a4 <= b4;
                case ESymbol.包含:
                    return actualValue.Contains(compareValue);
                case ESymbol.不包含:
                    return !actualValue.Contains(compareValue);
                default:
                    return false;
            }
        }

        /// <summary>
        /// 解析审批节点对应的审批人列表。
        /// AuditType 对应 EAuditType：指定人员/指定部门/提单人直属上级/部门负责人/提单人
        /// </summary>
        /// <param name="db">SqlSugar客户端</param>
        /// <param name="node">审批节点</param>
        /// <param name="applyUserNo">发起人账号（用于解析直属上级）</param>
        /// <param name="applyUserName">发起人姓名</param>
        /// <returns>审批人列表（UserNo + UserName）</returns>
        private static List<AuditorInfo> ResolveAuditors(SqlSugarClient db, WFNew_FlowSetNode node,
            string applyUserNo, string applyUserName)
        {
            var list = new List<AuditorInfo>();
            var auditType = (EAuditType)(node.AuditType ?? 0);

            // AuditUserNos 按逗号分割
            var codes = (node.AuditUserNos ?? "")
                .Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries)
                .Select(s => s.Trim())
                .Where(s => !string.IsNullOrEmpty(s))
                .ToList();

            switch (auditType)
            {
                case EAuditType.指定人员: // 按 UserName 查找
                    if (codes.Count > 0)
                    {
                        var users = db.Queryable<Sys_User>()
                            .Where(u => codes.Contains(u.UserName) && u.UserType == 0 && u.Status == 0 && u.Del == 0)
                            .Select(u => new { u.UserName, u.Name })
                            .ToList();
                        foreach (var u in users)
                        {
                            list.Add(new AuditorInfo { UserNo = u.UserName, UserName = u.Name });
                        }
                    }
                    break;

                case EAuditType.指定部门: // 查找部门下所有启用人员
                    if (codes.Count > 0)
                    {
                        var deptList=new List<SysDepartmentTreeDto> ();// 用于存储部门及其子部门
                        var deptTree = GetDeptTree(db, codes, deptList);// 获取部门及其子部门

                        var codeList= deptList.Select(d => d.Code).Distinct().ToList(); // 获取所有部门编码

                        var deptUsers = db.Queryable<Sys_User>()
                            .Where(u => codeList.Contains(u.SysDepartmentId) && u.UserType == 0 && u.Status == 0 && u.Del == 0)
                            .Select(u => new { u.UserName, u.Name })
                            .ToList();
                        foreach (var u in deptUsers)
                        {
                            list.Add(new AuditorInfo { UserNo = u.UserName, UserName = u.Name });
                        }
                    }
                    break;

                case EAuditType.提单人直属上级: // 查找发起人的 ParentUserNo
                    var applyUser = db.Queryable<Sys_User>()
                        .Where(u => u.UserName == applyUserNo && u.UserType == 0 && u.Status == 0 && u.Del == 0)
                        .First();
                    if (applyUser != null && !string.IsNullOrEmpty(applyUser.ParentUserNo))
                    {
                        list.Add(new AuditorInfo
                        {
                            UserNo = applyUser.ParentUserNo,
                            UserName = applyUser.ParentUserName ?? applyUser.ParentUserNo
                        });
                    }
                    break;

                case EAuditType.部门负责人: // 查找部门 FzrUserNo
                    if (codes.Count > 0)
                    {
                        var depts = db.Queryable<Sys_Department>()
                            .Where(d => codes.Contains(d.Code) && d.Status == 0)
                            .Select(d => new { d.FzrUserNo, d.FzrUserName })
                            .ToList();
                        foreach (var d in depts)
                        {
                            if (!string.IsNullOrEmpty(d.FzrUserNo))
                            {
                                list.Add(new AuditorInfo
                                {
                                    UserNo = d.FzrUserNo,
                                    UserName = d.FzrUserName ?? d.FzrUserNo
                                });
                            }
                        }
                    }
                    break;
                case EAuditType.提单人: //  
                    list.Add(new AuditorInfo
                    {
                        UserNo = applyUserNo,
                        UserName = applyUserName
                    });
                    break;
            }
            return list;
        }

        /// <summary>
        /// 作废同一节点下除当前任务外的其他待审批任务（驳回/或签通过时调用）。
        /// 使用原生参数化 SQL 以兼容精简版 SqlSugar（无 IUpdateable.Set 扩展）。
        /// </summary>
        /// <param name="db">SqlSugar客户端</param>
        /// <param name="instanceCode">流程实例编码</param>
        /// <param name="nodeCode">节点编码</param>
        /// <param name="excludeTaskCode">排除的任务编码（当前任务）</param>
        private static void CancelSameNodeTasks(SqlSugarClient db, string instanceCode, string nodeCode, string excludeTaskCode)
        {
            db.Ado.ExecuteCommand(
                @"UPDATE WFNew_FlowRunTask SET TaskStatus=@status
                  WHERE InstanceCode=@insCode AND NodeCode=@nodeCode
                    AND TaskCode<>@taskCode AND TaskStatus=@todoStatus",
                new
                {
                    status = (int)ETaskStatus.作废,
                    insCode = instanceCode,
                    nodeCode = nodeCode,
                    taskCode = excludeTaskCode,
                    todoStatus = (int)ETaskStatus.待审批
                });
        }

        /// <summary>审批人信息（内部使用）</summary>
        private class AuditorInfo
        {
            /// <summary>审批人账号</summary>
            public string UserNo { get; set; }
            /// <summary>审批人姓名</summary>
            public string UserName { get; set; }
        }




        /// <summary>
        /// 内存递归组装树
        /// </summary>
        /// <returns></returns>
        private static List<SysDepartmentTreeDto> GetDeptTree(SqlSugarClient db, List<string> DeptCodes, List<SysDepartmentTreeDto> deptList)
        {
            //1. 查询所有未删除部门
            var allDept = db.Queryable<Sys_Department>()
                .Where(x => x.Status == 0 && x.Del == 0)
                .ToList();

            //映射Dto
            var allList = allDept.ToMap<SysDepartmentTreeDto>();

            //2. 找根节点 ParentId=null
            var depts = allList.Where(x => DeptCodes.Contains(x.Code)).ToList();
 
            deptList.AddRange(depts);  //部门以及其子部门都加入到集合中

            //3. 递归填充子节点
            RecursionSetChildren(depts, allList, deptList);

            return depts;
        }

        /// <summary>
        /// 递归方法
        /// </summary>
        /// <param name="parentList">父节点集合</param>
        /// <param name="allList">全部数据集合</param>
        private static void RecursionSetChildren(List<SysDepartmentTreeDto> parentList, List<SysDepartmentTreeDto> allList, List<SysDepartmentTreeDto> deptList)
        {
            foreach (var parent in parentList)
            {
                //找当前父Id对应的子节点
                var children = allList.Where(c => c.ParentId == parent.Id).ToList();
                parent.Children = children;

                deptList.AddRange(children);

                //继续递归子节点
                if (children.Any())
                {
                    RecursionSetChildren(children, allList, deptList);
                }
            }
        }

        #endregion
    }
}
