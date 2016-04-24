using CircularLogic.Data;
using CircularLogic.Models;
using CircularLogic.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Mvc;

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
            var CreateBlogPostVM = new BlogPostViewModel();
            return View("CreateBlogPost", CreateBlogPostVM);
        }

        //Post : BlogPost / Create
        [HttpPost]
        public ActionResult CreateBlogDetails(BlogPostViewModel blogPost)
        {
            BlogPost newBlogPost = blogPost.BlogPost;
            _repo.CreateBlogPost(newBlogPost);
            return RedirectToAction("Index");
        }
    }
}