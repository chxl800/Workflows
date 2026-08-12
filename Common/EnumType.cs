using System.ComponentModel;

namespace WebApplication7.Common
{
    /// <summary>
    /// 验证类型
    /// </summary>
    public enum ConditionType
    {
        客户,
        渠道,
        仓库代码,
        邮编
    }
    public enum DFeeTypeEnum
    {
        总价 = 82,
        单价
    }
    /// <summary>
    /// 计费标准
    /// </summary>
    public enum FeeStandardEnum
    {
        材积 = 85
    }
    /// <summary>
    /// 消息类型
    /// </summary>
    public enum MessageType
    {
        上传报关资料,
        退件通知,
        合并报关,
        合并清关,
        海关查验,
        海关放行,
        修改发票,
        操作费减免,
        国内仓查验通知,
        附加费申请,
        货量预报,
        核对产品信息
    }
    /// <summary>
    /// 扣件类型
    /// </summary>
    public enum FastenerType
    {
        住宅地址扣件 = 101,
        指定邮编扣件,
        总申报价大于指定值扣件,
        指定海关编码,
        指定客户账号
        //总申报价大于680扣件,
        //总申报价大于等于120扣件
    }

    public enum HighValueType
    {
        每公斤价值,
        总申报价,
        按箱总价值,
    }

    /// <summary>
    /// 审批类型
    /// </summary>
    public enum AuditType
    {
        指定人员审批 = 0,
        直属上级 = 1,
        //财务经理审批=2,
        //人事经理审批=3,
        //总经理审批=4,
        //董事长审批=5,
        部门审批 = 6,
        //申请人业务组长审批=7,
        部门负责人审批 = 8,
    }

    /// <summary>
    /// 节点类型
    /// </summary>
    public enum NodeType
    {
        开始,
        审批,
        分支,
        结束
    }

    /// <summary>
    /// 审核操作类型
    /// </summary>
    public enum AuditOperType
    {
        提交,
        审批
    }

    /// <summary>
    /// 申请单类型
    /// </summary>
    public enum FlowType
    {
        发票修改申请 = 1,
        下单审核 = 3,
        FBA账单支付审核,
        退件申请,
        附加费申请
    }

    /// <summary>
    /// 审核状态
    /// </summary>
    public enum ApplyStatus
    {
        草稿,
        待审核,
        审核中,
        已审核,
        已驳回,
        已作废
    }

    /// <summary>
    /// 小包订单状态
    /// </summary>
    public enum SP_OrderStatus
    {
        待处理 = 0,
        异常 = 3,
        发货 = 6,
        成功 = 9
    }

    /// <summary>
    /// 数据字典枚举
    /// </summary>
    public enum DictionaryEnum
    {
        是否递延 = 10,
        站点 = 13,
        区域 = 18,
        货物类型 = 23,
        FBA仓库代码 = 29,
        仓库类型 = 51,
        库位类型 = 54,
        车型 = 60,
        报关行单位 = 74,
        计费方式 = 80,
        计费标准,
        计费类型 = 86
    }

    /// <summary>
    /// 报关方式
    /// </summary>
    public enum AtCustomsEnum
    {
        否,
        单独报关,
        部分报关,
        合并报关
    }

    /// <summary>
    /// 订单状态
    /// </summary>
    public enum OrderStatus
    {
        待付款,
        待发货,
        已接单,
        配送中,
        已送达,
        已完成,
        已退款,
        已取消
    }

    /// <summary>
    /// 单据编号类型
    /// </summary>
    public enum OrderNumberType
    {
        /// <summary>
        /// 业务单号
        /// </summary>
        //BO,
        /// <summary>
        /// 待办编号
        /// </summary>
        WH,
        /// <summary>
        /// 客户下单单号
        /// </summary>
        PO,
        /// <summary>
        /// 重新导入订单电号
        /// </summary>
        RBO,
        /// <summary>
        /// 订单编号
        /// </summary>
        BAZ,
        /// <summary>
        /// 库位(WHP)绑定单号order-bind
        /// </summary>
        WHPOB,
        /// <summary>
        /// 库位(WHP)拣货单号picking
        /// </summary>
        WHPP,
        /// <summary>
        /// 库位(WHP)装柜单号ship-container
        /// </summary>
        WHPSC,
        /// <summary>
        /// FBA账单支付申请单号
        /// </summary>
        FP,
        /// <summary>
        /// 倒货计划单号
        /// </summary>
        DHJH,
        /// <summary>
        /// 工单号
        /// </summary>
        GD,
        /// <summary>
        /// 通知类型
        /// </summary>
        NT,
        /// <summary>
        /// 工单类型
        /// </summary>
        OT,
        /// <summary>
        /// 入库单号
        /// </summary>
        IW,
        /// <summary>
        /// 出单号
        /// </summary>
        OW,
        /// <summary>
        /// 
        /// </summary>
        SW,
        /// <summary>
        /// 
        /// </summary>
        FS,
        /// <summary>
        /// 货量预报
        /// </summary>
        YB,
        /// <summary>
        /// 账单号
        /// </summary>
        ZD,

        /// <summary>
        /// 发票
        /// </sum
        VAT,
    }

    /// <summary>
    /// 广告类型
    /// </summary>
    public enum AdTypee
    {
        首页广告
    }

    /// <summary>
    /// 文章类型
    /// </summary>
    public enum NewsTypee
    {
        平台申明,
        关于我们,
        服务热线,
        商家入驻协议,
        分销商说明,
        其他 = 99
    }

    public enum LogEType
    {
        模块管理,
        广告管理,
        文章管理,
        数据字典,
        员工管理,
        角色管理,
        部门管理,
        IP地址管理,
        站点参数设置,
        菜单管理,
        按钮管理,
        订单管理,
        订单提交,
        附件管理,
        分配客户,
        客户管理,
        收货下单,
        物料管理,
        仓库录单,
        附加费
    }

    /// <summary>
    /// 代码前缀
    /// </summary>
    public enum CodePrefix
    {
        /// <summary>
        /// btd
        /// </summary>
        BTD
    }

    public enum FileType
    {
        报关资料,
        递延资料,
        清关资料,
        商检资料,
        投保资料,
        FBA标签 = 10,
        报关底单,
        司机纸单,
        税金单 = 14,
        提单资料,
        报关核对件,
        备案文件 = 21,
        电池资料,
        认证资料,
        电放资料,
        国外税金单,
        POD资料
    }





   
}