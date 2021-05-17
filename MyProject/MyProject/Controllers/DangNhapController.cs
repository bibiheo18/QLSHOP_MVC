using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyProject.Controllers
{
    public class DangNhapController : Controller
    {
        //
        // GET: /DangNhap/

        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(string username, string password) {
            if ("admin".Equals(username) && "admin".Equals(password)) {
                return RedirectToAction("DanhMucCacSanPham", "Admin");
            }
            else {
                return View();
            }
        }

    }
}
