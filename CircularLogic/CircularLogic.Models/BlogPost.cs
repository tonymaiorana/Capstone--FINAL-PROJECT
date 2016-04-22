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
        public string Title { get; set; }
        public User User { get; set; }
        public DateTime? PostTime { get; set; }
        public DateTime? Expiration { get; set; }
        public DateTime? CreationTime { get; set; }
        public DateTime UpdateTime { get; set; }
        public Tag Tag { get; set; }
        public Comment Comment { get; set; }
        public bool IsApproved { get; set; }

        [AllowHtml]
        public string HtmlContent { get; set; }

        public string Image { get; set; }
        public Category Category { get; set; }
    }
}