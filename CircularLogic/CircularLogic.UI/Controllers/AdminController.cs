using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CircularLogic.Data;
using CircularLogic.Models;
using CircularLogic.UI.Models;
using Microsoft.AspNet.Identity;

namespace CircularLogic.UI.Controllers
{
    public class AdminController : Controller
    {
        private BlogRepository _repo = new BlogRepository();

        // GET: Admin
        //todo: require admin login
        public ActionResult Index()
        {
            AdminIndexVM aivm = new AdminIndexVM();
            aivm.BlogPosts = _repo.GetAdminQueue();
            var context = new ApplicationDbContext();
            foreach (QueuedBP bp in aivm.BlogPosts)
            {
                bp.UserName = context.Users.ToList().FirstOrDefault(u => u.Id == bp.UserID).UserName;
            }
            aivm.CategoryCountDictionary = _repo.GetCategoryCount();
            return View(aivm);
        }

        public ActionResult History()
        {
            List<BlogPost> userHistory =
                _repo.GetAllBlogPosts().Where(p => p.UserID == User.Identity.GetUserId()).ToList();
            return View();
        }

    }
}