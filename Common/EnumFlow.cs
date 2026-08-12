namespace WebApplication7.Common
{
    #region  新审批流

    /// <summary>
    /// 节点类型-WFNew_FlowSetNode-NodeType
    /// </summary>
    public enum ENodeType
    {
        开始节点 = 0,
        审批节点 = 1,
        //分支网关 = 2,
        结束节点 = 3,
    }

    /// <summary>
    /// 审批类型-WFNew_FlowSetNode-AuditType
    /// </summary>
    public enum EAuditType
    {
        指定人员 = 0,
        指定部门 = 1,
        //角色 = 2,
        提单人直属上级 = 3,
        部门负责人 = 4,
        提单人 = 5,
    }

    /// <summary>
    /// 比较符号-WFNew_FlowSetCondition-Symbol
    /// </summary>
    public enum ESymbol
    {
        等于 = 0,
        不等于 = 1,
        大于 = 2,
        大于等于 = 3,
        小于 = 4,
        小于等于 = 5,
        包含 = 6,
        不包含 = 7,
    }


    /// <summary>
    /// 任务状态-WFNew_FlowRunTask-TaskStatus
    /// </summary>
    public enum ETaskStatus
    {
        待审批 = 0,
        通过 = 1,
        驳回 = 2,

        撤回 = 3,
        作废 = 4,

        转办转出 = 5,
        加签任务 = 6,
    }

    /// <summary>
    /// 实例状态-WFNew_FlowRunInstance-InstanceStatus
    /// </summary>
    public enum EInstanceStatus
    {
        审批中 = 0,
        审批全部通过 = 1,
        被驳回 = 2,

        发起人撤回 = 3,
        作废终止 = 4,

    }

    /// <summary>
    /// 操作类型-WFNew_FlowRunHistory-OperateType
    /// </summary>
    public enum EOperateType
    {
        发起提交 = 0,
        审批通过 = 1,
        审批驳回 = 2,

        撤回 = 3,
        作废 = 4,

        转办 = 5,
        加签 = 6,
        超时自动处理 = 7,
    }

    /// <summary>
    /// 审核操作类型-WFNew_FlowRunTask
    /// </summary>
    public enum EAuditOperType
    {
        通过 = 1,
        驳回 = 2,
    }
    #endregion
}
