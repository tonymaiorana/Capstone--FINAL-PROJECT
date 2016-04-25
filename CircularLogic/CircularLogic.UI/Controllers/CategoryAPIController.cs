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
    public class CategoryAPIController : ApiController
    {
        private BlogRepository _repo = new BlogRepository();

        [HttpPost]
        public HttpResponseMessage Post(OtherPost op)
        {
            _repo.DeleteCategory(op.id);
            var response = Request.CreateResponse(HttpStatusCode.Accepted);
            return response;
        }
        
    }
}
