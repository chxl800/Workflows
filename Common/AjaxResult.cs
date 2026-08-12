using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication7.Common
{
    public enum ResultCode
    {
        /// <summary>
        /// 100
        /// </summary>
        Info = 100,
        /// <summary>
        /// 200
        /// </summary>
        Succeed = 200,
        /// <summary>
        /// 300
        /// </summary>
        Failure = 300,
        /// <summary>
        /// 400
        /// </summary>
        PasswordError = 400,
        /// <summary>
        /// 登陆超时
        /// </summary>
        NoLogin = 401,
        /// <summary>
        /// 验证码错误
        /// </summary>
        VCode = -1,
        /// <summary>
        /// 扩展1
        /// </summary>
        ECode = -10,
        /// <summary>
        /// 服务器错误
        /// </summary>
        ServerError = 500,
        /// <summary>
        /// 系统更新
        /// </summary>
        SysUpdate = 600,
        /// <summary>
        /// 修改密码
        /// </summary>
        UpdatePwd = 700
    }
    public class AjaxResult
    {
        public AjaxResult()
        {
            Code = ResultCode.Succeed;
            Message = "操作成功；";
        }
        public object Data { get; set; }
        public int PageIndex { get; set; }
        public int PageTotal { get; set; }
        public long TotalCount { get; set; }
        public ResultCode Code { get; set; }
        public string Message { get; set; }
        public string ExMessage { get; set; }
    }

    public class MessageResult
    {
        public MessageResult()
        {
            Code = ResultCode.Succeed;
            Message = "成功";
        }
        public ResultCode Code { get; set; }
        public string Message { get; set; }
        public string CallbackUrl { get; set; }
    }
}