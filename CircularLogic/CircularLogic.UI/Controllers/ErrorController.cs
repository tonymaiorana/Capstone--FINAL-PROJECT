using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CircularLogic.UI.Controllers
{
    public class ErrorController : Controller
    {
        
        public ActionResult Index()
        {
            return View();
        }

        
        public ActionResult HttpError404()
        {
            return View();
        }


        public ActionResult HttpError500()
        {
            return View();
        }

        public ActionResult General()
        {
            return View();
        }
    }
}