using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CircularLogic.UI.Models
{
    public class BlogPostPreview
    {
        public string Title { get; set; }
        public string Author { get; set; }
        public int ID { get; set; }
        public string Category { get; set; }
        public List<string> Tags { get; set; }
    }
}