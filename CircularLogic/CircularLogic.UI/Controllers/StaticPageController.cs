using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CircularLogic.Data;
using CircularLogic.Models;
using CircularLogic.UI.Models;

namespace CircularLogic.UI.Controllers
{
    public class StaticPageController : Controller
    {
        private StaticPageRepository _repo = new StaticPageRepository();

        // GET: StaticPage
        [Authorize]
        public ActionResult AddStaticPage()
        {
            var addStaticPage = new StaticPage();
            return View("AddStaticPage", addStaticPage);
        }

        [HttpPost]
        public ActionResult AddStaticPage(StaticPage staticPage)
        {
            staticPage.CreationTime = DateTime.Now;
            staticPage.UpdateTime = DateTime.Now;

            int id = _repo.AddAStaticPage(staticPage);

            return RedirectToAction("ViewStaticPage", new {id = id});
        }

        public ActionResult ViewStaticPage(int id)
        {
            var viewStaticPage = _repo.GetStaticPageByStaticPageID(id);
            return View(viewStaticPage);
        }
    }
}