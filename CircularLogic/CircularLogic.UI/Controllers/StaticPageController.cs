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

            return RedirectToAction("ViewStaticPage", new { id = id });
        }

        public ActionResult ViewStaticPage(int id)
        {
            var viewStaticPage = _repo.GetStaticPageByStaticPageID(id);
            ViewBag.Title = viewStaticPage.Title; 
            return View(viewStaticPage);
        }

        public ActionResult UpdateStaticPage(int id)
        {
            StaticPage spVM = new StaticPage();
            spVM = _repo.GetStaticPageByStaticPageID(id);
            return View(spVM);
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
            _repo.DeleteStaticPageByID(staticPage.StaticID);
            return RedirectToAction("Index");
        }

        public ActionResult DeleteStaticPage(int id)
        {
            var staticPageID = _repo.GetStaticPageByStaticPageID(id);

            return View(staticPageID);
        }

        [Authorize(Roles = "Admin")]
        public ActionResult Index()
        {
            var models = _repo.GetAllStaticPages();

            return View(models);
        }

        public PartialViewResult MenuDropDown()
        {
            return PartialView("_StaticList", _repo.GetAllStaticPages());
        }
    }
}