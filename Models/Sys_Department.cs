using SqlSugar;
using System;
using System.ComponentModel.DataAnnotations;

namespace WebApplication7.Model
{
    #region Sys_Department 组织架构
    /// <summary>
    /// 组织架构
    /// </summary>
    [SugarTable("Sys_Department")]
    [DataFieldAttribute("Sys_Department")]
    public class Sys_Department : BaseModel
    {
		/// <summary>
		/// 负责人账号
		/// </summary>
		[DataFieldAttribute("FzrUserNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FzrUserNo
        {
			get;
			set;
		}
        /// <summary>
        /// 负责人姓名
        /// </summary>
        [DataFieldAttribute("FzrUserName")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FzrUserName
        {
            get;
            set;
        }
        /// <summary>
        /// 部门编号
        /// </summary>
        [DataFieldAttribute("Code")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Code
		{
			get;
			set;
		}
        /// <summary>
        /// 部门名称
        /// </summary>
        [DataFieldAttribute("Name")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Name
		{
			get;
			set;
		}
		/// <summary>
		/// 0:启用 1:禁用
		/// </summary>
		[DataFieldAttribute("Status")]
		public Int32? Status
		{
			get;
			set;
		}
		/// <summary>
		/// 父id
		/// </summary>
		[DataFieldAttribute("ParentId")]
		public Int64? ParentId
		{
			get;
			set;
		}
		/// <summary>
		/// 创建时间
		/// </summary>
		[DataFieldAttribute("CreateTime")]
		public DateTime? CreateTime
		{
			get;
			set;
		}
		/// <summary>
		/// 创建人
		/// </summary>
		[DataFieldAttribute("Creater")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Creater
		{
			get;
			set;
		}
		/// <summary>
		/// 创建人ID
		/// </summary>
		[DataFieldAttribute("CreateId")]
		public Int64? CreateId
		{
			get;
			set;
		}
		/// <summary>
		/// 修改时间
		/// </summary>
		[DataFieldAttribute("ModifyTime")]
		public DateTime? ModifyTime
		{
			get;
			set;
		}
		/// <summary>
		/// 修改人
		/// </summary>
		[DataFieldAttribute("Modifier")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Modifier
		{
			get;
			set;
		}
		/// <summary>
		/// 修改人ID
		/// </summary>
		[DataFieldAttribute("ModifyId")]
		public Int64? ModifyId
		{
			get;
			set;
		}
        /// <summary>
        /// 是否已删除0:正常 1:已删除
        /// </summary>
        [DataFieldAttribute("Del")]
        public Int32? Del
        {
            get;
            set;
        }
    }
    #endregion
}
