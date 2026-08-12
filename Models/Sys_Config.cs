using SqlSugar;
using System;
using System.ComponentModel.DataAnnotations;

namespace WebApplication7.Model
{
    #region Sys_Config 系统配置表
    /// <summary>
    /// 系统配置表
    /// </summary>
    [SugarTable("Sys_Config")]
    [DataFieldAttribute("Sys_Config")]
    public class Sys_Config : BaseModel
    {
        /// <summary>
        /// 配置编码
        /// </summary>
        [DataFieldAttribute("Code")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Code { get; set; }

        /// <summary>
        /// 配置名称
        /// </summary>
        [DataFieldAttribute("Name")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Name { get; set; }

        /// <summary>
        /// 配置值
        /// </summary>
        [DataFieldAttribute("ConfigValue")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string ConfigValue { get; set; }

        /// <summary>
        /// 配置分组
        /// </summary>
        [DataFieldAttribute("GroupCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string GroupCode { get; set; }

        /// <summary>
        /// 0:启用 1:禁用
        /// </summary>
        [DataFieldAttribute("Status")]
        public Int32? Status { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [DataFieldAttribute("SortIndex")]
        public Int32? SortIndex { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [DataFieldAttribute("Remark")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Remark { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        [DataFieldAttribute("AddTime")]
        public DateTime? AddTime { get; set; }
    }
    #endregion
}
