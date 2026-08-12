

-- ----------------------------
-- Table structure for WFNew_FlowSetNode
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[WFNew_FlowSetNode]') AND type IN ('U'))
	DROP TABLE [dbo].[WFNew_FlowSetNode]
GO

CREATE TABLE [dbo].[WFNew_FlowSetNode] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [NodeCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [TemplateCode] varchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
  [NodeName] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [NodeType] int  NULL,
  [NodeSort] int  NULL,
  [AuditType] int  NULL,
  [AuditDeptCode] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [AuditUserNos] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [AuditRoleCode] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsCounterSign] int  NULL,
  [AllowTransfer] int  NULL,
  [AllowAddSign] int  NULL,
  [TimeoutHour] int  NULL,
  [TimeoutHandleType] int  NULL,
  [NodePageUrl] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [Remark] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [AddTime] datetime  NULL,
  [AddUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [UpdateTime] datetime  NULL,
  [UpdateUserNo] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[WFNew_FlowSetNode] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'节点编码，模板内唯一',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'NodeCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'所属模板编码 FK WF_FlowTemplate.TemplateCode',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'TemplateCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'节点名称',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'NodeName'
GO

EXEC sp_addextendedproperty
'MS_Description', N'节点类型 0=开始节点 1=审批节点 2=分支网关 3=结束节点',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'NodeType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'节点排序序号',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'NodeSort'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批类型：0指定人员 1指定部门 2角色 3提单人直属上级 4部门负责人 5提单人',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'AuditType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审核部门编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'AuditDeptCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审核账号，多个逗号分隔',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'AuditUserNos'
GO

EXEC sp_addextendedproperty
'MS_Description', N'角色编码',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'AuditRoleCode'
GO

EXEC sp_addextendedproperty
'MS_Description', N'会签或签：0或签(一人通过即过) 1会签(全部需要审批)',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'IsCounterSign'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否允许转办 0否 1是',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'AllowTransfer'
GO

EXEC sp_addextendedproperty
'MS_Description', N'是否允许加签 0否 1是',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'AllowAddSign'
GO

EXEC sp_addextendedproperty
'MS_Description', N'审批超时小时数，0不超时',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'TimeoutHour'
GO

EXEC sp_addextendedproperty
'MS_Description', N'超时处理：0无处理 1自动通过 2自动驳回',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'TimeoutHandleType'
GO

EXEC sp_addextendedproperty
'MS_Description', N'节点页面url，可覆盖模板表单地址',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'NodePageUrl'
GO

EXEC sp_addextendedproperty
'MS_Description', N'备注',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'Remark'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'AddTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'创建人',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'AddUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改时间',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'UpdateTime'
GO

EXEC sp_addextendedproperty
'MS_Description', N'修改人',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode',
'COLUMN', N'UpdateUserNo'
GO

EXEC sp_addextendedproperty
'MS_Description', N'流程节点表：开始、审批、分支、结束节点',
'SCHEMA', N'dbo',
'TABLE', N'WFNew_FlowSetNode'
GO


-- ----------------------------
-- Records of WFNew_FlowSetNode
-- ----------------------------
SET IDENTITY_INSERT [dbo].[WFNew_FlowSetNode] ON
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'1', N'NODE20260808094638157_1', N'TPL20260808090913', N'开始节点', N'0', N'1', N'0', NULL, N'', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":112,"y":36}', N'2026-08-08 09:54:29.300', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'2', N'NODE20260808094645181_2', N'TPL20260808090913', N'渠道', N'1', N'2', N'0', NULL, N'User1', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":402,"y":35}', N'2026-08-08 09:54:29.323', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'3', N'NODE20260808094850212_4', N'TPL20260808090913', N'仓库', N'1', N'3', N'0', NULL, N'User2', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":693,"y":34}', N'2026-08-08 09:54:29.327', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'4', N'NODE20260808095021724_6', N'TPL20260808090913', N'财务', N'1', N'4', N'0', NULL, N'User3', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":999,"y":36}', N'2026-08-08 09:54:29.330', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'5', N'NODE20260808095115092_7', N'TPL20260808090913', N'结束节点', N'3', N'5', N'0', NULL, N'', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":1290,"y":35}', N'2026-08-08 09:54:29.337', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'6', N'NODE20260808094638157_1', N'TPL20260808090913_V2', N'开始节点', N'0', N'1', N'0', NULL, N'', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":112,"y":36}', N'2026-08-08 10:14:47.163', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'7', N'NODE20260808094645181_2', N'TPL20260808090913_V2', N'渠道', N'1', N'2', N'0', NULL, N'User1', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":402,"y":35}', N'2026-08-08 10:14:49.833', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'8', N'NODE20260808094850212_4', N'TPL20260808090913_V2', N'仓库', N'1', N'3', N'0', NULL, N'User2', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":693,"y":34}', N'2026-08-08 10:14:49.837', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'9', N'NODE20260808095021724_6', N'TPL20260808090913_V2', N'财务', N'1', N'4', N'0', NULL, N'User3', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":999,"y":36}', N'2026-08-08 10:14:49.840', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'10', N'NODE20260808095115092_7', N'TPL20260808090913_V2', N'结束节点', N'3', N'5', N'0', NULL, N'', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":1223,"y":174}', N'2026-08-08 10:14:49.847', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'11', N'NODE20260808100851699_1', N'TPL20260808090913_V2', N'渠道', N'1', N'6', N'0', NULL, N'User1', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":404,"y":182}', N'2026-08-08 10:14:49.850', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'12', N'NODE20260808101021891_2', N'TPL20260808090913_V2', N'仓库', N'1', N'7', N'4', NULL, N'User1', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":699,"y":179}', N'2026-08-08 10:14:49.853', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'13', N'NODE20260808094638157_1', N'TPL20260808090913_V3', N'开始节点', N'0', N'1', N'0', NULL, N'', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":112,"y":36}', N'2026-08-08 11:35:32.620', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'14', N'NODE20260808094645181_2', N'TPL20260808090913_V3', N'渠道', N'1', N'2', N'0', NULL, N'BTD-LFF,BTD-GH,BTDQS', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":402,"y":35}', N'2026-08-08 11:35:32.657', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'15', N'NODE20260808094850212_4', N'TPL20260808090913_V3', N'仓库', N'1', N'3', N'0', NULL, N'User2', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":693,"y":34}', N'2026-08-08 11:35:32.660', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'16', N'NODE20260808095021724_6', N'TPL20260808090913_V3', N'财务', N'1', N'4', N'0', NULL, N'User3', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":999,"y":36}', N'2026-08-08 11:35:32.667', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'17', N'NODE20260808095115092_7', N'TPL20260808090913_V3', N'结束节点', N'3', N'5', N'0', NULL, N'', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":1223,"y":174}', N'2026-08-08 11:35:32.670', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'18', N'NODE20260808100851699_1', N'TPL20260808090913_V3', N'渠道', N'1', N'6', N'4', NULL, N'1001,1002', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":404,"y":182}', N'2026-08-08 11:35:32.673', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'19', N'NODE20260808101021891_2', N'TPL20260808090913_V3', N'仓库', N'1', N'7', N'4', NULL, N'User1', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":699,"y":179}', N'2026-08-08 11:35:32.677', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'20', N'NODE20260808094638157_1', N'TPL20260808090913_V4', N'开始节点', N'0', N'1', N'0', NULL, N'', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":112,"y":36}', N'2026-08-08 11:46:50.060', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'21', N'NODE20260808094645181_2', N'TPL20260808090913_V4', N'渠道', N'1', N'2', N'0', NULL, N'BTD-LFF,BTD-GH,BTDQS', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":402,"y":35}', N'2026-08-08 11:46:50.063', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'22', N'NODE20260808094850212_4', N'TPL20260808090913_V4', N'仓库', N'1', N'3', N'0', NULL, N'BTDXZ', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":693,"y":34}', N'2026-08-08 11:46:50.067', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'23', N'NODE20260808095021724_6', N'TPL20260808090913_V4', N'财务', N'1', N'4', N'0', NULL, N'User3', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":999,"y":36}', N'2026-08-08 11:46:50.070', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'24', N'NODE20260808095115092_7', N'TPL20260808090913_V4', N'结束节点', N'3', N'5', N'0', NULL, N'', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":1223,"y":174}', N'2026-08-08 11:46:50.073', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'25', N'NODE20260808100851699_1', N'TPL20260808090913_V4', N'渠道', N'1', N'6', N'4', NULL, N'1001,1002', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":404,"y":182}', N'2026-08-08 11:46:50.077', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'26', N'NODE20260808101021891_2', N'TPL20260808090913_V4', N'仓库', N'1', N'7', N'0', NULL, N'BTDXZ', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":699,"y":179}', N'2026-08-08 11:46:50.080', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'27', N'NODE20260810100426012_1', N'TPL20260808142520_V2', N'开始节点', N'0', N'1', N'0', NULL, N'', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":252,"y":59}', N'2026-08-10 10:04:28.803', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'28', N'NODE20260810100426012_1', N'TPL20260808142520_V3', N'开始节点', N'0', N'1', N'0', NULL, N'', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":252,"y":59}', N'2026-08-10 15:15:06.063', N'admin', NULL, NULL)
GO

INSERT INTO [dbo].[WFNew_FlowSetNode] ([Id], [NodeCode], [TemplateCode], [NodeName], [NodeType], [NodeSort], [AuditType], [AuditDeptCode], [AuditUserNos], [AuditRoleCode], [IsCounterSign], [AllowTransfer], [AllowAddSign], [TimeoutHour], [TimeoutHandleType], [NodePageUrl], [Remark], [AddTime], [AddUserNo], [UpdateTime], [UpdateUserNo]) VALUES (N'29', N'NODE20260810151419833_1', N'TPL20260808142520_V3', N'审批节点', N'1', N'2', N'5', NULL, N'', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'{"x":550,"y":63}', N'2026-08-10 15:15:06.070', N'admin', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[WFNew_FlowSetNode] OFF
GO


-- ----------------------------
-- Auto increment value for WFNew_FlowSetNode
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[WFNew_FlowSetNode]', RESEED, 29)
GO


-- ----------------------------
-- Primary Key structure for table WFNew_FlowSetNode
-- ----------------------------
ALTER TABLE [dbo].[WFNew_FlowSetNode] ADD CONSTRAINT [PK_WFNew_FlowSetNode_Id] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

