using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CircularLogic.Models;

namespace CircularLogic.UI.Models
{
    public class AdminIndexVM
    {
        //public List<Category> Categories { get; set; }
        public Dictionary<Category, int> CategoryCountDictionary { get; set; }
        public List<QueuedBP> BlogPosts { get; set; }
        public List<BlogPost> BlogPostHistory { get; set; }
        public List<ApplicationUser> Users { get; set; }
    }
}