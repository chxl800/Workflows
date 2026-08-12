using Newtonsoft.Json;
using System.Collections.Generic;

namespace WebApplication7.Model
{
    public class TreeModel
    {
        public string no { get; set; }
        public string name { get; set; }
        public string value { get; set; }
        public bool disabled { get; set; } = false;
        public bool selected { get; set; } = false;
        public bool isUser { get; set; } = false;

        public List<TreeModel> children = new List<TreeModel>();
    }

    public class LayuiTreeModel
    {
        /// <summary>
        /// 节点标题
        /// </summary>
        public string title { get; set; }
        /// <summary>
        /// 节点唯一索引值，用于对指定节点进行各类操作
        /// </summary>
        public string id { get; set; }
        /// <summary>
        /// 是否初始展开
        /// </summary>
        public bool spread { get; set; } = false;
        /// <summary>
        /// 是否选中
        /// </summary>
        [JsonProperty("checked")]
        public bool selected { get; set; } = false;
        /// <summary>
        /// 节点类型
        /// </summary>
        public int type { get; set; } = 0;
        /// <summary>
        /// 子节点
        /// </summary>
        public List<LayuiTreeModel> children = new List<LayuiTreeModel>();
    }
}
