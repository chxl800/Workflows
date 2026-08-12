
-- ----------------------------
-- Table structure for WFNew_FlowRunInstance
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[WFNew_FlowRunInstance]') AND type IN ('U'))
	DROP TABLE [dbo].[WFNew_FlowRunInstance]
GO

CREATE TABLE [dbo].[WFNew_FlowRunInstance] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [InstanceCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [TemplateCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [TemplateVersion] int  NULL,
  [BizOrderNo] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [BizTableName] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [ApplyUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [ApplyUserName] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [InstanceStatus] int  NULL,
  [CurrentNodeCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [FormPageUrl] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [ApplyRemark] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [FinishTime] datetime  NULL,
  [AddTime] datetime  NULL,
  [AddUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [UpdateTime] datetime  NULL,
  [UpdateUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[WFNew_FlowRunInstance] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'流程实例唯一编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'InstanceCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'关联流程模板编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'TemplateCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发起时模板版本号，锁定模板，模板修改不影响老实例',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'TemplateVersion'
GO

EXEC sp_addextendedproperty
'MS_Description', N'业务单据号（你的工单单号，核心关联）',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'BizOrderNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'业务表名冗余',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'BizTableName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发起人账号',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'ApplyUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发起人姓名',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'ApplyUserName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'实例状态：0审批中 1审批全部通过 2被驳回 3发起人撤回 4作废终止',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'InstanceStatus'
GO

EXEC sp_addextendedproperty
'MS_Description', N'当前正在处理的节点编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'CurrentNodeCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'表单页面地址',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'FormPageUrl'
GO

EXEC sp_addextendedproperty
'MS_Description', N'发起时填写的备注',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'ApplyRemark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'流程完成时间（通过/驳回/作废）',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'FinishTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建人',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'AddUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'UpdateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改人',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance',
'COLUMN', N'UpdateUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'流程实例表：用户实际发起的一笔审批',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunInstance'
GO


-- ----------------------------
-- Records of WFNew_FlowRunInstance
-- ----------------------------
SET IDENTITY_INSERT [dbo].[WFNew_FlowRunInstance] ON
GO

INSERT INTO [dbo].[WFNew_FlowRunInstance] ([Id], [InstanceCode], [TemplateCode], [TemplateVersion], [BizOrderNo], [BizTableName], [ApplyUserNo], [ApplyUserName], [InstanceStatus], [CurrentNodeCode], [FormPageUrl], [ApplyRemark], [FinishTime], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'1', N'INS20260808135325023', N'TPL20260808090913_V4', N'4', N'ORD20260808135310', N'1', N'admin', N'测试', N'0', N'NODE20260808094645181_2', N'1', N'测试发起审批流程', NULL, N'2026-08-08 13:53:25.027', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowRunInstance] ([Id], [InstanceCode], [TemplateCode], [TemplateVersion], [BizOrderNo], [BizTableName], [ApplyUserNo], [ApplyUserName], [InstanceStatus], [CurrentNodeCode], [FormPageUrl], [ApplyRemark], [FinishTime], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'2', N'INS20260808154607315', N'TPL20260808090913_V4', N'4', N'ORD20260808154535', N'11', N'admin', N'测试', N'0', N'NODE20260808094645181_2', N'1', N'测试发起审批流程', NULL, N'2026-08-08 15:46:07.320', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowRunInstance] ([Id], [InstanceCode], [TemplateCode], [TemplateVersion], [BizOrderNo], [BizTableName], [ApplyUserNo], [ApplyUserName], [InstanceStatus], [CurrentNodeCode], [FormPageUrl], [ApplyRemark], [FinishTime], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'3', N'INS20260808161610731', N'TPL20260808090913_V4', N'4', N'ORD20260808161356', N'11', N'admin', N'测试', N'0', N'NODE20260808100851699_1', N'1', N'测试发起审批流程', NULL, N'2026-08-08 16:16:10.737', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowRunInstance] ([Id], [InstanceCode], [TemplateCode], [TemplateVersion], [BizOrderNo], [BizTableName], [ApplyUserNo], [ApplyUserName], [InstanceStatus], [CurrentNodeCode], [FormPageUrl], [ApplyRemark], [FinishTime], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'4', N'INS20260808165025356', N'TPL20260808090913_V4', N'4', N'ORD20260808161356-2', N'11', N'admin', N'测试', N'0', N'NODE20260808101021891_2', N'1', N'测试发起审批流程', NULL, N'2026-08-08 16:50:25.360', N'admin', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[WFNew_FlowRunInstance] OFF
GO


-- ----------------------------
-- Auto increment value for WFNew_FlowRunInstance
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[WFNew_FlowRunInstance]', RESEED, 4)
GO


-- ----------------------------
-- Primary Key structure for table WFNew_FlowRunInstance
-- ----------------------------
ALTER TABLE [dbo].[WFNew_FlowRunInstance] ADD CONSTRAINT [PK_WFNew_FlowRunInstance_Id] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

