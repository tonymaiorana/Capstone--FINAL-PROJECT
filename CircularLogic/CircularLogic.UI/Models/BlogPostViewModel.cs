using CircularLogic.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CircularLogic.UI.Models
{
    public class BlogPostViewModel
    {
        public BlogPost BlogPost { get; set; }

        public List<SelectListItem> CategoryList { get; set; }

        public BlogPostViewModel()
        {
            //Will change listed items text and value once we confirm the categories (Hannah)
            CategoryList = new List<SelectListItem>
            {
                new SelectListItem {Text = "MVC", Value = "MVC"},
                new SelectListItem {Text = "jQuery", Value = "jQuery"},
                new SelectListItem {Text = "JavaScript", Value = "JavaScript"},
            };
        }
    }
}