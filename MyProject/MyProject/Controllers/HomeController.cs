using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyProject.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult TrangChu()
        {
            return View();
        }

        public ActionResult Form() {
            return PartialView();
        }

        public ActionResult GioiThieu() {
            return View();
        }
    }
}
