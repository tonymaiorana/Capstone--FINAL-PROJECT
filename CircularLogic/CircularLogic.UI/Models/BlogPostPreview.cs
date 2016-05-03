using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CircularLogic.UI.Models
{
    public class BlogPostPreview
    {
        public string Title { get; set; }
        public string Author { get; set; }
        public int ID { get; set; }
        public string Category { get; set; }
        public List<string> Tags { get; set; }
        public string Date { get; set; }
        public string Image { get; set; }
        public string Color { get; set; }
        [AllowHtml]
        public string Content { get; set; }
        public long DateTicks { get; set; }
    }
}