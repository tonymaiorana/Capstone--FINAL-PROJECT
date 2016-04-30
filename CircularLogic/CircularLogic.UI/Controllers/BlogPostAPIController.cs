using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CircularLogic.Data;
using CircularLogic.Models;
using CircularLogic.UI.Models;

namespace CircularLogic.UI.Controllers
{
    public class BlogPostAPIController : ApiController
    {
        private BlogRepository _repo = new BlogRepository();

        [HttpGet]
        public List<BlogPostPreview> GetPreviews()
        {
            var context = new ApplicationDbContext();

            List<BlogPostPreview> listToReturn = new List<BlogPostPreview>();

            foreach (BlogPost post in _repo.GetAllBlogPosts().ToList())
            {
                ApplicationUser user = context.Users.ToList().FirstOrDefault(u => u.Id == post.UserID);
                string fullname = user.FirstName + " " + user.LastName;
                BlogPostPreview bpp = new BlogPostPreview()
                {
                    Author = fullname,
                    Category = post.Category.Name,
                    ID = post.BlogPostID,
                    Title = post.Title
                };
                listToReturn.Add(bpp);
            }

            return listToReturn;
        }
    }
}
