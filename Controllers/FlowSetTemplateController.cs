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
    public class FlowSetTemplateController : Controller
    {
        private SqlSugarClient Db => DBHelper.SqlServerClient;

        // 流程类型列表页面
        public ActionResult Index()
        {
            return View();
        }

        // GET: 新建/编辑页面（统一页面）
        public ActionResult Form(long? id)
        {
            ViewBag.Id = id;
            return View();
        }

        // POST: 保存（新建或编辑）
        [HttpPost]
        public ActionResult Save(WFNew_FlowSetTemplate model)
        {
            try
            {
                if (model.Id > 0)
                {
                    // 编辑
                    var entity = Db.Queryable<WFNew_FlowSetTemplate>().InSingle(model.Id);
                    if (entity == null)
                    {
                        return Json(new AjaxResult { Code = ResultCode.Failure, Message = "数据不存在" });
                    }
                    entity.TemplateName = model.TemplateName;
                    entity.BizTableName = model.BizTableName;
                    entity.BizOrderField = model.BizOrderField;
                    entity.FormPageUrl = model.FormPageUrl;
                    entity.IsEnable = model.IsEnable;
                    entity.AllowWithdraw = model.AllowWithdraw;
                    entity.Remark = model.Remark;
                    entity.UpdateTime = DateTime.Now;
                    entity.UpdateUserNo = "admin";
                    Db.Updateable(entity).ExecuteCommand();
                    return Json(new AjaxResult { Code = ResultCode.Succeed, Message = "保存成功" });
                }
                else
                {
                    // 新建
                    model.TemplateCode = "TPL" + DateTime.Now.ToString("yyyyMMddHHmmss");
                    model.AddTime = DateTime.Now;
                    model.AddUserNo = "admin";
                    if (model.TemplateVersion == null)
                    {
                        model.TemplateVersion = 1;
                    }
                    Db.Insertable(model).ExecuteCommand();
                    return Json(new AjaxResult { Code = ResultCode.Succeed, Message = "新建成功" });
                }
            }
            catch (Exception ex)
            {
                return Json(new AjaxResult { Code = ResultCode.Failure, Message = "保存失败：" + ex.Message });
            }
        }

        // POST: 删除
        [HttpPost]
        public ActionResult Delete(long id)
        {
            try
            {
                Db.Deleteable<WFNew_FlowSetTemplate>().In(id).ExecuteCommand();
                return Json(new AjaxResult { Code = ResultCode.Succeed, Message = "删除成功" });
            }
            catch (Exception ex)
            {
                return Json(new AjaxResult { Code = ResultCode.Failure, Message = "删除失败：" + ex.Message });
            }
        }

        // GET: 获取列表（仅展示启用的版本；禁用/历史版本不展示在列表中）
        public ActionResult GetList(int page = 1, int limit = 10, string keyword = "", int? isEnable = null)
        {
            try
            {
                int total = 0;
                var query = Db.Queryable<WFNew_FlowSetTemplate>();

                // 固定：禁用版本（旧版本）不再展示在流程类型列表中
                query = query.Where(t => t.IsEnable == 1);

                // 关键字查询：模板名称或模板编码
                if (!string.IsNullOrEmpty(keyword))
                {
                    query = query.Where(t => t.TemplateName.Contains(keyword) || t.TemplateCode.Contains(keyword));
                }

                var list = query
                    .OrderBy(t => t.Id, OrderByType.Desc)
                    .ToPageList(page, limit, ref total);
                return Json(new ResultData { code = 0, msg = "", curr = page, count = total, data = list }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new ResultData { code = 1, msg = "获取列表失败：" + ex.Message, curr = page, count = 0, data = new List<WFNew_FlowSetTemplate>() }, JsonRequestBehavior.AllowGet);
            }
        }

        // GET: 获取单条数据(JSON)
        public ActionResult GetTemplate(long id)
        {
            try
            {
                var entity = Db.Queryable<WFNew_FlowSetTemplate>().InSingle(id);
                if (entity == null)
                {
                    return Json(new AjaxResult { Code = ResultCode.Failure, Message = "数据不存在" }, JsonRequestBehavior.AllowGet);
                }
                return Json(new AjaxResult { Code = ResultCode.Succeed, Message = "", Data = entity }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new AjaxResult { Code = ResultCode.Failure, Message = "获取失败：" + ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }


    }
}
