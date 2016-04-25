using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CircularLogic.Data;
using CircularLogic.Models;
using CircularLogic.UI.Models;

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
            //aivm.BlogPosts = new List<BlogPost>();
            //aivm.BlogPosts.Add(new BlogPost() {CreationTime = DateTime.Now, Title  = "Test Title", QueueAction = QueueAction.New} );
            //aivm.BlogPosts.Add(new BlogPost() {CreationTime = DateTime.Now, Title  = "Test Title", QueueAction = QueueAction.New, BlogPostID = 5});
            //aivm.CategoryCountDictionary = new Dictionary<Category, int>();
            //aivm.CategoryCountDictionary.Add(new Category() {CategoryID = 5, Name = "Test"}, 3);
            aivm.CategoryCountDictionary = _repo.GetCategoryCount();
            return View(aivm);
        }

    }
}