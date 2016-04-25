using Microsoft.Build.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace CircularLogic.Models
{
    public class BlogPost
    {
        public int BlogPostID { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string UserID { get; set; }

        public DateTime? PostTime { get; set; }
        public DateTime? Expiration { get; set; }
        public DateTime CreationTime { get; set; }
        public DateTime UpdateTime { get; set; }
        public List<Tag> Tags { get; set; }

        public bool IsApproved { get; set; }

        [AllowHtml]
        public string HtmlContent { get; set; }

        public Image Image { get; set; }
        public Category Category { get; set; }
        public QueueAction QueueAction { get; set; }
    }
}