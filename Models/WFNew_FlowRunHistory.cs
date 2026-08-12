using SqlSugar;
using System;
using System.ComponentModel.DataAnnotations;
using WebApplication7.Model;

namespace WebApplication7.Model
{
    /// <summary>
    /// 流程流转历史轨迹
    /// </summary>
    [SugarTable("WFNew_FlowRunHistory")]
    [DataFieldAttribute("WFNew_FlowRunHistory")]
    public class WFNew_FlowRunHistory : BaseModel
    {
        /// <summary>历史记录编码</summary>
        [DataFieldAttribute("HistoryCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string HistoryCode
        {
            get;
            set;
        }

        /// <summary>所属实例编码</summary>
        [DataFieldAttribute("InstanceCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string InstanceCode
        {
            get;
            set;
        }

        /// <summary>来源节点编码，可为空（发起流程时）</summary>
        [DataFieldAttribute("FromNodeCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FromNodeCode
        {
            get;
            set;
        }

        /// <summary>到达目标节点编码</summary>
        [DataFieldAttribute("ToNodeCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string ToNodeCode
        {
            get;
            set;
        }

        /// <summary>
        /// 操作类型：0发起提交 1审批通过 2审批驳回 3撤回 4作废 5转办 6加签 7超时自动处理
        /// </summary>
        [DataFieldAttribute("OperateType")]
        public int? OperateType
        {
            get;
            set;
        }

        /// <summary>操作人账号</summary>
        [DataFieldAttribute("OperateUserNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string OperateUserNo
        {
            get;
            set;
        }

        /// <summary>操作人姓名</summary>
        [DataFieldAttribute("OperateUserName")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string OperateUserName
        {
            get;
            set;
        }

        /// <summary>操作意见</summary>
        [DataFieldAttribute("Opinion")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Opinion
        {
            get;
            set;
        }

        /// <summary>操作发生时间</summary>
        [DataFieldAttribute("OperateTime")]
        public DateTime? OperateTime
        {
            get;
            set;
        }


        /// <summary>传的条件</summary>
        [DataFieldAttribute("FormData")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FormData
        {
            get;
            set;
        }
        
    }
}

