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

        // GET: BlogPost
        //public ActionResult Index()
        //{
        //ApplicationUser au = new ApplicationUser
        //{
        //    FirstName = "Bill",
        //    LastName = "Poulson"
        //};
        //List<Tag> tags = new List<Tag>();
        //Tag newTag = new Tag
        //{
        //    Name = "whoa a tag",
        //    TagID = 1
        //};
        //tags.Add(newTag);
        //tags.Add(newTag);
        //tags.Add(newTag);
        //BlogPost bp = new BlogPost
        //{
        //    Title = "This is a Blog Post Broski",
        //    Tags = tags
        //};

        //List<BlogPostViewModel> blogPostViewModels = new List<BlogPostViewModel>();

        //BlogPostViewModel one = new BlogPostViewModel(bp)
        //{
        //    User = au
        //};
        //BlogPostViewModel two = new BlogPostViewModel(bp)
        //{
        //    User = au
        //};
        //BlogPostViewModel three = new BlogPostViewModel(bp)
        //{
        //    User = au
        //};
        //BlogPostViewModel four = new BlogPostViewModel(bp)
        //{
        //    User = au
        //};
        //blogPostViewModels.Add(one);
        //blogPostViewModels.Add(two);
        //blogPostViewModels.Add(three);
        //blogPostViewModels.Add(four);
        //    return View("BlogHomePage", blogPostViewModels);
        //}

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
                    blogPost.Tags.Add(new Tag() {Name = s, TagID = 0});
                }
            }
            _repo.CreateBlogPost(blogPost);

            return RedirectToAction("BlogHomePage");
        }

        public ActionResult BlogPostDetail(int id)
        {
            BlogPost blogPost = _repo.GetBlogPostByBlogID(id);
            BlogPostViewModel blogPostVM = new BlogPostViewModel(blogPost);
            return View(blogPostVM);
        }

        public ActionResult BlogHomePage()
        {
            var allPosts = _repo.GetAllBlogPosts().Where(p => p.IsApproved).OrderByDescending(p => p.CreationTime);

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
    }
}