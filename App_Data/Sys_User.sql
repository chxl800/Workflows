

-- ----------------------------
-- Table structure for Sys_User
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_User]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_User]
GO

CREATE TABLE [dbo].[Sys_User] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [UserName] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserPwd] varchar(128) COLLATE Chinese_PRC_CI_AS  NULL,
  [FK_RoleId] bigint  NULL,
  [Name] nvarchar(128) COLLATE Chinese_PRC_CI_AS  NULL,
  [Status] int DEFAULT 0 NULL,
  [Remark] nvarchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserType] int DEFAULT 0 NULL,
  [ContactTel] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [SysDepartmentId] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsAudit] int  NULL,
  [NameImg] varchar(128) COLLATE Chinese_PRC_CI_AS  NULL,
  [PwdErrCount] int  NULL,
  [Token] varchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
  [ca_token] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [Del] int DEFAULT 0 NULL,
  [AddTime] datetime DEFAULT getdate() NULL,
  [FK_AddUserId] bigint  NULL,
  [UpdateTime] datetime  NULL,
  [FK_UpdateUserId] bigint  NULL,
  [AreaName] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [DriverName] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [SiteName] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [ManageSite] nvarchar(128) COLLATE Chinese_PRC_CI_AS  NULL,
  [SynAddTime] datetime DEFAULT getdate() NULL,
  [FK_SettlementTypeId] bigint  NULL,
  [CustomOrderNo] int DEFAULT 0 NULL,
  [FK_ProductGroupCode] varchar(128) COLLATE Chinese_PRC_CI_AS  NULL,
  [EmailAddr] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [VATNo] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [EoriNo] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [FK_ChannelNo] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [SdId] bigint  NULL,
  [FK_WarehouseCode] varchar(128) COLLATE Chinese_PRC_CI_AS  NULL,
  [FK_PostCode] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [FK_AuditGroupCode] varchar(32) COLLATE Chinese_PRC_CI_AS DEFAULT N'0' NULL,
  [SettlementType] int DEFAULT 0 NULL,
  [OgId] bigint  NULL,
  [HdjTempNo] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [InJobTime] date  NULL,
  [ParentUserNo] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParentUserName] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsPushAmz] int DEFAULT 1 NULL,
  [AppKey] varchar(32) COLLATE Chinese_PRC_CI_AS DEFAULT replace(newid(),'-','') NULL,
  [AppSecret] varchar(64) COLLATE Chinese_PRC_CI_AS DEFAULT replace(newid(),'-','') NULL,
  [PriceTempletCode] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [PasswordExpiration] int  NULL,
  [PasswordExpTime] datetime  NULL
)
GO

ALTER TABLE [dbo].[Sys_User] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'0:启用 1:禁用',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'Status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0:公司账号 1:客户账号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'UserType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否审核人',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'IsAudit'
GO

EXEC sp_addextendedproperty
'MS_Description', N'签名图片',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'NameImg'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码错误次数',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'PwdErrCount'
GO

EXEC sp_addextendedproperty
'MS_Description', N'用户登录成功token',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'Token'
GO

EXEC sp_addextendedproperty
'MS_Description', N'接口授权ID(客户数字代码)',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'ca_token'
GO

EXEC sp_addextendedproperty
'MS_Description', N'区域名称',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'AreaName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'司机名称',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'DriverName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'站点名称',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'SiteName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属站点',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'ManageSite'
GO

EXEC sp_addextendedproperty
'MS_Description', N'结算方式id',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'FK_SettlementTypeId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否允许自定义单号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'CustomOrderNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属产品组编号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'FK_ProductGroupCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'email地址',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'EmailAddr'
GO

EXEC sp_addextendedproperty
'MS_Description', N'vat税号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'VATNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'EoriNo号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'EoriNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'渠道编号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'FK_ChannelNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'速递用户id',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'SdId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属仓库',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'FK_WarehouseCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'职位编号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'FK_PostCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审核分组',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'FK_AuditGroupCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'结算类型 0:月结 1:日结',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'SettlementType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'速递用户所属组织id',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'OgId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'核对件模版编号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'HdjTempNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'入职时间',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'InJobTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'直属上级账号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'ParentUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'直属上级姓名',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'ParentUserName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'1:推送 0:不推送',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'IsPushAmz'
GO

EXEC sp_addextendedproperty
'MS_Description', N'AppKey',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'AppKey'
GO

EXEC sp_addextendedproperty
'MS_Description', N'AppSecret',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'AppSecret'
GO

EXEC sp_addextendedproperty
'MS_Description', N'价格模版编号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'PriceTempletCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码时效',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'PasswordExpiration'
GO

EXEC sp_addextendedproperty
'MS_Description', N'密码有效期',
'SCHEMA', N'dbo',
'TABLE', N'Sys_User',
'COLUMN', N'PasswordExpTime'
GO


-- ----------------------------
-- Auto increment value for Sys_User
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Sys_User]', RESEED, 75665)
GO


-- ----------------------------
-- Indexes structure for table Sys_User
-- ----------------------------
CREATE NONCLUSTERED INDEX [missing_index_460_459]
ON [dbo].[Sys_User] (
  [UserName] ASC
)
GO

CREATE NONCLUSTERED INDEX [missing_index_451_450]
ON [dbo].[Sys_User] (
  [UserType] ASC
)
INCLUDE ([UserName], [Name], [AreaName], [DriverName], [SiteName])
GO

CREATE NONCLUSTERED INDEX [missing_index_453_452]
ON [dbo].[Sys_User] (
  [UserType] ASC
)
INCLUDE ([Id], [UserName], [Name], [AreaName], [DriverName], [SiteName])
GO

CREATE UNIQUE NONCLUSTERED INDEX [missing_index_434_433]
ON [dbo].[Sys_User] (
  [UserName] ASC
)
INCLUDE ([FK_RoleId])
GO

CREATE NONCLUSTERED INDEX [missing_index_513_512]
ON [dbo].[Sys_User] (
  [UserName] ASC,
  [UserType] ASC,
  [Del] ASC
)
INCLUDE ([Id], [FK_RoleId], [Name], [AreaName], [DriverName], [SiteName])
GO

CREATE NONCLUSTERED INDEX [missing_index_516_515]
ON [dbo].[Sys_User] (
  [UserName] ASC,
  [UserType] ASC,
  [Del] ASC
)
INCLUDE ([Id], [UserPwd], [FK_RoleId], [Name], [Status], [Remark], [ContactTel], [SysDepartmentId], [IsAudit], [NameImg], [PwdErrCount], [Token], [ca_token], [AddTime], [FK_AddUserId], [UpdateTime], [FK_UpdateUserId], [AreaName], [DriverName], [SiteName], [ManageSite], [SynAddTime], [FK_SettlementTypeId], [CustomOrderNo], [FK_ProductGroupCode], [EmailAddr], [VATNo], [EoriNo], [FK_ChannelNo], [SdId])
GO

CREATE NONCLUSTERED INDEX [missing_index_510_509]
ON [dbo].[Sys_User] (
  [UserType] ASC,
  [Del] ASC,
  [Id] ASC
)
INCLUDE ([UserName], [FK_RoleId], [Name], [AreaName], [DriverName], [SiteName])
GO

CREATE NONCLUSTERED INDEX [missing_index_496_495]
ON [dbo].[Sys_User] (
  [Del] ASC,
  [Id] ASC
)
INCLUDE ([UserName], [FK_RoleId], [Name], [Status], [UserType], [SysDepartmentId], [AreaName], [DriverName], [SiteName])
GO

CREATE NONCLUSTERED INDEX [missing_index_627_626]
ON [dbo].[Sys_User] (
  [UserName] ASC
)
INCLUDE ([Name])
GO

CREATE NONCLUSTERED INDEX [missing_index_1090_1089]
ON [dbo].[Sys_User] (
  [UserName] ASC,
  [Status] ASC
)
INCLUDE ([Name])
GO

CREATE NONCLUSTERED INDEX [missing_index_1092_1091]
ON [dbo].[Sys_User] (
  [Status] ASC
)
INCLUDE ([UserName], [Name])
GO

CREATE NONCLUSTERED INDEX [missing_index_54_53]
ON [dbo].[Sys_User] (
  [Name] ASC
)
GO

CREATE NONCLUSTERED INDEX [missing_index_149_148]
ON [dbo].[Sys_User] (
  [UserType] ASC,
  [DriverName] ASC
)
INCLUDE ([Id], [UpdateTime], [FK_UpdateUserId])
GO

CREATE NONCLUSTERED INDEX [IX_9_8]
ON [dbo].[Sys_User] (
  [UserType] ASC
)
INCLUDE ([Id], [UserName], [Name], [AreaName], [DriverName], [SiteName], [CustomOrderNo])
GO

CREATE NONCLUSTERED INDEX [IX_29_28]
ON [dbo].[Sys_User] (
  [UserType] ASC
)
INCLUDE ([UserName], [UserPwd], [Name], [ca_token], [AddTime], [CustomOrderNo])
GO

CREATE NONCLUSTERED INDEX [IX_6_5]
ON [dbo].[Sys_User] (
  [UserType] ASC,
  [Id] ASC
)
INCLUDE ([UserName], [Name], [FK_ProductGroupCode], [SdId])
GO

CREATE NONCLUSTERED INDEX [IX_253_252]
ON [dbo].[Sys_User] (
  [UserType] ASC,
  [FK_PostCode] ASC
)
INCLUDE ([UserName], [Name], [SysDepartmentId])
GO

CREATE NONCLUSTERED INDEX [IX_251_250]
ON [dbo].[Sys_User] (
  [UserType] ASC,
  [FK_PostCode] ASC,
  [SysDepartmentId] ASC
)
INCLUDE ([UserName], [Name])
GO

CREATE NONCLUSTERED INDEX [IX_13734_13733]
ON [dbo].[Sys_User] (
  [ParentUserName] ASC
)
INCLUDE ([ParentUserNo])
GO

CREATE NONCLUSTERED INDEX [IX_50172_50171]
ON [dbo].[Sys_User] (
  [Del] ASC,
  [UserName] ASC
)
INCLUDE ([Name], [SysDepartmentId], [ParentUserNo], [ParentUserName])
GO

CREATE NONCLUSTERED INDEX [IX_50209_50208]
ON [dbo].[Sys_User] (
  [FK_RoleId] ASC,
  [UserType] ASC
)
INCLUDE ([UserName])
GO

CREATE NONCLUSTERED INDEX [IX_50174_50173]
ON [dbo].[Sys_User] (
  [DriverName] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_50325_50324]
ON [dbo].[Sys_User] (
  [Status] ASC,
  [FK_RoleId] ASC
)
GO

CREATE NONCLUSTERED INDEX [IX_50327_50326]
ON [dbo].[Sys_User] (
  [Status] ASC,
  [FK_RoleId] ASC
)
INCLUDE ([Name])
GO

CREATE NONCLUSTERED INDEX [IX_Sys_User_IsPushAmz]
ON [dbo].[Sys_User] (
  [IsPushAmz] ASC
)
INCLUDE ([UserName])
GO


-- ----------------------------
-- Primary Key structure for table Sys_User
-- ----------------------------
ALTER TABLE [dbo].[Sys_User] ADD CONSTRAINT [PK_SYS_USER] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

