

-- ----------------------------
-- Table structure for Sys_Department
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_Department]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_Department]
GO

CREATE TABLE [dbo].[Sys_Department] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [Code] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [Name] nvarchar(128) COLLATE Chinese_PRC_CI_AS  NULL,
  [Status] int DEFAULT 0 NULL,
  [ParentId] bigint  NULL,
  [CreateTime] datetime  NULL,
  [Creater] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [CreateId] bigint  NULL,
  [ModifyTime] datetime  NULL,
  [Modifier] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [ModifyId] bigint  NULL,
  [Del] int DEFAULT 0 NULL,
  [FzrUserNo] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [FzrUserName] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Sys_Department] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'Id',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'Id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'科室编号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'Code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'科室名称',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'Name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0:启用 1:禁用',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'Status'
GO

EXEC sp_addextendedproperty
'MS_Description', N'父id',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'ParentId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'CreateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建人',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'Creater'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建人ID',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'CreateId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改时间',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'ModifyTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改人',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'Modifier'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改人ID',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'ModifyId'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0:正常 1:已删除',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'Del'
GO

EXEC sp_addextendedproperty
'MS_Description', N'负责人账号',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'FzrUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'负责人姓名',
'SCHEMA', N'dbo',
'TABLE', N'Sys_Department',
'COLUMN', N'FzrUserName'
GO


-- ----------------------------
-- Auto increment value for Sys_Department
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Sys_Department]', RESEED, 77)
GO


-- ----------------------------
-- Primary Key structure for table Sys_Department
-- ----------------------------
ALTER TABLE [dbo].[Sys_Department] ADD CONSTRAINT [PK_SYS_DEPARTMENT] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

