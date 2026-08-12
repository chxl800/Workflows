using SqlSugar;
using System;
using System.ComponentModel.DataAnnotations;

namespace WebApplication7.Model
{
	#region 用户表 Sys_User
    /// <summary>
    /// Sys_User
    /// </summary>
    [SugarTable("Sys_User")]
    [DataFieldAttribute("Sys_User")]
    public class Sys_User : BaseModel
    {
		/// <summary>
        /// appkey
        /// </summary>
        [DataFieldAttribute("AppKey")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string AppKey
        {
            get;
            set;
        }
        /// <summary>
        /// AppSecret
        /// </summary>
        [DataFieldAttribute("AppSecret")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string AppSecret
        {
            get;
            set;
        }
		/// <summary>
        /// 是否推送亚马逊
        /// </summary>
        [DataFieldAttribute("IsPushAmz")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public Int32? IsPushAmz
        {
            get;
            set;
        }
        /// <summary>
        /// 直属上级姓名
        /// </summary>
        [DataFieldAttribute("ParentUserName")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string ParentUserName
        {
            get;
            set;
        }
        /// <summary>
        /// 直属上级账号
        /// </summary>
        [DataFieldAttribute("ParentUserNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string ParentUserNo
        {
            get;
            set;
        }
		/// <summary>
        /// 入职时间
        /// </summary>
        [DataFieldAttribute("InJobTime")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public DateTime? InJobTime
        {
            get;
            set;
        }
		/// <summary>
        /// 核对件模版编号
        /// </summary>
        [DataFieldAttribute("HdjTempNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string HdjTempNo
        {
            get;
            set;
        }
        /// <summary>
        /// 结算类型 0:月结 1:日结
        /// </summary>
        [DataFieldAttribute("SettlementType")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public Int32? SettlementType
        {
            get;
            set;
        }
        /// <summary>
        /// 审核分组
        /// </summary>
        [DataFieldAttribute("FK_AuditGroupCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FK_AuditGroupCode
        {
            get;
            set;
        }
        /// <summary>
        /// 税号
        /// </summary>
        [DataFieldAttribute("VATNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string VATNo
        {
            get;
            set;
        }
        /// <summary>
        /// EORI编号
        /// </summary>
        [DataFieldAttribute("EoriNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string EoriNo
        {
            get;
            set;
        }
        /// <summary>
        /// 渠道编号
        /// </summary>
        [DataFieldAttribute("FK_ChannelNo")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FK_ChannelNo
        {
            get;
            set;
        }
        /// <summary>
        /// email地址
        /// </summary>
        [DataFieldAttribute("EmailAddr")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string EmailAddr
        {
			get;
			set;
		}
        /// <summary>
        /// 所属产品组编号
        /// </summary>
        [DataFieldAttribute("FK_ProductGroupCode")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string FK_ProductGroupCode
        {
			get;
			set;
		}
		/// <summary>
		/// 是否允许自定义单号
		/// </summary>
		[DataFieldAttribute("CustomOrderNo")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public Int32? CustomOrderNo
        {
			get;
			set;
		}
		/// <summary>
		/// 结算方式id
		/// </summary>
		[DataFieldAttribute("FK_SettlementTypeId")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public Int64? FK_SettlementTypeId
        {
			get;
			set;
		}
		/// <summary>
		/// 用户名
		/// </summary>
		[DataFieldAttribute("UserName")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string UserName
		{
			get;
			set;
		}
		/// <summary>
		/// 密码
		/// </summary>
		[DataFieldAttribute("UserPwd")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string UserPwd
		{
			get;
			set;
		}
		/// <summary>
		/// 速递id
		/// </summary>
		[DataFieldAttribute("SdId")]
		public Int64? SdId
        {
			get;
			set;
		}

        /// <summary>
        /// 速递组织架构id(2025-06-05 add app分仓子单绑定用到)
        /// </summary>
        [DataFieldAttribute("OgId")]
        public Int64? OgId
        {
            get;
            set;
        }
        

        /// <summary>
        /// 角色id
        /// </summary>
        [DataFieldAttribute("FK_RoleId")]
		public Int64? FK_RoleId
		{
			get;
			set;
		}
		/// <summary>
		/// 姓名
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
		/// 备注
		/// </summary>
		[DataFieldAttribute("Remark")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string Remark
		{
			get;
			set;
		}
		/// <summary>
		/// 0:公司账号 1:客户账号
		/// </summary>
		[DataFieldAttribute("UserType")]
		public Int32? UserType
		{
			get;
			set;
		}
		/// <summary>
		/// 联系电话
		/// </summary>
		[DataFieldAttribute("ContactTel")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string ContactTel
		{
			get;
			set;
		}
		/// <summary>
		/// 部门编号
		/// </summary>
		[DataFieldAttribute("SysDepartmentId")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string SysDepartmentId
		{
			get;
			set;
		}
		/// <summary>
		/// 是否审核人
		/// </summary>
		[DataFieldAttribute("IsAudit")]
		public Int32? IsAudit
		{
			get;
			set;
		}
		/// <summary>
		/// 签名图片
		/// </summary>
		[DataFieldAttribute("NameImg")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string NameImg
		{
			get;
			set;
		}
		/// <summary>
		/// 密码错误次数
		/// </summary>
		[DataFieldAttribute("PwdErrCount")]
		public Int32? PwdErrCount
		{
			get;
			set;
		}
		/// <summary>
		/// 用户登录成功token
		/// </summary>
		[DataFieldAttribute("Token")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string Token
		{
			get;
			set;
		}
		/// <summary>
		/// 接口授权ID(客户数字代码)
		/// </summary>
		[DataFieldAttribute("ca_token")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string ca_token
		{
			get;
			set;
		}
		/// <summary>
		/// 
		/// </summary>
		[DataFieldAttribute("Del")]
		public Int32? Del
		{
			get;
			set;
		}
		/// <summary>
		/// 
		/// </summary>
		[DataFieldAttribute("AddTime")]
		public DateTime? AddTime
		{
			get;
			set;
		}
		/// <summary>
		/// 
		/// </summary>
		[DataFieldAttribute("FK_AddUserId")]
		public Int64? FK_AddUserId
		{
			get;
			set;
		}
		/// <summary>
		/// 
		/// </summary>
		[DataFieldAttribute("UpdateTime")]
		public DateTime? UpdateTime
		{
			get;
			set;
		}
		/// <summary>
		/// 
		/// </summary>
		[DataFieldAttribute("FK_UpdateUserId")]
		public Int64? FK_UpdateUserId
		{
			get;
			set;
		}
		/// <summary>
		/// 区域名称
		/// </summary>
		[DataFieldAttribute("AreaName")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string AreaName
		{
			get;
			set;
		}
		/// <summary>
		/// 司机名称
		/// </summary>
		[DataFieldAttribute("DriverName")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string DriverName
		{
			get;
			set;
		}
		/// <summary>
		/// 站点名称
		/// </summary>
		[DataFieldAttribute("SiteName")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string SiteName
		{
			get;
			set;
		}
		/// <summary>
		/// 所属站点
		/// </summary>
		[DataFieldAttribute("ManageSite")]
		[DisplayFormat(ConvertEmptyStringToNull = false)]
		public string ManageSite
        {
			get;
			set;
		}

        /// <summary>
        /// 所属仓库
        /// </summary>
        [DataFieldAttribute("FK_WarehouseCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FK_WarehouseCode
        {
            get;
            set;
        }
		/// <summary>
        /// 职位编号
        /// </summary>
        [DataFieldAttribute("FK_PostCode")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FK_PostCode
        {
            get;
            set;
        }

        /// <summary>
        /// 密码时效
        /// </summary>
        [DataFieldAttribute("PasswordExpiration")]
        public Int32? PasswordExpiration
        {
            get;
            set;
        }

        /// <summary>
        /// 密码有效期
        /// </summary>
        [DataFieldAttribute("PasswordExpTime")]
        public DateTime? PasswordExpTime
        {
            get;
            set;
        }


    }
    #endregion
}
