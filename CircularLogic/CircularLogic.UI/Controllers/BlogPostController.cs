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

            var listOfBlogViewModels = new List<BlogPostViewModel>();
            foreach (var blogPost in allPosts)
            {
                BlogPostViewModel bpVM = new BlogPostViewModel(blogPost);
                listOfBlogViewModels.Add(bpVM);
            }
            return View("BlogHomePage", listOfBlogViewModels);
        }
    }
}