using Newtonsoft.Json;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using WebApplication7.Common;
using WebApplication7.Model;

namespace WebApplication7.Controllers
{

    /// <summary>
    /// 流程节点设计控制器：提供节点画板页面及节点/条件的加载与保存接口。
    /// 节点坐标(x,y)以JSON形式存储于WFNew_FlowSetNode.Remark字段，便于画板回显位置。
    /// </summary>
    public class FlowSetNodeController : Controller
    {
        private SqlSugarClient Db => DBHelper.SqlServerClient;

        /// <summary>
        /// 节点设计画板页面
        /// </summary>
        public ActionResult NodeDesign(string templateCode)
        {
            ViewBag.TemplateCode = templateCode;

            var sql = @"SELECT A.UserName,A.[Name],B.[Name] AS SysDepartmentName,B.ParentId,B.Id DetpId
            FROM dbo.Sys_User AS A
            INNER JOIN dbo.Sys_Department AS B ON a.SysDepartmentId=B.Code
            WHERE A.Id!=1 AND A.UserType=0 AND A.[Status]=0 AND A.Del=0";

            //选择人员
            var listUser = Db.Ado.SqlQuery<Sys_UserModel>(sql);
            List<TreeModel> listTree = new List<TreeModel>();
            foreach (var dept in listUser.GroupBy(t => new { t.SysDepartmentName, t.ParentId, t.DetpId }).Select(t => new { t.Key, list = t.ToList() }))
            {
                TreeModel parent = new TreeModel()
                {
                    name = dept.Key.SysDepartmentName,
                    value = dept.Key.DetpId + ""
                };
                foreach (var item in dept.list)
                {
                    parent.children.Add(new TreeModel()
                    {
                        name = item.Name,
                        value = item.UserName
                    });
                }
                listTree.Add(parent);
            }
            ViewBag.listUser = listTree;


            //选择部门
            List<TreeModel> listDept = Db.Queryable<Sys_Department>().Where(a => a.Id != 1 && a.Status == 0 && a.Del == 0)
                .Select(s => new TreeModel() { name = s.Name, value = s.Code }).ToList();
            ViewBag.listDept = listDept; //listDept.ToJsonSerialize();



            return View();
        }

        /// <summary>
        /// 获取指定模板下的所有节点
        /// </summary>
        public ActionResult GetNodes(string templateCode)
        {
            var list = Db.Queryable<WFNew_FlowSetNode>()
                .Where(n => n.TemplateCode == templateCode)
                .OrderBy(n => n.NodeSort)
                .ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 获取指定模板下的所有条件（连线）
        /// </summary>
        public ActionResult GetConditions(string templateCode)
        {
            var list = Db.Queryable<WFNew_FlowSetCondition>()
                .Where(c => c.TemplateCode == templateCode)
                .OrderBy(c => c.Priority)
                .ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 批量保存节点与条件（版本化保存：复制原模板生成新版本，旧版置为禁用）。
        /// 返回 data.newTemplateCode 供前端切换当前 code，保证后续操作基于新版本。
        /// </summary>
        [HttpPost]
        public ActionResult SaveDesign(string templateCode, string nodes, string conditions)
        {
            try
            {
                var nodeList = string.IsNullOrEmpty(nodes)
                    ? new List<WFNew_FlowSetNode>()
                    : JsonConvert.DeserializeObject<List<WFNew_FlowSetNode>>(nodes);
                var condList = string.IsNullOrEmpty(conditions)
                    ? new List<WFNew_FlowSetCondition>()
                    : JsonConvert.DeserializeObject<List<WFNew_FlowSetCondition>>(conditions);

                var db = DBHelper.SqlServerClient;
                db.Ado.BeginTran();
                try
                {
                    // 1) 查找原模板
                    var oldTpl = db.Queryable<WFNew_FlowSetTemplate>()
                        .Where(t => t.TemplateCode == templateCode).First();

                    // 生成新模板编码（原编码基础上追加 _V{版本号} 以保证可读且唯一）
                    int version = 1;
                    string baseCode = templateCode;
                    if (oldTpl != null)
                    {
                        version = (oldTpl.TemplateVersion ?? 0) + 1;
                        // 如果原编码已经是 xxx_V{n} 格式，去除后缀回到基础编码
                        var m = System.Text.RegularExpressions.Regex.Match(templateCode, @"^(.*)_V\d+$");
                        if (m.Success) { baseCode = m.Groups[1].Value; }
                    }
                    string newTemplateCode = baseCode + "_V" + version;
                    // 防冲突：保证新编码在表中不存在
                    int dupIdx = 1;
                    while (db.Queryable<WFNew_FlowSetTemplate>().Any(t => t.TemplateCode == newTemplateCode))
                    {
                        newTemplateCode = baseCode + "_V" + version + "_" + (dupIdx++);
                    }

                    // 2) 旧模板置为禁用（IsEnable=0），更新审计字段
                    if (oldTpl != null)
                    {
                        oldTpl.IsEnable = 0;
                        oldTpl.UpdateTime = DateTime.Now;
                        oldTpl.UpdateUserNo = "admin";
                        db.Updateable(oldTpl).ExecuteCommand();
                    }

                    // 3) 插入新模板（复制旧模板信息，IsEnable=1，版本号递增）
                    var newTpl = new WFNew_FlowSetTemplate
                    {
                        Id = 0,
                        TemplateCode = newTemplateCode,
                        TemplateName = oldTpl != null ? oldTpl.TemplateName : ("模板_" + newTemplateCode),
                        TemplateVersion = version,
                        BizTableName = oldTpl != null ? oldTpl.BizTableName : "",
                        BizOrderField = oldTpl != null ? oldTpl.BizOrderField : "",
                        FormPageUrl = oldTpl != null ? oldTpl.FormPageUrl : "",
                        IsEnable = 1,
                        AllowWithdraw = oldTpl != null ? oldTpl.AllowWithdraw : 1,
                        Remark = oldTpl != null ? oldTpl.Remark : "",
                        AddTime = DateTime.Now,
                        AddUserNo = "admin",
                        UpdateTime = DateTime.Now,
                        UpdateUserNo = "admin"
                    };
                    long newTplId = db.Insertable(newTpl).ExecuteReturnBigIdentity();
                    newTpl.Id = newTplId;

                    // 4) 删除新编码下可能存在的脏数据（理论上不存在，以防万一）
                    db.Deleteable<WFNew_FlowSetNode>()
                        .Where(n => n.TemplateCode == newTemplateCode).ExecuteCommand();
                    db.Deleteable<WFNew_FlowSetCondition>()
                        .Where(c => c.TemplateCode == newTemplateCode).ExecuteCommand();

                    // 5) 写入节点（归属新模板编码）
                    int nodeIdx = 0;
                    foreach (var node in nodeList)
                    {
                        node.Id = 0;
                        node.TemplateCode = newTemplateCode;
                        if (string.IsNullOrEmpty(node.NodeCode))
                        {
                            node.NodeCode = "NODE" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + nodeIdx;
                        }
                        if (node.NodeSort == null) { node.NodeSort = nodeIdx + 1; }
                        node.AddTime = DateTime.Now;
                        node.AddUserNo = "admin";
                        db.Insertable(node).ExecuteCommand();
                        nodeIdx++;
                    }

                    // 6) 写入条件（归属新模板编码）
                    int condIdx = 0;
                    foreach (var cond in condList)
                    {
                        cond.Id = 0;
                        cond.TemplateCode = newTemplateCode;
                        if (string.IsNullOrEmpty(cond.ConditionCode))
                        {
                            cond.ConditionCode = "COND" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + condIdx;
                        }
                        if (cond.Priority == null) { cond.Priority = condIdx + 1; }
                        cond.AddTime = DateTime.Now;
                        cond.AddUserNo = "admin";
                        db.Insertable(cond).ExecuteCommand();
                        condIdx++;
                    }

                    db.Ado.CommitTran();
                    return Json(new { code = 0, msg = "保存成功", data = new { newTemplateCode = newTemplateCode, newTemplateId = newTplId } });
                }
                catch (Exception ex)
                {
                    db.Ado.RollbackTran();
                    return Json(new { code = 1, msg = "保存失败：" + ex.Message });
                }
            }
            catch (Exception ex)
            {
                return Json(new { code = 1, msg = "解析失败：" + ex.Message });
            }
        }


    }
}
