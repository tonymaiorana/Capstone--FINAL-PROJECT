using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace CircularLogic.UI
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");


            routes.MapRoute(
               name: "Create Blog Post",
               url: "Blog/Create/{id}",
               defaults: new { controller = "BlogPost", action = "CreateBlogPost", id = UrlParameter.Optional }
            );

            routes.MapRoute(
               name: "About Circular Logic",
               url: "About",
               defaults: new { controller = "Home", action = "About", id = UrlParameter.Optional }
            );

            routes.MapRoute(
               name: "Contact Us",
               url: "Contact",
               defaults: new { controller = "Home", action = "Contact", id = UrlParameter.Optional }
            );

            routes.MapRoute(
               name: "Dev's Round Table",
               url: "Blog",
               defaults: new { controller = "BlogPost", action = "Blogs", id = UrlParameter.Optional }
           );

            routes.MapRoute(
               name: "Blog Post",
               url: "Blog/Post/{id}",
               defaults: new { controller = "BlogPost", action = "BlogPostDetail", id = UrlParameter.Optional }
            );

            routes.MapRoute(
               name: "Edit Blog Post",
               url: "Blog/Edit/{id}",
               defaults: new { controller = "BlogPost", action = "EditBlog", id = UrlParameter.Optional }
            );

            routes.MapRoute(
               name: "Create New Page",
               url: "CreatePage",
               defaults: new { controller = "StaticPage", action = "AddStaticPage", id = UrlParameter.Optional }
            );

            routes.MapRoute(
               name: "Delete Page",
               url: "DeletePage",
               defaults: new { controller = "StaticPage", action = "DeleteStaticPage", id = UrlParameter.Optional }
            );

            routes.MapRoute(
               name: "Edit Pages",
               url: "EditPages",
               defaults: new { controller = "StaticPage", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
               name: "Update Page",
               url: "CreatePage",
               defaults: new { controller = "StaticPage", action = "AddStaticPage", id = UrlParameter.Optional }
            );

            routes.MapRoute(
               name: "Page",
               url: "Page/{id}",
               defaults: new { controller = "StaticPage", action = "ViewStaticPage", id = UrlParameter.Optional }
        );

            routes.MapRoute(
               name: "Circular Logic",
               url: "{controller}/{action}/{id}",
               defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

        }
    }
}
