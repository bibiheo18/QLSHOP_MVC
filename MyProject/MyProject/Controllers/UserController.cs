using MyProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace MyProject.Controllers {
    public class UserController : Controller {
        //
        // GET: /User/
        QLBanQuanAoDataContext db = new QLBanQuanAoDataContext();
        public ActionResult DangKy() {
            return View();
        }
        public ActionResult DangNhap() {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(Information user) {
            if (!String.IsNullOrEmpty(user.UserName) && !String.IsNullOrEmpty(user.Password)) {
                KhachHang kh = db.KhachHangs.SingleOrDefault(khachHang => khachHang.TaiKhoan == user.UserName && khachHang.MatKhau == user.Password);
                if (kh != null) {
                    Session["taikhoan"] = kh;
                    Session.Add("User", kh.TaiKhoan);
                    return RedirectToAction("SanPhamPartial", "SanPham");
                }
                else {
                    ViewBag.ThongBao = "Sai tên đăng nhập hoặc mật khẩu";
                }
            }
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(Information user) {
            try {
                KhachHang kh = new KhachHang();
                kh.TenKH = user.tenKhachHang;
                kh.NgaySinh = DateTime.Parse(user.ngaySinh);
                kh.GioiTinh = user.gioitinh;
                kh.SDT = user.dienthoai;
                kh.TaiKhoan = user.tendangnhap;
                kh.MatKhau = user.matkhau;
                kh.Email = user.email;
                kh.DiaChi = user.diachi;
                db.KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return RedirectToAction("DangNhap", "User");
            }
            catch {

            }
            return View();
        }
        public ActionResult DangXuat() {
            Session["taikhoan"] = null;
            Session["GioHang"] = null;
            return RedirectToAction("TrangChu", "Home");
        }
    }
}
