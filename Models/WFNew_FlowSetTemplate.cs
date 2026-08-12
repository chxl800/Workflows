using SqlSugar;
using System;
using System.ComponentModel.DataAnnotations;
using WebApplication7.Model;

namespace WebApplication7.Model
{
    /// <summary>
    /// 流程模板表：定义一套审批流程配置
    /// </summary>
    [SugarTable("WFNew_FlowSetTemplate")]
    [DataFieldAttribute("WFNew_FlowSetTemplate")]
    public class WFNew_FlowSetTemplate : BaseModel
    {
        /// <summary>模板编码，唯一 </summary>
        [DataFieldAttribute("TemplateCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string TemplateCode
        {
            get;
            set;
        }

        /// <summary>模板名称 </summary>
        [DataFieldAttribute("TemplateName")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string TemplateName
        {
            get;
            set;
        }

        /// <summary>关联业务主表名（工单表）</summary>
        [DataFieldAttribute("BizTableName")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string BizTableName
        {
            get;
            set;
        }

        /// <summary>业务单据单号字段名 如：OrderNo</summary>
        [DataFieldAttribute("BizOrderField")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string BizOrderField
        {
            get;
            set;
        }

        /// <summary>表单页面Url，发起/查看工单页面</summary>
        [DataFieldAttribute("FormPageUrl")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FormPageUrl
        {
            get;
            set;
        }

        /// <summary>是否启用 0禁用 1启用</summary>
        [DataFieldAttribute("IsEnable")]
        public int? IsEnable
        {
            get;
            set;
        }

        /// <summary>模板版本号，修改模板版本+，老实例沿用旧版本</summary>
        [DataFieldAttribute("TemplateVersion")]
        public int? TemplateVersion
        {
            get;
            set;
        }

        /// <summary>是否允许发起人撤回 0否 1是</summary>
        [DataFieldAttribute("AllowWithdraw")]
        public int? AllowWithdraw
        {
            get;
            set;
        }

        /// <summary>审批完成执行存储过程编码，空则不执行</summary>
        [DataFieldAttribute("CompleteProcCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string CompleteProcCode
        {
            get;
            set;
        }

        /// <summary>完成存储过程参数json </summary>
        [DataFieldAttribute("CompleteProcParam")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string CompleteProcParam
        {
            get;
            set;
        }

        /// <summary>驳回执行存储过程编码 </summary>
        [DataFieldAttribute("RejectProcCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string RejectProcCode
        {
            get;
            set;
        }

        /// <summary>驳回存储过程参数json</summary>
        [DataFieldAttribute("RejectProcParam")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string RejectProcParam
        {
            get;
            set;
        }

        /// <summary>备注说明</summary>
        [DataFieldAttribute("Remark")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Remark
        {
            get;
            set;
        }



        /// <summary>
        /// 创建时间
        /// </summary>
        [DataFieldAttribute("AddTime")]
        public DateTime? AddTime
        {
            get;
            set;
        }
        /// <summary>
        /// 创建人
        /// </summary>
        [DataFieldAttribute("AddUserNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string AddUserNo
        {
            get;
            set;
        }
        /// <summary>
        /// 修改时间
        /// </summary>
        [DataFieldAttribute("UpdateTime")]
        public DateTime? UpdateTime
        {
            get;
            set;
        }
        /// <summary>
        /// 修改人
        /// </summary>
        [DataFieldAttribute("UpdateUserNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string UpdateUserNo
        {
            get;
            set;
        }


    }


}

