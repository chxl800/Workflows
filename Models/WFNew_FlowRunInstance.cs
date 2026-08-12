using SqlSugar;
using System;
using System.ComponentModel.DataAnnotations;
using WebApplication7.Model;

namespace WebApplication7.Model
{
    /// <summary>
    /// 流程实例表：用户实际发起的一笔审批
    /// </summary>
    [SugarTable("WFNew_FlowRunInstance")]
    [DataFieldAttribute("WFNew_FlowRunInstance")]
    public class WFNew_FlowRunInstance : BaseModel
    {
        /// <summary>流程实例唯一编码 </summary>
        [DataFieldAttribute("InstanceCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string InstanceCode
        {
            get;
            set;
        }

        /// <summary>关联流程模板编码 </summary>
        [DataFieldAttribute("TemplateCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string TemplateCode
        {
            get;
            set;
        }

        /// <summary>发起时模板版本号，锁定模板，模板修改不影响老实例</summary>
        [DataFieldAttribute("TemplateVersion")]
        public int? TemplateVersion
        {
            get;
            set;
        }

        /// <summary>业务单据号（你的工单单号，核心关联）</summary>
        [DataFieldAttribute("BizOrderNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string BizOrderNo
        {
            get;
            set;
        }

        /// <summary>业务表名冗余</summary>
        [DataFieldAttribute("BizTableName")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string BizTableName
        {
            get;
            set;
        }

        /// <summary>发起人账号</summary>
        [DataFieldAttribute("ApplyUserNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string ApplyUserNo
        {
            get;
            set;
        }

        /// <summary>发起人姓名</summary>
        [DataFieldAttribute("ApplyUserName")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string ApplyUserName
        {
            get;
            set;
        }

        /// <summary>实例状态：0审批中 1审批全部通过 2被驳回 3发起人撤回 4作废终止</summary>
        [DataFieldAttribute("InstanceStatus")]
        public int? InstanceStatus
        {
            get;
            set;
        }

        /// <summary>当前正在处理的节点编码</summary>
        [DataFieldAttribute("CurrentNodeCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string CurrentNodeCode
        {
            get;
            set;
        }

        /// <summary>表单页面地址</summary>
        [DataFieldAttribute("FormPageUrl")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FormPageUrl
        {
            get;
            set;
        }

        /// <summary>发起时填写的备注</summary>
        [DataFieldAttribute("ApplyRemark")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string ApplyRemark
        {
            get;
            set;
        }

        /// <summary>流程完成时间（通过/驳回/作废）</summary>
        [DataFieldAttribute("FinishTime")]
        public DateTime? FinishTime
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
