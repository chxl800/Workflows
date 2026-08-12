using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication7.Common
{
    public static class Config
    {
        public static string ConnectionString
        {
            get
            {
                return System.Configuration.ConfigurationManager.AppSettings["SqlServerConn"];
            }
        }

        public static string ConnectionString4
        {
            get
            {
                return System.Configuration.ConfigurationManager.AppSettings["MySqlConn"];
            }
        }
    }
}