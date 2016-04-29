using System;
using System.Web.Mvc;

namespace CircularLogic.Models
{
    public class StaticPage
    {
        public int StaticID { get; set; }
        public string Title { get; set; }
        [AllowHtml]
        public string HtmlContent { get; set; }
        public string RouteValue { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime UpdateTime { get; set; }
        public DateTime? CreationTime { get; set; }
        public DateTime? DeleteTime { get; set; }
        public Image Image { get; set; }
    }
}