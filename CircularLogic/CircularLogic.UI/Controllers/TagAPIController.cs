using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Helpers;
using System.Web.Http;
using CircularLogic.Data;

namespace CircularLogic.UI.Controllers
{
    public class TagAPIController : ApiController
    {
        BlogRepository _repo = new BlogRepository();
        public List<string> Get()
        {
            return _repo.GetAllTags().Select(p => p.Name).ToList();
        }
    }
}
