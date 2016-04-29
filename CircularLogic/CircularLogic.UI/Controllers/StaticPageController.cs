using CircularLogic.Data;
using CircularLogic.Models;
using CircularLogic.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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

        public ActionResult UpdateStaticPage(int id)
        {
            StaticPage spVM = new StaticPage();
            return View();
        }

        [HttpPost]
        public ActionResult UpdateStaticPage(StaticPage staticPage)
        {
            staticPage.UpdateTime = DateTime.Now;

            _repo.UpdateAStaticPage(staticPage);
            return View();
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteStaticPage(StaticPage staticPage)
        {
            staticPage = _repo.GetStaticPageByStaticPageID(staticPage.StaticID);
            staticPage.DeleteTime = DateTime.Now;
            staticPage.IsDeleted = true;

            _repo.UpdateAStaticPage(staticPage);
            return View();
        }

        public ActionResult DeleteStaticPage(int staticID)
        {
            var staticPageID = _repo.GetStaticPageByStaticPageID(staticID);

            return View(staticPageID);
        }
    }
}