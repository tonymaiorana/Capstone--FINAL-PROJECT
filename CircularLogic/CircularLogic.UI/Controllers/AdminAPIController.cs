using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CircularLogic.UI.Models;

namespace CircularLogic.UI.Controllers
{
    public class AdminAPIController : ApiController
    {
        [HttpPost]
        public HttpResponseMessage Post(AllowDeny ad)
        {
            var response = Request.CreateResponse(HttpStatusCode.Accepted);
            return response;
        }
    }
}
