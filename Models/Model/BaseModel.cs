using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebApplication7.Model
{
    [Serializable]
    public class BaseModel
    {
        [SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        [DataFieldAttribute("Id", "pk")]
        public Int64 Id { get; set; } 
    } 
}
