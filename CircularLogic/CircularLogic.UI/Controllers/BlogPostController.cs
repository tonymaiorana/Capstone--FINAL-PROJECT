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
            var CreateBlogPostVM = new BlogPostViewModel(new BlogPost() {UserID = id});
            return View("CreateBlogPost", CreateBlogPostVM);
        }

        //Post : BlogPost / Create
        //[HttpPost]
        //public ActionResult Create(BlogPost blogPost)
        //{
        //    if (ModelState.IsValid)
        //    {
        //    }
        //}
    }
}