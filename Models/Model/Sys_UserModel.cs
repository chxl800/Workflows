using System;

namespace WebApplication7.Model
{
    public class Sys_UserModel : Sys_User
    {
        public string OpenId { get; set; }
        public string StrAddTime { get; set; }
        public string StatusName { get; set; }
        public string SysRoleName { get; set; }
        public string SysDepartmentName { get; set; }
        public string PositionName { get; set; }
        public string ParentName { get; set; }
        public Int32? CommissionNum { get; set; }
        public long ParentId { get; set; }
        public long DetpId { get; set; }
        public bool LAY_CHECKED { get; set; }
        public string AuditGroupName { get; set; } 
        public string SettlementTypeName { get; set; }
        public int Selected { get; set; }
    }
}