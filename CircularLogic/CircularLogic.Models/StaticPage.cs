using System;
using System.ComponentModel;
using System.Web.Mvc;
using Microsoft.Build.Framework;

namespace CircularLogic.Models
{
    public class StaticPage
    {
        public int StaticID { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        [AllowHtml]
        public string HtmlContent { get; set; }

        [Required]
        [DisplayName("Link Name")]
        public string LinkName { get; set; }

        public string RouteValue { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime UpdateTime { get; set; }
        public DateTime? CreationTime { get; set; }
        public DateTime? DeleteTime { get; set; }
        public Image Image { get; set; }
    }
}