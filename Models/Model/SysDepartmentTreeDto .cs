using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication7.Model
{
    public class SysDepartmentTreeDto : Sys_Department
    {
        public List<SysDepartmentTreeDto> Children { get; set; } = new List<SysDepartmentTreeDto>();
    }
}