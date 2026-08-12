

-- ----------------------------
-- Table structure for WFNew_FlowRunHistory
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[WFNew_FlowRunHistory]') AND type IN ('U'))
	DROP TABLE [dbo].[WFNew_FlowRunHistory]
GO

CREATE TABLE [dbo].[WFNew_FlowRunHistory] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [HistoryCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [InstanceCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [FromNodeCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [ToNodeCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [OperateType] int  NULL,
  [OperateUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [OperateUserName] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [Opinion] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [OperateTime] datetime  NULL,
  [FormData] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[WFNew_FlowRunHistory] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'历史记录编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunHistory',
'COLUMN', N'HistoryCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属实例编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunHistory',
'COLUMN', N'InstanceCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'来源节点编码，可为空（发起流程时）',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunHistory',
'COLUMN', N'FromNodeCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'到达目标节点编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunHistory',
'COLUMN', N'ToNodeCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作类型：0发起提交 1审批通过 2审批驳回 3撤回 4作废 5转办 6加签 7超时自动处理',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunHistory',
'COLUMN', N'OperateType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作人账号',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunHistory',
'COLUMN', N'OperateUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作人姓名',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunHistory',
'COLUMN', N'OperateUserName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作意见',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunHistory',
'COLUMN', N'Opinion'
GO

EXEC sp_addextendedproperty
'MS_Description', N'操作发生时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunHistory',
'COLUMN', N'OperateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'传的条件',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunHistory',
'COLUMN', N'FormData'
GO

EXEC sp_addextendedproperty
'MS_Description', N'流程流转历史轨迹',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunHistory'
GO


-- ----------------------------
-- Records of WFNew_FlowRunHistory
-- ----------------------------
SET IDENTITY_INSERT [dbo].[WFNew_FlowRunHistory] ON
GO

INSERT INTO [dbo].[WFNew_FlowRunHistory] ([Id], [HistoryCode], [InstanceCode], [FromNodeCode], [ToNodeCode], [OperateType], [OperateUserNo], [OperateUserName], [Opinion], [OperateTime], [FormData]) VALUES (N'1', N'HIS20260808135325267', N'INS20260808135325023', N'NODE20260808094638157_1', N'NODE20260808094645181_2', N'0', N'admin', N'测试', N'测试发起审批流程', N'2026-08-08 13:53:25.267', NULL)
GO

INSERT INTO [dbo].[WFNew_FlowRunHistory] ([Id], [HistoryCode], [InstanceCode], [FromNodeCode], [ToNodeCode], [OperateType], [OperateUserNo], [OperateUserName], [Opinion], [OperateTime], [FormData]) VALUES (N'2', N'HIS20260808154607359', N'INS20260808154607315', N'NODE20260808094638157_1', N'NODE20260808094645181_2', N'0', N'admin', N'测试', N'测试发起审批流程', N'2026-08-08 15:46:07.360', NULL)
GO

INSERT INTO [dbo].[WFNew_FlowRunHistory] ([Id], [HistoryCode], [InstanceCode], [FromNodeCode], [ToNodeCode], [OperateType], [OperateUserNo], [OperateUserName], [Opinion], [OperateTime], [FormData]) VALUES (N'3', N'HIS20260808161610768', N'INS20260808161610731', N'NODE20260808094638157_1', N'NODE20260808100851699_1', N'0', N'admin', N'测试', N'测试发起审批流程', N'2026-08-08 16:16:10.770', NULL)
GO

INSERT INTO [dbo].[WFNew_FlowRunHistory] ([Id], [HistoryCode], [InstanceCode], [FromNodeCode], [ToNodeCode], [OperateType], [OperateUserNo], [OperateUserName], [Opinion], [OperateTime], [FormData]) VALUES (N'4', N'HIS20260808165025372', N'INS20260808165025356', N'NODE20260808094638157_1', N'NODE20260808100851699_1', N'0', N'admin', N'测试', N'测试发起审批流程', N'2026-08-08 16:50:25.373', NULL)
GO

INSERT INTO [dbo].[WFNew_FlowRunHistory] ([Id], [HistoryCode], [InstanceCode], [FromNodeCode], [ToNodeCode], [OperateType], [OperateUserNo], [OperateUserName], [Opinion], [OperateTime], [FormData]) VALUES (N'5', N'HIS20260810111248094', N'INS20260808165025356', N'NODE20260808100851699_1', N'NODE20260808101021891_2', N'1', N'BTDXZ', N'向专', N'ok', N'2026-08-10 11:12:48.093', NULL)
GO

SET IDENTITY_INSERT [dbo].[WFNew_FlowRunHistory] OFF
GO


-- ----------------------------
-- Auto increment value for WFNew_FlowRunHistory
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[WFNew_FlowRunHistory]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table WFNew_FlowRunHistory
-- ----------------------------
ALTER TABLE [dbo].[WFNew_FlowRunHistory] ADD CONSTRAINT [PK_WFNew_FlowRunHistory_Id] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

