using SqlSugar;
using System;
using System.ComponentModel.DataAnnotations;
using WebApplication7.Model;

namespace WebApplication7.Model
{

    /// <summary>
    /// 流程节点表：开始、审批、分支、结束节点
    /// </summary>
    [SugarTable("WFNew_FlowSetNode")]
    [DataFieldAttribute("WFNew_FlowSetNode")]
    public class WFNew_FlowSetNode : BaseModel
    {
        /// <summary>节点编码，模板内唯一 </summary>
        [DataFieldAttribute("NodeCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string NodeCode
        {
            get;
            set;
        }

        /// <summary>所属模板编码 FK WF_FlowTemplate.TemplateCode </summary>
        [DataFieldAttribute("TemplateCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string TemplateCode
        {
            get;
            set;
        }

        /// <summary>节点名称 </summary>
        [DataFieldAttribute("NodeName")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string NodeName
        {
            get;
            set;
        }

        /// <summary>节点类型 0=开始节点 1=审批节点 2=分支网关 3=结束节点</summary>
        [DataFieldAttribute("NodeType")]
        public int? NodeType
        {
            get;
            set;
        }

        /// <summary>节点排序序号</summary>
        [DataFieldAttribute("NodeSort")]
        public int? NodeSort
        {
            get;
            set;
        }

        /// <summary>审批类型：0指定人员 1指定部门 2角色 3提单人直属上级 4部门负责人 5提单人</summary>
        [DataFieldAttribute("AuditType")]
        public int? AuditType
        {
            get;
            set;
        }

        /// <summary>审核部门编码</summary>
        [DataFieldAttribute("AuditDeptCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string AuditDeptCode
        {
            get;
            set;
        }

        /// <summary>审核账号，多个逗号分隔</summary>
        [DataFieldAttribute("AuditUserNos")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string AuditUserNos
        {
            get;
            set;
        }

        /// <summary>角色编码</summary>
        [DataFieldAttribute("AuditRoleCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string AuditRoleCode
        {
            get;
            set;
        }

        /// <summary>会签或签：0或签(一人通过即过) 1会签(全部需要审批)</summary>
        [DataFieldAttribute("IsCounterSign")]
        public int? IsCounterSign
        {
            get;
            set;
        }

        /// <summary>是否允许转办 0否 1是</summary>
        [DataFieldAttribute("AllowTransfer")]
        public int? AllowTransfer
        {
            get;
            set;
        }

        /// <summary>是否允许加签 0否 1是</summary>
        [DataFieldAttribute("AllowAddSign")]
        public int? AllowAddSign
        {
            get;
            set;
        }

        /// <summary>审批超时小时数，0不超时</summary>
        [DataFieldAttribute("TimeoutHour")]
        public int? TimeoutHour
        {
            get;
            set;
        }

        /// <summary>超时处理：0无处理 1自动通过 2自动驳回</summary>
        [DataFieldAttribute("TimeoutHandleType")]
        public int? TimeoutHandleType
        {
            get;
            set;
        }

        /// <summary>节点页面url，可覆盖模板表单地址</summary>
        [DataFieldAttribute("NodePageUrl")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string NodePageUrl
        {
            get;
            set;
        }

        /// <summary>备注</summary>
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

