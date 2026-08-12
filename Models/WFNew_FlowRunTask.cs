using SqlSugar;
using System;
using System.ComponentModel.DataAnnotations;
using WebApplication7.Model;

namespace WebApplication7.Model
{
    /// <summary>
    /// 审批任务表：待办、已办任务
    /// </summary>
    [SugarTable("WFNew_FlowRunTask")]
    [DataFieldAttribute("WFNew_FlowRunTask")]
    public class WFNew_FlowRunTask : BaseModel
    {
        /// <summary>任务编码</summary>
        [DataFieldAttribute("TaskCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string TaskCode
        {
            get;
            set;
        }

        /// <summary>所属流程实例编码 FK WF_FlowInstance.InstanceCode</summary>
        [DataFieldAttribute("InstanceCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string InstanceCode
        {
            get;
            set;
        }

        /// <summary>对应节点编码 FK WF_FlowNode.NodeCode</summary>
        [DataFieldAttribute("NodeCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string NodeCode
        {
            get;
            set;
        }

        /// <summary>审批人账号</summary>
        [DataFieldAttribute("AuditUserNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string AuditUserNo
        {
            get;
            set;
        }

        /// <summary>审批人姓名</summary>
        [DataFieldAttribute("AuditUserName")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string AuditUserName
        {
            get;
            set;
        }

        /// <summary>任务状态：0待审批 1同意通过 2驳回 3撤回 4任务作废 5转办转出 6加签任务</summary>
        [DataFieldAttribute("TaskStatus")]
        public int? TaskStatus
        {
            get;
            set;
        }

        /// <summary>审批填写意见</summary>
        [DataFieldAttribute("AuditOpinion")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string AuditOpinion
        {
            get;
            set;
        }

        /// <summary>审批操作时间</summary>
        [DataFieldAttribute("AuditTime")]
        public DateTime? AuditTime
        {
            get;
            set;
        }

        /// <summary>任务超时时间</summary>
        [DataFieldAttribute("TaskTimeoutTime")]
        public DateTime? TaskTimeoutTime
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

    }
}

