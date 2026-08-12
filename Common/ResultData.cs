using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication7.Common
{
    /// <summary>
    /// layui table数据返回对象
    /// </summary>
    public class ResultData
    {
        public int code { get; set; }
        public string msg { get; set; }
        public long count { get; set; }
        public int curr { get; set; }
        public int totPage { get; set; }
        public Object data { get; set; }
        public Object tzdata { get; set; }
        public Object extdata { get; set; }

        public Object data2 { get; set; }//2024-06-11 phh新增,库位管理用到
        /// <summary>
        /// 下一页的标识（对于某一些httpapi需要）
        /// </summary>
        public string nextQuery { get; set; } = string.Empty;
    }
}