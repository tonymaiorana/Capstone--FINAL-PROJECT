using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CircularLogic.Models;
using CircularLogic.UI.Models;

namespace CircularLogic.UI.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        //todo: require admin login
        public ActionResult Index()
        {
            AdminIndexVM aivm = new AdminIndexVM();
            aivm.BlogPosts = new List<BlogPost>();
            aivm.BlogPosts.Add(new BlogPost() {CreationTime = DateTime.Now, Title  = "Test Title"});
            aivm.CategoryCountDictionary = new Dictionary<Category, int>();
            aivm.CategoryCountDictionary.Add(new Category() {CategoryID = 5, Name = "Test"}, 3);
            return View(aivm);
        }

    }
}