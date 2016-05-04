using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CircularLogic.Data;
using CircularLogic.UI.Models;

namespace CircularLogic.UI.Controllers
{
    public class AdminAPIController : ApiController
    {
        private BlogRepository _repo = new BlogRepository();

        [HttpPost]
        public HttpResponseMessage Post(AllowDeny ad)
        {
            if (ad != null)
            {
                _repo.AdminQueueUpdate(ad.allowedBP, ad.deniedBP);
            }
            var response = Request.CreateResponse(HttpStatusCode.Accepted);
            return response;
        }

        [HttpPost]
        public HttpResponseMessage DeleteBlogPost(int id)
        {
            // repo delete blog post
            _repo.DeleteABlog(id, true);
            var response = Request.CreateResponse(HttpStatusCode.Accepted);
            return response;
        }

        [HttpPost]
        public HttpResponseMessage RequestDeleteBlogPost(int id)
        {
            // repo delete blog post
            _repo.DeleteABlog(id, false);
            var response = Request.CreateResponse(HttpStatusCode.Accepted);
            return response;
        }
        [HttpPost]
        public HttpResponseMessage DeleteQueuedAction(int id)
        {
            // repo delete blog post
            _repo.AdminQueueUpdate(null, new []{id});
            var response = Request.CreateResponse(HttpStatusCode.Accepted);
            return response;
        }
    }
}
