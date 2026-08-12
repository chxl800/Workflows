using SqlSugar;
using System;
using System.Collections.Generic;

namespace WebApplication7.Common
{
    /// <summary>
    /// SqlSugar多数据库帮助类 SqlServer(0) MySql(1)
    /// </summary>
    public static class DBHelper
    {
        private static SqlSugarClient _db;

        /// <summary>
        /// 静态构造，只初始化一次
        /// </summary>
        static DBHelper()
        {
            _db = new SqlSugarClient(new List<ConnectionConfig>()
            {
                new ConnectionConfig()
                {
                    ConfigId="SqlServer",
                    DbType=DbType.SqlServer,
                    ConnectionString=Config.ConnectionString,
                    IsAutoCloseConnection=true
                },
                new ConnectionConfig()
                {
                    ConfigId="MySql",
                    DbType=DbType.MySql,
                    ConnectionString=Config.ConnectionString4,
                    IsAutoCloseConnection=true
                }
            });

            // 可选：打印Sql日志，调试用，上线注释
            //_db.Aop.OnLogExecuting = (sql, pars) =>
            //{
            //    System.Diagnostics.Debug.WriteLine(sql);
            //};
        }

        /// <summary>SqlServer 库 (ISqlSugarClient 仅用于查询)</summary>
        public static ISqlSugarClient SqlServerDb => _db.GetConnection("SqlServer");

        /// <summary>SqlServer 独立客户端 (每次创建新实例，避免并发连接冲突)</summary>
        public static SqlSugarClient SqlServerClient => new SqlSugarClient(new ConnectionConfig()
        {
            ConfigId = "SqlServer",
            DbType = DbType.SqlServer,
            ConnectionString = Config.ConnectionString,
            IsAutoCloseConnection = true
        });

        /// <summary>MySql库 ConfigId=1</summary>
        public static ISqlSugarClient MySqlDb => _db.GetConnection("MySql");

        /// <summary>按ConfigId获取库</summary>
        public static ISqlSugarClient GetDb(string configId)
        {
            return _db.GetConnection(configId);
        }

        public static SqlSugarClient GetMainClient() => _db;
    }
}