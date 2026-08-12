

-- ----------------------------
-- Table structure for WFNew_FlowSetTemplate
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[WFNew_FlowSetTemplate]') AND type IN ('U'))
	DROP TABLE [dbo].[WFNew_FlowSetTemplate]
GO

CREATE TABLE [dbo].[WFNew_FlowSetTemplate] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [TemplateCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [TemplateName] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [BizTableName] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [BizOrderField] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [FormPageUrl] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsEnable] int  NULL,
  [TemplateVersion] int  NULL,
  [AllowWithdraw] int  NULL,
  [CompleteProcCode] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [CompleteProcParam] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [RejectProcCode] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [RejectProcParam] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] datetime  NULL,
  [AddUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [UpdateTime] datetime  NULL,
  [UpdateUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[WFNew_FlowSetTemplate] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'Id',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'Id'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模板编码，唯一',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'TemplateCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模板名称',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'TemplateName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'关联业务主表名（工单表）',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'BizTableName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'业务单据单号字段名 如：OrderNo',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'BizOrderField'
GO

EXEC sp_addextendedproperty
'MS_Description', N'表单页面Url，发起/查看工单页面',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'FormPageUrl'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否启用 0禁用 1启用',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'IsEnable'
GO

EXEC sp_addextendedproperty
'MS_Description', N'模板版本号，修改模板版本+，老实例沿用旧版本',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'TemplateVersion'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否允许发起人撤回 0否 1是',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'AllowWithdraw'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批完成执行存储过程编码，空则不执行',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'CompleteProcCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'完成存储过程参数json',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'CompleteProcParam'
GO

EXEC sp_addextendedproperty
'MS_Description', N'驳回执行存储过程编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'RejectProcCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'驳回存储过程参数json',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'RejectProcParam'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注说明',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'Remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建人',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'AddUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'UpdateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改人',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate',
'COLUMN', N'UpdateUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'流程模板表：定义一套审批流程配置',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetTemplate'
GO


-- ----------------------------
-- Records of WFNew_FlowSetTemplate
-- ----------------------------
SET IDENTITY_INSERT [dbo].[WFNew_FlowSetTemplate] ON
GO

INSERT INTO [dbo].[WFNew_FlowSetTemplate] ([Id], [TemplateCode], [TemplateName], [BizTableName], [BizOrderField], [FormPageUrl], [IsEnable], [TemplateVersion], [AllowWithdraw], [CompleteProcCode], [CompleteProcParam], [RejectProcCode], [RejectProcParam], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'5', N'TPL20260808090913', N'1', N'1', N'1', N'1', N'0', N'1', N'1', NULL, NULL, NULL, NULL, N'1', N'2026-08-08 09:09:13.960', N'admin', N'2026-08-08 10:14:31.607', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowSetTemplate] ([Id], [TemplateCode], [TemplateName], [BizTableName], [BizOrderField], [FormPageUrl], [IsEnable], [TemplateVersion], [AllowWithdraw], [CompleteProcCode], [CompleteProcParam], [RejectProcCode], [RejectProcParam], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'7', N'TPL20260808090913_V2', N'1', N'1', N'1', N'1', N'0', N'2', N'1', NULL, NULL, NULL, NULL, N'1', N'2026-08-08 10:14:35.003', N'admin', N'2026-08-08 11:35:27.627', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowSetTemplate] ([Id], [TemplateCode], [TemplateName], [BizTableName], [BizOrderField], [FormPageUrl], [IsEnable], [TemplateVersion], [AllowWithdraw], [CompleteProcCode], [CompleteProcParam], [RejectProcCode], [RejectProcParam], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'8', N'TPL20260808090913_V3', N'1', N'1', N'1', N'1', N'0', N'3', N'1', NULL, NULL, NULL, NULL, N'1', N'2026-08-08 11:35:29.073', N'admin', N'2026-08-08 11:46:50.047', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowSetTemplate] ([Id], [TemplateCode], [TemplateName], [BizTableName], [BizOrderField], [FormPageUrl], [IsEnable], [TemplateVersion], [AllowWithdraw], [CompleteProcCode], [CompleteProcParam], [RejectProcCode], [RejectProcParam], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'9', N'TPL20260808090913_V4', N'11', N'11', N'1', N'1', N'1', N'4', N'1', NULL, NULL, NULL, NULL, N'1', N'2026-08-08 11:46:50.050', N'admin', N'2026-08-08 15:01:36.473', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowSetTemplate] ([Id], [TemplateCode], [TemplateName], [BizTableName], [BizOrderField], [FormPageUrl], [IsEnable], [TemplateVersion], [AllowWithdraw], [CompleteProcCode], [CompleteProcParam], [RejectProcCode], [RejectProcParam], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'10', N'TPL20260808142520', N'测试流程22', N'TestTable22', N'OrderNo', N'', N'0', N'1', N'1', NULL, NULL, NULL, NULL, N'1222', N'2026-08-08 14:25:20.403', N'admin', N'2026-08-10 10:04:28.760', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowSetTemplate] ([Id], [TemplateCode], [TemplateName], [BizTableName], [BizOrderField], [FormPageUrl], [IsEnable], [TemplateVersion], [AllowWithdraw], [CompleteProcCode], [CompleteProcParam], [RejectProcCode], [RejectProcParam], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'11', N'TPL20260808142520_V2', N'测试流程22', N'TestTable22', N'OrderNo', N'', N'0', N'2', N'1', NULL, NULL, NULL, NULL, N'1222', N'2026-08-10 10:04:28.763', N'admin', N'2026-08-10 15:15:05.993', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowSetTemplate] ([Id], [TemplateCode], [TemplateName], [BizTableName], [BizOrderField], [FormPageUrl], [IsEnable], [TemplateVersion], [AllowWithdraw], [CompleteProcCode], [CompleteProcParam], [RejectProcCode], [RejectProcParam], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'12', N'TPL20260808142520_V3', N'测试流程22', N'TestTable22', N'OrderNo', N'', N'1', N'3', N'1', NULL, NULL, NULL, NULL, N'1222', N'2026-08-10 15:15:06.023', N'admin', N'2026-08-10 15:15:06.023', N'admin')
GO

SET IDENTITY_INSERT [dbo].[WFNew_FlowSetTemplate] OFF
GO


-- ----------------------------
-- Auto increment value for WFNew_FlowSetTemplate
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[WFNew_FlowSetTemplate]', RESEED, 12)
GO


-- ----------------------------
-- Primary Key structure for table WFNew_FlowSetTemplate
-- ----------------------------
ALTER TABLE [dbo].[WFNew_FlowSetTemplate] ADD CONSTRAINT [PK_WFNew_FlowSetTemplate_Id] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

