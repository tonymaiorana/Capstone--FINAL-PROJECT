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

        public BlogPostViewModel(BlogPost bp, List<Category> categories)

        {
            BlogPost = bp;

            var context = new ApplicationDbContext();
            User = context.Users.ToList().FirstOrDefault(u => u.Id == bp.UserID);

            CategoryList = new List<SelectListItem>();
            foreach (var category in categories)
            {
                CategoryList.Add(new SelectListItem() { Text = category.Name, Value = category.CategoryID.ToString() });
            }
        }

        public BlogPostViewModel(BlogPost bp)
        {
            BlogPost = bp;

            var context = new ApplicationDbContext();
            User = context.Users.ToList().FirstOrDefault(u => u.Id == bp.UserID);
        }
    }
}