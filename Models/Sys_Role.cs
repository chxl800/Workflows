using SqlSugar;
using System;
using System.ComponentModel.DataAnnotations;

namespace WebApplication7.Model
{
    #region Sys_Role 角色表
    /// <summary>
    /// 角色表
    /// </summary>
    [SugarTable("Sys_Role")]
    [DataFieldAttribute("Sys_Role")]
    public class Sys_Role : BaseModel
    {
        /// <summary>
        /// 角色编号
        /// </summary>
        [DataFieldAttribute("Code")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Code { get; set; }

        /// <summary>
        /// 角色名称
        /// </summary>
        [DataFieldAttribute("Name")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Name { get; set; }

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

        /// <summary>
        /// 创建人
        /// </summary>
        [DataFieldAttribute("AddUserNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string AddUserNo { get; set; }
    }
    #endregion
}
