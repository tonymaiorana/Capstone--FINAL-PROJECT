using CircularLogic.Data;
using CircularLogic.Models;
using CircularLogic.UI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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

        //GET: BlogPost
        public ActionResult Index()
        {
            return View();
        }

        // GET: BlogPost / Create
        [Authorize]
        public ActionResult CreateBlogPost()
        {
            string name = User.Identity.Name;
            var firstOrDefault = new ApplicationDbContext().Users.FirstOrDefault(u => u.UserName == name);

            string id = firstOrDefault.Id;
            var CreateBlogPostVM = new BlogPostViewModel(new BlogPost() { UserID = id }, _repo.GetAllCategories());
            return View("CreateBlogPost", CreateBlogPostVM);
        }

        // Post / BlogPost
        [HttpPost]
        public ActionResult CreateBlogPost(BlogPost blogPost)
        {
            blogPost.CreationTime = DateTime.Now;
            blogPost.UpdateTime = DateTime.Now;
            if (User.IsInRole("Admin"))
            {
                blogPost.IsApproved = true;
            }
            else
            {
                blogPost.IsApproved = false;
            }
            string[] tags = this.Request.Form["hiddenTagListA"].Split(',');
            List<Tag> existingTags = _repo.GetAllTags();
            foreach (string s in tags)
            {
                Tag tag = existingTags.FirstOrDefault(t => t.Name.ToUpper() == s.ToUpper());
                if (tag != null)
                {
                    blogPost.Tags.Add(tag);
                }
                else
                {
                    blogPost.Tags.Add(new Tag() { Name = s, TagID = 0 });
                }
            }
            _repo.CreateBlogPost(blogPost);

            return RedirectToAction("BlogHomePage");
        }

        public ActionResult BlogPostDetail(int id)
        {
            BlogPost blogPost = _repo.GetBlogPostByBlogID(id);
            BlogPostViewModel blogPostVM = new BlogPostViewModel(blogPost);
            ViewBag.Title = blogPostVM.BlogPost.Title;
            return View(blogPostVM);
        }

        public ActionResult BlogHomePage(int? tagId)
        {
            IOrderedEnumerable<BlogPost> allPosts = _repo.GetAllBlogPosts().Where(p => p.IsApproved).OrderByDescending(p => p.CreationTime);
            if (tagId.HasValue)
            {
                allPosts = allPosts.Where(p => p.Tags.Any(t => t.TagID == tagId.Value)).OrderByDescending(p => p.CreationTime);
            }
            var listOfBlogViewModels = new List<BlogPostViewModel>();
            foreach (var blogPost in allPosts)
            {
                BlogPostViewModel bpVM = new BlogPostViewModel(blogPost);
                listOfBlogViewModels.Add(bpVM);
            }
            return View("BlogHomePage", listOfBlogViewModels);
        }

        public ActionResult AddCategory()
        {
            return PartialView("AddCategory");
        }

        public ActionResult EditBlog(int id)
        {
            BlogPostViewModel bpvm = new BlogPostViewModel(_repo.GetBlogPostByBlogID(id), _repo.GetAllCategories());
            return View(bpvm);
        }

        [HttpPost]
        public ActionResult EditBlog(BlogPost blogPost)
        {
            blogPost.CreationTime = DateTime.Now;
            blogPost.UpdateTime = DateTime.Now;
            if (User.IsInRole("Admin"))
            {
                blogPost.IsApproved = true;
            }
            else
            {
                blogPost.IsApproved = false;
            }
            string[] tags = this.Request.Form["hiddenTagListA"].Split(',');
            List<Tag> existingTags = _repo.GetAllTags();
            foreach (string s in tags)
            {
                Tag tag = existingTags.FirstOrDefault(t => t.Name.ToUpper() == s.ToUpper());
                if (tag != null)
                {
                    blogPost.Tags.Add(tag);
                }
                else
                {
                    blogPost.Tags.Add(new Tag() { Name = s, TagID = 0 });
                }
            }
            _repo.EditABlogPost(blogPost);
            return View();
        }

        public ActionResult Blogs()
        {
            return View();
        }

        public JsonResult GetTagCloudTags()
        {
            return Json(_repo.GetAllSumOfTags().Select(model => new
            {
                text = model.Name,
                weight = model.Weight,
                html = new { myId = model.TagCloudID, Class = "tagLink" }
            }), JsonRequestBehavior.AllowGet);
        }
    }
}