using SqlSugar;
using System;
using System.ComponentModel.DataAnnotations;
using WebApplication7.Model;

namespace WebApplication7.Model
{
    /// <summary>
    /// 流程分支条件表，分支网关跳转规则
    /// </summary>
    [SugarTable("WFNew_FlowSetCondition")]
    [DataFieldAttribute("WFNew_FlowSetCondition")]
    public class WFNew_FlowSetCondition : BaseModel
    {
        /// <summary>条件编码 </summary>
        [DataFieldAttribute("ConditionCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string ConditionCode
        {
            get;
            set;
        }

        /// <summary>所属模板编码</summary>
        [DataFieldAttribute("TemplateCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string TemplateCode
        {
            get;
            set;
        }

        /// <summary>来源节点编码（分支网关节点NodeCode）</summary>
        [DataFieldAttribute("SourceNodeCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string SourceNodeCode
        {
            get;
            set;
        }

        /// <summary>条件满足后跳转至目标节点编码</summary>
        [DataFieldAttribute("TargetNodeCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string TargetNodeCode
        {
            get;
            set;
        }

        /// <summary>条件名称，后台配置显示用</summary>
        [DataFieldAttribute("ConditionName")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string ConditionName
        {
            get;
            set;
        }

        /// <summary>业务表单字段名，用于页面配置回显</summary>
        [DataFieldAttribute("BizField")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string BizField
        {
            get;
            set;
        }

        /// <summary>比较符号：0=等于 1=不等于 2=大于 3=大于等于 4=小于 5=小于等于 6=包含 7=不包含</summary>
        [DataFieldAttribute("Symbol")]
        public int? Symbol
        {
            get;
            set;
        }

        /// <summary>条件对比值</summary>
        [DataFieldAttribute("CompareValue")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string CompareValue
        {
            get;
            set;
        }

        /// <summary>多条件逻辑 0 AND 1 OR </summary>
        [DataFieldAttribute("LogicType")]
        public int? LogicType
        {
            get;
            set;
        }

        /// <summary>条件组编码，用于括号分组复杂条件</summary>
        [DataFieldAttribute("GroupCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string GroupCode
        {
            get;
            set;
        }

        /// <summary>运行时生成完整条件表达式（缓存，用于执行）</summary>
        [DataFieldAttribute("ConditionExp")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string ConditionExp
        {
            get;
            set;
        }

        /// <summary>条件优先级，同一个网关多个条件按优先级匹配</summary>
        [DataFieldAttribute("Priority")]
        public int? Priority
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
