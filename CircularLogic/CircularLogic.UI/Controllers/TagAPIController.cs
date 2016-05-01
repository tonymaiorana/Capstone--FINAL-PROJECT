using CircularLogic.Data;
using CircularLogic.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Helpers;
using System.Web.Http;

namespace CircularLogic.UI.Controllers
{
    public class TagAPIController : ApiController
    {
        private BlogRepository _repo = new BlogRepository();

        public List<string> Get()
        {
            return _repo.GetAllTags().Select(p => p.Name).ToList();
        }
    }
}