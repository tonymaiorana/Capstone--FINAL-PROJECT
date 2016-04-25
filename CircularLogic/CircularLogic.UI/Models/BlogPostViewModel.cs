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
        public ApplicationUser User { get; set; }
        public List<SelectListItem> CategoryList { get; set; }

        public BlogPostViewModel(BlogPost bp)

        {
            BlogPost = bp;

            var context = new ApplicationDbContext();
            User = context.Users.ToList().FirstOrDefault(u => u.Id == bp.UserID);
            //Will change listed items text and value once we confirm the categories (Hannah)

            CategoryList = new List<SelectListItem>
            {
                new SelectListItem {Text = "Web Development", Value = "1"},
                new SelectListItem {Text = "Databases", Value = "2"},
                new SelectListItem {Text = "Object-oriented Programming", Value = "3"},
            };
        }
    }
}