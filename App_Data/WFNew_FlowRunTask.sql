

-- ----------------------------
-- Table structure for WFNew_FlowRunTask
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[WFNew_FlowRunTask]') AND type IN ('U'))
	DROP TABLE [dbo].[WFNew_FlowRunTask]
GO

CREATE TABLE [dbo].[WFNew_FlowRunTask] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [TaskCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [InstanceCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [NodeCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [AuditUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [AuditUserName] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [TaskStatus] int  NULL,
  [AuditOpinion] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [AuditTime] datetime  NULL,
  [TaskTimeoutTime] datetime  NULL,
  [AddTime] datetime  NULL,
  [AddUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[WFNew_FlowRunTask] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask',
'COLUMN', N'TaskCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属流程实例编码 FK WF_FlowInstance.InstanceCode',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask',
'COLUMN', N'InstanceCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'对应节点编码 FK WF_FlowNode.NodeCode',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask',
'COLUMN', N'NodeCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批人账号',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask',
'COLUMN', N'AuditUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批人姓名',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask',
'COLUMN', N'AuditUserName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务状态：0待审批 1同意通过 2驳回 3撤回 4任务作废 5转办转出 6加签任务',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask',
'COLUMN', N'TaskStatus'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批填写意见',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask',
'COLUMN', N'AuditOpinion'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批操作时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask',
'COLUMN', N'AuditTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'任务超时时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask',
'COLUMN', N'TaskTimeoutTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建人',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask',
'COLUMN', N'AddUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批任务表：待办、已办任务',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowRunTask'
GO


-- ----------------------------
-- Records of WFNew_FlowRunTask
-- ----------------------------
SET IDENTITY_INSERT [dbo].[WFNew_FlowRunTask] ON
GO

INSERT INTO [dbo].[WFNew_FlowRunTask] ([Id], [TaskCode], [InstanceCode], [NodeCode], [AuditUserNo], [AuditUserName], [TaskStatus], [AuditOpinion], [AuditTime], [TaskTimeoutTime], [AddTime], [AddUserNo]) VALUES (N'1', N'TASK202608081353252477005d1', N'INS20260808135325023', N'NODE20260808094645181_2', N'BTD-GH', N'郭浩', N'0', NULL, NULL, NULL, N'2026-08-08 13:53:25.247', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowRunTask] ([Id], [TaskCode], [InstanceCode], [NodeCode], [AuditUserNo], [AuditUserName], [TaskStatus], [AuditOpinion], [AuditTime], [TaskTimeoutTime], [AddTime], [AddUserNo]) VALUES (N'2', N'TASK2026080813532525868e6b5', N'INS20260808135325023', N'NODE20260808094645181_2', N'BTD-LFF', N'卢芳芳', N'0', NULL, NULL, NULL, N'2026-08-08 13:53:25.257', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowRunTask] ([Id], [TaskCode], [InstanceCode], [NodeCode], [AuditUserNo], [AuditUserName], [TaskStatus], [AuditOpinion], [AuditTime], [TaskTimeoutTime], [AddTime], [AddUserNo]) VALUES (N'3', N'TASK202608081353252637789c3', N'INS20260808135325023', N'NODE20260808094645181_2', N'BTDQS', N'屈松', N'0', NULL, NULL, NULL, N'2026-08-08 13:53:25.263', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowRunTask] ([Id], [TaskCode], [InstanceCode], [NodeCode], [AuditUserNo], [AuditUserName], [TaskStatus], [AuditOpinion], [AuditTime], [TaskTimeoutTime], [AddTime], [AddUserNo]) VALUES (N'4', N'TASK202608081546073449762d3', N'INS20260808154607315', N'NODE20260808094645181_2', N'BTD-GH', N'郭浩', N'0', NULL, NULL, NULL, N'2026-08-08 15:46:07.343', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowRunTask] ([Id], [TaskCode], [InstanceCode], [NodeCode], [AuditUserNo], [AuditUserName], [TaskStatus], [AuditOpinion], [AuditTime], [TaskTimeoutTime], [AddTime], [AddUserNo]) VALUES (N'5', N'TASK20260808154607350b8021f', N'INS20260808154607315', N'NODE20260808094645181_2', N'BTD-LFF', N'卢芳芳', N'0', NULL, NULL, NULL, N'2026-08-08 15:46:07.350', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowRunTask] ([Id], [TaskCode], [InstanceCode], [NodeCode], [AuditUserNo], [AuditUserName], [TaskStatus], [AuditOpinion], [AuditTime], [TaskTimeoutTime], [AddTime], [AddUserNo]) VALUES (N'6', N'TASK202608081546073544fac9d', N'INS20260808154607315', N'NODE20260808094645181_2', N'BTDQS', N'屈松', N'0', NULL, NULL, NULL, N'2026-08-08 15:46:07.353', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowRunTask] ([Id], [TaskCode], [InstanceCode], [NodeCode], [AuditUserNo], [AuditUserName], [TaskStatus], [AuditOpinion], [AuditTime], [TaskTimeoutTime], [AddTime], [AddUserNo]) VALUES (N'7', N'TASK202608081616107589a8d53', N'INS20260808161610731', N'NODE20260808100851699_1', N'BTDXZ', N'向专', N'0', NULL, NULL, NULL, N'2026-08-08 16:16:10.760', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowRunTask] ([Id], [TaskCode], [InstanceCode], [NodeCode], [AuditUserNo], [AuditUserName], [TaskStatus], [AuditOpinion], [AuditTime], [TaskTimeoutTime], [AddTime], [AddUserNo]) VALUES (N'8', N'TASK20260808161610764c93e53', N'INS20260808161610731', N'NODE20260808100851699_1', N'BTDYJX', N'姚金秀', N'0', NULL, NULL, NULL, N'2026-08-08 16:16:10.763', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowRunTask] ([Id], [TaskCode], [InstanceCode], [NodeCode], [AuditUserNo], [AuditUserName], [TaskStatus], [AuditOpinion], [AuditTime], [TaskTimeoutTime], [AddTime], [AddUserNo]) VALUES (N'9', N'TASK202608081650253655d701c', N'INS20260808165025356', N'NODE20260808100851699_1', N'BTDXZ', N'向专', N'1', N'ok', N'2026-08-10 11:12:48.093', NULL, N'2026-08-08 16:50:25.367', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowRunTask] ([Id], [TaskCode], [InstanceCode], [NodeCode], [AuditUserNo], [AuditUserName], [TaskStatus], [AuditOpinion], [AuditTime], [TaskTimeoutTime], [AddTime], [AddUserNo]) VALUES (N'10', N'TASK20260808165025369e6fd99', N'INS20260808165025356', N'NODE20260808100851699_1', N'BTDYJX', N'姚金秀', N'4', NULL, NULL, NULL, N'2026-08-08 16:50:25.370', N'admin')
GO

INSERT INTO [dbo].[WFNew_FlowRunTask] ([Id], [TaskCode], [InstanceCode], [NodeCode], [AuditUserNo], [AuditUserName], [TaskStatus], [AuditOpinion], [AuditTime], [TaskTimeoutTime], [AddTime], [AddUserNo]) VALUES (N'11', N'TASK20260810111248094c5e8fb', N'INS20260808165025356', N'NODE20260808101021891_2', N'BTDXZ', N'向专', N'0', NULL, NULL, NULL, N'2026-08-10 11:12:48.093', N'BTDXZ')
GO

SET IDENTITY_INSERT [dbo].[WFNew_FlowRunTask] OFF
GO


-- ----------------------------
-- Auto increment value for WFNew_FlowRunTask
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[WFNew_FlowRunTask]', RESEED, 11)
GO


-- ----------------------------
-- Primary Key structure for table WFNew_FlowRunTask
-- ----------------------------
ALTER TABLE [dbo].[WFNew_FlowRunTask] ADD CONSTRAINT [PK_WFNew_FlowRunTask_Id] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

