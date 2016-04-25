using CircularLogic.Data;
using CircularLogic.Models;
using CircularLogic.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace CircularLogic.UI.Controllers
{
    public class BlogPostController : Controller
    {
        private BlogRepository _repo = new BlogRepository();

        // GET: BlogPost
        public ActionResult Index()
        {
            return View();
        }

        // GET: BlogPost / Create
        public ActionResult CreateBlogPost()
        {
            string name = User.Identity.Name;
            string id = new ApplicationDbContext().Users.FirstOrDefault(u => u.UserName == name).Id;
            var CreateBlogPostVM = new BlogPostViewModel(new BlogPost() { UserID = id });
            return View("CreateBlogPost", CreateBlogPostVM);
        }

        // Post / BlogPost
        [HttpPost]
        public ActionResult CreateBlogPost(BlogPost blogPost)
        {
            _repo.CreateBlogPost(blogPost);

            return RedirectToAction("BlogHome");
        }

        public ActionResult BlogPostDetail(int blogPostID)
        {
            BlogPost blogPost = _repo.GetBlogPostByBlogID(blogPostID);
            return View(blogPost);
        }

        public ActionResult BlogHome()
        {
            var allPosts = _repo.GetAllBlogPosts().Where(p => p.IsApproved).OrderByDescending(p => p.CreationTime);

            return View();
        }
    }
}