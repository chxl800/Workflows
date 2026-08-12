using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace WebApplication7.Common
{
    public static class StringExtension
    {
        /// <summary>
        /// 判断是否为纯数字
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public static bool IsNumber(this string s)
        {
            if (string.IsNullOrWhiteSpace(s)) return false;
            const string pattern = "^[0-9]*$";
            Regex rx = new Regex(pattern);
            return rx.IsMatch(s);
        }
        /// <summary>
        /// 提取字符串中文部分
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static string ExtractChinese(this string input)
        {
            return Regex.Replace(input, @"[^\u4e00-\u9fff]", "");
        }
        /// <summary>
        /// 去除字符串中的中文
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static string RemoveChinese(this string input)
        {
            return Regex.Replace(input, @"[\u4e00-\u9fa5]", string.Empty);
        }
        /// <summary>
        /// 提取字符串数字部分
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static string ExtractNumber(this string input)
        {
            return Regex.Replace(input, @"[^\d]", "");
        }
        /// <summary>
        /// 将字符串转化为 UTF-8 字节数组
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public static byte[] SerializeUtf8(this string value)
        {
            return System.Text.Encoding.UTF8.GetBytes(value);
        }
        /// <summary>
        /// 指示指定的字符串是 null、空还是仅由空白字符组成。
        /// </summary>
        /// <param name="context"> 要测试的字符串。</param>
        /// <returns>如果 true 参数为 value 或 null，或者如果 System.String.Empty 仅由空白字符组成，则为 value。</returns>
        public static bool IsNullOrWhiteSpace(this string value)
        {
            return string.IsNullOrWhiteSpace(value);
        }
        /// <summary>
        /// 指示指定的字符串是 null 还是 System.String.Empty 字符串。
        /// </summary>
        /// <param name="value"> 要测试的字符串。</param>
        /// <returns>如果 true 参数为 value 或 null，或者如果 System.String.Empty 仅由空白字符组成，则为 value。</returns>
        public static bool IsNullOrEmpty(this string value)
        {
            return string.IsNullOrEmpty(value);
        }
        ///// <summary>
        ///// 将json字符串序列化为对象
        ///// </summary>
        ///// <typeparam name="T">目标对象</typeparam>
        ///// <param name="value">要转化的字符串</param>
        ///// <returns>如果成功则返回 T 对象实例，否则抛出 Exception</returns>
        //public static T JsonToObject<T>(this string value)
        //{
        //    return Newtonsoft.Json.JsonConvert.DeserializeObject<T>(value);
        //}

        public static string[] ToSplitArray(this string value, string split = ",", bool isRemoveEmpty = true)
        {
            try
            {
                if (value == null) return new string[] { };
                return value.Split(new string[] { split }, isRemoveEmpty ? StringSplitOptions.RemoveEmptyEntries : StringSplitOptions.None);
            }
            catch (Exception ex)
            {
                return new string[] { };
            }
        }
        public static string[] ToSplitArray(this string value, char[] split, bool isRemoveEmpty = true)
        {
            try
            {
                return value.Split(split, isRemoveEmpty ? StringSplitOptions.RemoveEmptyEntries : StringSplitOptions.None);
            }
            catch (Exception ex)
            {
                return new string[] { };
            }
        }
        public static List<string> ToList(this string value, char[] split, bool isRemoveEmpty = true)
        {
            try
            {
                return value.Split(split, isRemoveEmpty ? StringSplitOptions.RemoveEmptyEntries : StringSplitOptions.None).ToList();
            }
            catch (Exception ex)
            {
                return new List<string>();
            }
        }
        public static List<string> ToList(this string value, char split)
        {
            return value.Split(split).ToList();
        }
        /// <summary>
        /// base64编码
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static string ToBase64(this string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return string.Empty;
            }
            var buff = Encoding.UTF8.GetBytes(input);
            return Convert.ToBase64String(buff);
        }
        /// <summary>
        /// base64 解码
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static string FormBase64(this string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return string.Empty;
            }
            var buff = Convert.FromBase64String(input);

            return Encoding.UTF8.GetString(buff);
        }
        ///// <summary>
        ///// 将服务器图片相对路径转化为HTTP路径
        ///// </summary>
        ///// <param name="input"></param>
        ///// <param name="defaultImageType">默认图片类型，默认使用默认图</param>
        ///// <returns></returns>
        //public static string ToImageUrl(this string input, DefaultImageVlaueType defaultImageType = DefaultImageVlaueType.DefaultImage)
        //{
        //    var fileServerUrl = ConfigHelper.GetAppsettingValue(SowayConsts.FileServerUrl);
        //    string uploadPaths = "uploadFiles/";
        //    if (input.IsNullOrWhiteSpace())
        //    {
        //        if (defaultImageType == DefaultImageVlaueType.None)
        //        {
        //            return string.Empty;
        //        }
        //        else
        //        {
        //            //描述中应存放默认图片的地址
        //            return string.Format("{0}/{1}{2}", fileServerUrl, uploadPaths, defaultImageType.GetEnumDescription());
        //        }
        //    }
        //    if (input.StartsWith("http://") || input.StartsWith("https://"))
        //    {
        //        return input;
        //    }
        //    return string.Format("{0}/{1}{2}", fileServerUrl, uploadPaths, input.Replace('\\', '/'));
        //}
        /// <summary>
        /// 转为关联显示
        /// </summary>
        /// <param name="str">第一字符串</param>
        /// <param name="substr">子字符串</param>
        /// <param name="format">0=英文括号()，1=中文括号（），2=中文中括号【】</param>
        /// <returns></returns>
        public static string ToRelationString(this string str, string substr, int format = 1)
        {
            string newStr = string.Empty;
            if (substr.IsNullOrWhiteSpace())
            {
                return str;
            }
            if (str.IsNullOrWhiteSpace())
            {
                return newStr;
            }

            string formatStr = string.Empty;
            switch (format)
            {
                case 0:
                    formatStr = "{0}({1})";
                    break;
                case 1:
                    formatStr = "{0}（{1}）";
                    break;
                case 2:
                    formatStr = "{0}【{1}】";
                    break;
            }
            newStr = string.Format(formatStr, str, substr);
            return newStr;
        }

        /// <summary>
        /// 获取带*手机号
        /// </summary>
        /// <param name="mobile"></param>
        /// <returns></returns>
        public static string ToHideMobile(this string mobile)
        {
            if (mobile.IsNullOrWhiteSpace())
            {
                return "";
            }
            return $"{mobile.Substring(0, 4)}****{mobile.Substring(mobile.Length - 4)}";
        }
        /// <summary>
        /// 将网络图片路径转化为服务器相对路径（将下载网络图片并保存到文件服务器）
        /// </summary>
        /// <param name="input"></param>
        /// <param name="fileExt">保存文件扩展名（如：.jpg）</param>
        /// <returns></returns>
        //public static string ToShortImageUrl(this string input, string fileExt = ".jpg")
        //{
        //    if (input.IsNullOrWhiteSpace())
        //    {
        //        return string.Empty;
        //    }
        //    if (!input.StartsWith("http://") && !input.StartsWith("https://"))
        //    {
        //        return input;
        //    }

        //    var fileServerUrl = ConfigHelper.GetAppsettingValue(SowayConsts.FileServerUrl);
        //    string apiUrl = string.Format("{0}/api/File/UploadFileByNetworkFile", fileServerUrl);

        //    Dictionary<string, object> param = new Dictionary<string, object>()
        //    {
        //        { "FileUrl", input },
        //        { "FileExt", fileExt },
        //    };

        //    var resList = HttpHelper.HttpPost<BaseViewModel.BusinessBaseViewModel<BaseViewModel.FileUploadViewModel>>(apiUrl, param);
        //    if (resList.Status == ResponseStatus.Success && resList.BusinessData != null && resList.BusinessData.UploadResult != null && resList.BusinessData.UploadResult.Any())
        //    {
        //        //返回保存的文件服务器相对路径
        //        return resList.BusinessData.UploadResult.FirstOrDefault()?.ServerFilePath;
        //    }
        //    //不成功，返回原字符
        //    return input;
        //}

        /// <summary>
        /// 将url格式参数解析成字典
        /// </summary>
        /// <param name="urlQueryString"></param>
        /// <returns></returns>
        public static Dictionary<string, string> UrlToData(this string urlQueryString)
        {
            if (urlQueryString.IsNullOrWhiteSpace())
            {
                return null;
            }
            var dic = new Dictionary<string, string>();
            var queryKeyValueStr = urlQueryString.Split('&');
            if (queryKeyValueStr == null || queryKeyValueStr.Length == 0)
            {
                return null;
            }
            foreach (var queryKeyValue in queryKeyValueStr)
            {
                //dic[queryKeyValue.Split('=')[0]] = Utils.UrlDecode(queryKeyValue.Split('=')[1]);
                //    var keys = queryKeyValue.Split('=');
                //     dic[keys[0]] = keys[1];
            }
            return dic;
        }
        /// <summary>
        /// 将数字转化为 周几 文本表述方式
        /// </summary>
        /// <param name="weekDay"></param>
        /// <returns></returns>
        public static string ToWeek(this int weekDay)
        {

            switch (weekDay)
            {
                case 1: return "周一";
                case 2: return "周二";
                case 3: return "周三";
                case 4: return "周四";
                case 5: return "周五";
                case 6: return "周六";
                case 0:
                case 7: return "周日";
                default: return "";
            }
        }
    }
}
