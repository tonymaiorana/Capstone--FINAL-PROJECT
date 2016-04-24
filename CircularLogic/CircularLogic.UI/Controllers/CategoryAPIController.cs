using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CircularLogic.UI.Models;

namespace CircularLogic.UI.Controllers
{
    public class CategoryAPIController : ApiController
    {

        [HttpPost]
        public HttpResponseMessage Post(OtherPost op)
        {
            var response = Request.CreateResponse(HttpStatusCode.Accepted);
            return response;
        }
        
    }
}
