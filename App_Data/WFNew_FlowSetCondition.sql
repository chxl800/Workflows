


-- ----------------------------
-- Table structure for WFNew_FlowSetCondition
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[WFNew_FlowSetCondition]') AND type IN ('U'))
	DROP TABLE [dbo].[WFNew_FlowSetCondition]
GO

CREATE TABLE [dbo].[WFNew_FlowSetCondition] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [ConditionCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [TemplateCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [SourceNodeCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [TargetNodeCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [ConditionName] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [BizField] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [Symbol] int  NULL,
  [CompareValue] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [LogicType] int  NULL,
  [GroupCode] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [ConditionExp] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [Priority] int  NULL,
  [AddTime] datetime  NULL,
  [AddUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [UpdateTime] datetime  NULL,
  [UpdateUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[WFNew_FlowSetCondition] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'条件编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'ConditionCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属模板编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'TemplateCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'来源节点编码（分支网关节点NodeCode）',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'SourceNodeCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'条件满足后跳转至目标节点编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'TargetNodeCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'条件名称，后台配置显示用',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'ConditionName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'业务表单字段名，用于页面配置回显',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'BizField'
GO

EXEC sp_addextendedproperty
'MS_Description', N'比较符号：0=等于 1=不等于 2=大于 3=大于等于 4=小于 5=小于等于 6=包含 7=不包含',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'Symbol'
GO

EXEC sp_addextendedproperty
'MS_Description', N'条件对比值',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'CompareValue'
GO

EXEC sp_addextendedproperty
'MS_Description', N'多条件逻辑 0 AND 1 OR',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'LogicType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'条件组编码，用于括号分组复杂条件',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'GroupCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'运行时生成完整条件表达式（缓存，用于执行）',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'ConditionExp'
GO

EXEC sp_addextendedproperty
'MS_Description', N'条件优先级，同一个网关多个条件按优先级匹配',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'Priority'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建人',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'AddUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'UpdateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改人',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition',
'COLUMN', N'UpdateUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'流程分支条件表，分支网关跳转规则',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetCondition'
GO


-- ----------------------------
-- Records of WFNew_FlowSetCondition
-- ----------------------------
SET IDENTITY_INSERT [dbo].[WFNew_FlowSetCondition] ON
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'1', N'COND20260808094651155_1', N'TPL20260808090913', N'NODE20260808094638157_1', N'NODE20260808094645181_2', N'是否已出库', N'IsOut', N'0', N'1', N'0', NULL, NULL, N'1', N'2026-08-08 09:54:29.340', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'2', N'COND20260808094901083_2', N'TPL20260808090913', N'NODE20260808094645181_2', N'NODE20260808094850212_4', N'', N'', N'0', N'', N'0', NULL, NULL, N'2', N'2026-08-08 09:54:29.347', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'3', N'COND20260808095054203_3', N'TPL20260808090913', N'NODE20260808094850212_4', N'NODE20260808095021724_6', N'', N'', N'0', N'', N'0', NULL, NULL, N'3', N'2026-08-08 09:54:29.350', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'4', N'COND20260808095121219_4', N'TPL20260808090913', N'NODE20260808095021724_6', N'NODE20260808095115092_7', N'', N'', N'0', N'', N'0', NULL, NULL, N'4', N'2026-08-08 09:54:29.353', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'5', N'COND20260808094651155_1', N'TPL20260808090913_V2', N'NODE20260808094638157_1', N'NODE20260808094645181_2', N'已出库', N'IsOut', N'0', N'1', N'0', NULL, NULL, N'1', N'2026-08-08 10:14:49.857', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'6', N'COND20260808094901083_2', N'TPL20260808090913_V2', N'NODE20260808094645181_2', N'NODE20260808094850212_4', N'', N'', N'0', N'', N'0', NULL, NULL, N'2', N'2026-08-08 10:14:49.863', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'7', N'COND20260808095054203_3', N'TPL20260808090913_V2', N'NODE20260808094850212_4', N'NODE20260808095021724_6', N'', N'', N'0', N'', N'0', NULL, NULL, N'3', N'2026-08-08 10:14:49.870', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'8', N'COND20260808095121219_4', N'TPL20260808090913_V2', N'NODE20260808095021724_6', N'NODE20260808095115092_7', N'', N'', N'0', N'', N'0', NULL, NULL, N'4', N'2026-08-08 10:14:49.873', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'9', N'COND20260808100926090_1', N'TPL20260808090913_V2', N'NODE20260808094638157_1', N'NODE20260808100851699_1', N'未出库', N'IsOut', N'0', N'0', N'0', NULL, NULL, N'5', N'2026-08-08 10:14:49.877', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'10', N'COND20260808101114210_2', N'TPL20260808090913_V2', N'NODE20260808100851699_1', N'NODE20260808101021891_2', N'', N'', N'0', N'', N'0', NULL, NULL, N'6', N'2026-08-08 10:14:49.880', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'11', N'COND20260808101133954_4', N'TPL20260808090913_V2', N'NODE20260808101021891_2', N'NODE20260808095115092_7', N'', N'', N'0', N'', N'0', NULL, NULL, N'7', N'2026-08-08 10:14:49.887', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'12', N'COND20260808094651155_1', N'TPL20260808090913_V3', N'NODE20260808094638157_1', N'NODE20260808094645181_2', N'已出库', N'IsOut', N'0', N'1', N'0', NULL, NULL, N'1', N'2026-08-08 11:35:32.683', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'13', N'COND20260808094901083_2', N'TPL20260808090913_V3', N'NODE20260808094645181_2', N'NODE20260808094850212_4', N'', N'', N'0', N'', N'0', NULL, NULL, N'2', N'2026-08-08 11:35:32.687', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'14', N'COND20260808095054203_3', N'TPL20260808090913_V3', N'NODE20260808094850212_4', N'NODE20260808095021724_6', N'', N'', N'0', N'', N'0', NULL, NULL, N'3', N'2026-08-08 11:35:32.690', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'15', N'COND20260808095121219_4', N'TPL20260808090913_V3', N'NODE20260808095021724_6', N'NODE20260808095115092_7', N'', N'', N'0', N'', N'0', NULL, NULL, N'4', N'2026-08-08 11:35:32.693', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'16', N'COND20260808100926090_1', N'TPL20260808090913_V3', N'NODE20260808094638157_1', N'NODE20260808100851699_1', N'未出库', N'IsOut', N'0', N'0', N'0', NULL, NULL, N'5', N'2026-08-08 11:35:32.697', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'17', N'COND20260808101114210_2', N'TPL20260808090913_V3', N'NODE20260808100851699_1', N'NODE20260808101021891_2', N'', N'', N'0', N'', N'0', NULL, NULL, N'6', N'2026-08-08 11:35:32.703', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'18', N'COND20260808101133954_4', N'TPL20260808090913_V3', N'NODE20260808101021891_2', N'NODE20260808095115092_7', N'', N'', N'0', N'', N'0', NULL, NULL, N'7', N'2026-08-08 11:35:32.707', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'19', N'COND20260808094651155_1', N'TPL20260808090913_V4', N'NODE20260808094638157_1', N'NODE20260808094645181_2', N'已出库', N'IsOut', N'0', N'1', N'0', NULL, NULL, N'1', N'2026-08-08 11:46:50.083', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'20', N'COND20260808094901083_2', N'TPL20260808090913_V4', N'NODE20260808094645181_2', N'NODE20260808094850212_4', N'', N'', N'0', N'', N'0', NULL, NULL, N'2', N'2026-08-08 11:46:50.087', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'21', N'COND20260808095054203_3', N'TPL20260808090913_V4', N'NODE20260808094850212_4', N'NODE20260808095021724_6', N'', N'', N'0', N'', N'0', NULL, NULL, N'3', N'2026-08-08 11:46:50.090', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'22', N'COND20260808095121219_4', N'TPL20260808090913_V4', N'NODE20260808095021724_6', N'NODE20260808095115092_7', N'', N'', N'0', N'', N'0', NULL, NULL, N'4', N'2026-08-08 11:46:50.093', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'23', N'COND20260808100926090_1', N'TPL20260808090913_V4', N'NODE20260808094638157_1', N'NODE20260808100851699_1', N'未出库', N'IsOut', N'0', N'0', N'0', NULL, NULL, N'5', N'2026-08-08 11:46:50.097', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'24', N'COND20260808101114210_2', N'TPL20260808090913_V4', N'NODE20260808100851699_1', N'NODE20260808101021891_2', N'', N'', N'0', N'', N'0', NULL, NULL, N'6', N'2026-08-08 11:46:50.100', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetCondition] ([Id], [ConditionCode], [TemplateCode], [SourceNodeCode], [TargetNodeCode], [ConditionName], [BizField], [Symbol], [CompareValue], [LogicType], [GroupCode], [ConditionExp], [Priority], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'25', N'COND20260808101133954_4', N'TPL20260808090913_V4', N'NODE20260808101021891_2', N'NODE20260808095115092_7', N'', N'', N'0', N'', N'0', NULL, NULL, N'7', N'2026-08-08 11:46:50.103', N'admin', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[WFNew_FlowSetCondition] OFF
GO


-- ----------------------------
-- Auto increment value for WFNew_FlowSetCondition
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[WFNew_FlowSetCondition]', RESEED, 25)
GO


-- ----------------------------
-- Primary Key structure for table WFNew_FlowSetCondition
-- ----------------------------
ALTER TABLE [dbo].[WFNew_FlowSetCondition] ADD CONSTRAINT [PK_WFNew_FlowSetCondition_Id] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

