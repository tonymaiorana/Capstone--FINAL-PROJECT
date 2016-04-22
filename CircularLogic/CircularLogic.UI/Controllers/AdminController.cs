using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CircularLogic.UI.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        //todo: require admin login
        public ActionResult Index()
        {
            return View();
        }

    }
}