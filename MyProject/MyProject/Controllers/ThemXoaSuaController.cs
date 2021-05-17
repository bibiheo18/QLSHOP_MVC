using MyProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyProject.Controllers {
    public class ThemXoaSuaController : Controller {
        //
        // GET: /ThemXoaSua/
        public ActionResult ThemXoaSua() {
            return View();
        }
        QLBanQuanAoDataContext db = new QLBanQuanAoDataContext();
        public ActionResult ThemSanPham(string tenSP, string moTa, string gioiTinh, decimal? giaBan, decimal? giaNhap, string anh, int? maLoaiSP, int? maNCC, int? soLuongTon) {
            SanPham sanPham = new SanPham();
            if (sanPham == null) {
                return HttpNotFound();
            }
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams, "MaloaiSP", "TenLoaiSP");
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps, "MaNCC", "TenNCC");
            if (tenSP != "" && moTa != "" && gioiTinh != "" && giaBan != null && giaNhap != null && anh != "" && maLoaiSP != null && maNCC != null && soLuongTon != null) {
                sanPham.TenSP = tenSP;
                sanPham.MoTa = moTa;
                sanPham.GioiTinh = gioiTinh;
                sanPham.GiaBan = giaBan;
                sanPham.GiaNhap = giaNhap;
                sanPham.Anh = anh;
                sanPham.MaLoaiSP = maLoaiSP;
                sanPham.MaNCC = maNCC;
                sanPham.SoLuongTon = soLuongTon;
                db.SanPhams.InsertOnSubmit(sanPham);
                db.SubmitChanges();
                return View(sanPham);
            }
            db.SubmitChanges();
            return View();
        }

        public ActionResult XoaSanPham(int maSP) {
            SanPham sanPham = db.SanPhams.Single(ma => ma.MaSP == maSP);
            if (sanPham == null) {
                return HttpNotFound();
            }
            db.SanPhams.DeleteOnSubmit(sanPham);
            db.SubmitChanges();
            return RedirectToAction("DanhMucCacSanPham", "Admin");
        }

        public ActionResult ChiTietSanPham(int maSP) {
            SanPham sanPham = db.SanPhams.Single(ma => ma.MaSP == maSP);
            if (sanPham == null) {
                return HttpNotFound();
            }
            else {
                return View(sanPham);
            }
        }

        public ActionResult SuaSanPham(int maSP, string tenSP, string moTa, string gioiTinh, decimal? giaBan, decimal? giaNhap, string anh, int? maLoaiSP, int? maNCC, int? soLuongTon) {
            SanPham sanPham = db.SanPhams.Single(ma => ma.MaSP == maSP);
            if (sanPham == null) {
                return HttpNotFound();
            }
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams, "MaloaiSP", "TenLoaiSP");
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps, "MaNCC", "TenNCC");
            if (tenSP != "" && moTa != "" && gioiTinh != "" && giaBan != null && giaNhap != null && anh != "" && maLoaiSP != null && maNCC != null && soLuongTon != null) {
                sanPham.TenSP = tenSP;
                sanPham.MoTa = moTa;
                sanPham.GioiTinh = gioiTinh;
                sanPham.GiaBan = giaBan;
                sanPham.GiaNhap = giaNhap;
                sanPham.Anh = anh;
                sanPham.MaLoaiSP = maLoaiSP;
                sanPham.MaNCC = maNCC;
                sanPham.SoLuongTon = soLuongTon;
                db.SubmitChanges();
                return View(sanPham);
            }
            return View();
        }

        public ActionResult timKiemSanPham(string tenSP) {
            if (!string.IsNullOrEmpty(tenSP)) {
                var query = from sp in db.SanPhams where sp.TenSP.Contains(tenSP) select sp;
                if (query.Count() == 0) {
                    return RedirectToAction("thongBaoRong", "ThemXoaSua");
                }
                return View(query);
            }
            return View();
        }

        public ActionResult thongBaoRong() {
            ViewBag.stringEmpty = "Không tìm thấy sản phẩm";
            return View();
        }
    }
}
