using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using WebApplication7.Model;
using WebApplication7.Common;

namespace WebApplication7.Controllers
{
    public class HomeController : Controller
    {
        private SqlSugarClient Db => DBHelper.SqlServerClient;
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            // 查询最新启用的流程模板编码，供测试表单预填
            var latestTemplate = Db.Queryable<WFNew_FlowSetTemplate>()
                .Where(t => t.IsEnable == 1)
                .OrderBy(t => t.Id, OrderByType.Desc)
                .Select(t => new { t.TemplateCode, t.TemplateName })
                .First();
            ViewBag.TemplateCode = latestTemplate?.TemplateCode ?? "";
            ViewBag.TemplateName = latestTemplate?.TemplateName ?? "";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact information page.";

            return View();
        }

        /// <summary>
        /// 测试 FlowNewHelper.FlowApply 发起审批流程
        /// </summary>
        /// <param name="templateCode">流程模板编码</param>
        /// <param name="bizOrderNo">业务单据号</param>
        /// <param name="applyUserNo">发起人账号</param>
        /// <param name="applyRemark">发起备注</param>
        /// <param name="formDataJson">业务表单数据JSON（如 {"Amount":"5000","Days":"3"}），用于条件分支评估</param>
        [HttpPost]
        public ActionResult TestFlowApply(string templateCode, string bizOrderNo, string applyUserNo, string applyRemark, string formDataJson = null)
        {
            // 查找发起人姓名
            string applyUserName = applyUserNo;
            var user = Db.Queryable<Sys_User>()
                .Where(u => u.UserName == applyUserNo)
                .Select(u => new { u.Name })
                .First();
            if (user != null && !string.IsNullOrEmpty(user.Name))
            {
                applyUserName = user.Name;
            }

            // 解析表单数据JSON为字典
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
                    return Json(new { code = 1, msg = "表单数据JSON格式错误", instanceCode = "", taskCount = 0 });
                }
            }

            var result = FlowNewHelper.FlowApply(templateCode, bizOrderNo, applyUserNo, applyUserName, applyRemark, formData);
            return Json(new
            {
                code = result.Success ? 0 : 1,
                msg = result.Message,
                instanceCode = result.InstanceCode,
                taskCount = result.TaskCount
            });
        }
    }
}