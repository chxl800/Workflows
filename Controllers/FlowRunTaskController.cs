using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using WebApplication7.Common;
using WebApplication7.Model;

namespace WebApplication7.Controllers
{
    public class FlowRunTaskController : Controller
    {
        private SqlSugarClient Db => DBHelper.SqlServerClient;

        private const string CurrentUserNo = "BTDXZ";//"admin";

        public ActionResult Index(string tab = "todo")
        {
            ViewBag.Tab = tab;
            return View();
        }

        public ActionResult Detail(string taskCode)
        {
            ViewBag.TaskCode = taskCode;
            return View();
        }

        public ActionResult GetList(int page = 1, int limit = 10, string tab = "todo", string keyword = "")
        {
            try
            {
                int total = 0;
                var userNo = CurrentUserNo;

                // —— 第一步：单表查任务（匹配 tab + userNo + 关键字） ——
                ISugarQueryable<WFNew_FlowRunTask> taskQuery = null;
                if (tab == "todo")
                    taskQuery = Db.Queryable<WFNew_FlowRunTask>()
                        .Where(t => t.TaskStatus == (int)ETaskStatus.待审批 && t.AuditUserNo == userNo);
                else
                    taskQuery = Db.Queryable<WFNew_FlowRunTask>()
                        .Where(t => t.TaskStatus != (int)ETaskStatus.待审批 && t.AuditUserNo == userNo);

                // 关键字过滤：需要结合实例表 BizOrderNo/ApplyUserName/InstanceCode
                if (!string.IsNullOrEmpty(keyword))
                {
                    var matchedInstanceCodes = Db.Queryable<WFNew_FlowRunInstance>()
                        .Where(i => i.BizOrderNo.Contains(keyword)
                            || i.ApplyUserName.Contains(keyword)
                            || i.InstanceCode.Contains(keyword))
                        .Select(i => i.InstanceCode)
                        .ToList();
                    taskQuery = taskQuery.Where(t => matchedInstanceCodes.Contains(t.InstanceCode)
                        || t.TaskCode.Contains(keyword));
                }

                var taskPage = taskQuery
                    .OrderBy(t => t.AddTime, OrderByType.Desc)
                    .ToPageList(page, limit, ref total);

                // —— 第二步：补充实例字段（分页后少量数据关联） ——
                var instanceCodes = taskPage.Select(t => t.InstanceCode).Distinct().ToList();
                List<WFNew_FlowRunInstance> instances = null;
                if (instanceCodes.Count > 0)
                {
                    instances = Db.Queryable<WFNew_FlowRunInstance>()
                        .Where(i => instanceCodes.Contains(i.InstanceCode))
                        .ToList();
                }

                var list = taskPage.Select(t =>
                {
                    var ins = instances?.FirstOrDefault(i => i.InstanceCode == t.InstanceCode);
                    return new
                    {
                        t.Id,
                        t.TaskCode,
                        t.InstanceCode,
                        t.NodeCode,
                        t.AuditUserNo,
                        t.AuditUserName,
                        t.TaskStatus,
                        t.AddTime,
                        t.AuditTime,
                        BizOrderNo = ins?.BizOrderNo ?? "",
                        ApplyUserName = ins?.ApplyUserName ?? "",
                        TemplateCode = ins?.TemplateCode ?? "",
                        InstanceStatus = ins?.InstanceStatus,
                        FormPageUrl = ins?.FormPageUrl ?? ""
                    };
                }).ToList();

                return Json(new ResultData { code = 0, msg = "", curr = page, count = total, data = list },
                    JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new ResultData { code = 1, msg = "获取失败：" + ex.Message, curr = page, count = 0, data = new object[0] },
                    JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult GetDetail(string taskCode)
        {
            try
            {
                var task = Db.Queryable<WFNew_FlowRunTask>()
                    .Where(t => t.TaskCode == taskCode)
                    .First();
                if (task == null)
                    return Json(new AjaxResult { Code = ResultCode.Failure, Message = "任务不存在" },
                        JsonRequestBehavior.AllowGet);

                var instance = Db.Queryable<WFNew_FlowRunInstance>()
                    .Where(i => i.InstanceCode == task.InstanceCode)
                    .First();
                if (instance == null)
                    return Json(new AjaxResult { Code = ResultCode.Failure, Message = "实例不存在" },
                        JsonRequestBehavior.AllowGet);

                var template = Db.Queryable<WFNew_FlowSetTemplate>()
                    .Where(t => t.TemplateCode == instance.TemplateCode)
                    .Select(t => new { t.TemplateName, t.TemplateCode })
                    .First();

                var node = Db.Queryable<WFNew_FlowSetNode>()
                    .Where(n => n.TemplateCode == instance.TemplateCode && n.NodeCode == task.NodeCode)
                    .Select(n => new { n.NodeName, n.NodeCode })
                    .First();

                var history = Db.Queryable<WFNew_FlowRunHistory>()
                    .Where(h => h.InstanceCode == task.InstanceCode)
                    .OrderBy(h => h.OperateTime, OrderByType.Asc)
                    .Select(h => new
                    {
                        h.HistoryCode,
                        h.FromNodeCode,
                        h.ToNodeCode,
                        h.OperateType,
                        h.OperateUserNo,
                        h.OperateUserName,
                        h.Opinion,
                        h.OperateTime
                    })
                    .ToList();

                return Json(new AjaxResult
                {
                    Code = ResultCode.Succeed,
                    Data = new
                    {
                        task,
                        instance,
                        template,
                        node,
                        history,
                        currentUser = CurrentUserNo
                    }
                }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new AjaxResult { Code = ResultCode.Failure, Message = "获取失败：" + ex.Message },
                    JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult Approval(string taskCode, int operType, string opinion, string formDataJson = null)
        {
            try
            {
                Dictionary<string, string> formData = null;
                if (!string.IsNullOrWhiteSpace(formDataJson))
                {
                    try
                    {
                        var serializer = new JavaScriptSerializer();
                        formData = serializer.Deserialize<Dictionary<string, string>>(formDataJson);
                    }
                    catch
                    {
                        return Json(new AjaxResult { Code = ResultCode.Failure, Message = "表单数据JSON格式错误" });
                    }
                }

                var enumOper = operType == (int)EAuditOperType.驳回
                    ? EAuditOperType.驳回
                    : EAuditOperType.通过;

                var result = FlowNewHelper.FlowApproval(taskCode, CurrentUserNo, enumOper, opinion, formData);

                if (result.Success)
                    return Json(new AjaxResult { Code = ResultCode.Succeed, Message = result.Message, Data = new { result.InstanceCode, result.NextTaskCount } });
                else
                    return Json(new AjaxResult { Code = ResultCode.Failure, Message = result.Message });
            }
            catch (Exception ex)
            {
                return Json(new AjaxResult { Code = ResultCode.Failure, Message = "审批失败：" + ex.Message });
            }
        }
    }
}
