using MyProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyProject.Controllers {
    public class GioHangController : Controller {
        //
        // GET: /GioHang/

        public ActionResult Index() {
            return View();
        }
        // Tạo đối tượng db chứa dữ liệu từ Model QLBanQuanAo
        QLBanQuanAoDataContext db = new QLBanQuanAoDataContext();
        public List<GioHang> LayGioHang() {
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang == null) {
                // Nếu listGioHang chưa tồn tại thì khởi tạo
                listGioHang = new List<GioHang>();
                Session["GioHang"] = listGioHang;
            }
            return listGioHang;
        }

        // Xây dựng phương thức thêm vào giỏ hàng
        public ActionResult ThemGioHang(int msp, string strURL) {
            // Lấy ra giỏ hàng
            List<GioHang> listGioHang = LayGioHang();
            // Kiểm tra sách này có tồn tại trong Session["GioHang"] hay chưa ?
            GioHang SanPham = listGioHang.Find(sp => sp.maSP == msp);
            if (SanPham == null) { // Chưa có trong giỏ hàng
                SanPham = new GioHang(msp);
                listGioHang.Add(SanPham);
                return Redirect(strURL);
            }
            else { // Đã có sản phẩm này trong giỏ 
                SanPham.soLuong++;
                return Redirect(strURL);
            }
        }

        // Xây dựng phương thức tính tổng số lượng
        private int TongSoLuong() {
            int tongSoLuong = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null) {
                tongSoLuong = listGioHang.Sum(sp => sp.soLuong);
                Session.Add("TongSoLuong", tongSoLuong);
            }
            return tongSoLuong;
        }

        // Xây dựng phương thức tính tổng thành tiền
        private double TongThanhTien() {
            double tongThanhTien = 0;
            List<GioHang> listGioHang = Session["GioHang"] as List<GioHang>;
            if (listGioHang != null) {
                tongThanhTien += listGioHang.Sum(sp => sp.thanhTien);
            }
            return tongThanhTien;
        }

        // Xây dựng trang giỏ hàng

        public ActionResult GioHang() {
            ViewBag.loaiSP = db.LoaiSanPhams.OrderBy(sp => sp.MaLoaiSP);
            if (Session["GioHang"] == null) {
                return RedirectToAction("GioHangTrong", "GioHang");
            }
            List<GioHang> listGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongThanhTien = TongThanhTien();
            return View(listGioHang);
        }

        public ActionResult GioHangPartial() {
            List<GioHang> listGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            return PartialView();
        }

        public ActionResult CapNhatGioHang(int maSP, FormCollection f) {
            List<GioHang> listGH = LayGioHang();
            GioHang sp = listGH.Single(s => s.maSP == maSP);
            if (sp != null) {
                sp.soLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("SanPhamPartial", "SanPham");
        }

        public ActionResult XoaGioHang(int maSP) {
            List<GioHang> listGH = LayGioHang();
            GioHang sp = listGH.Single(s => s.maSP == maSP);
            if (sp != null) {
                listGH.RemoveAll(s => s.maSP == maSP);
                return RedirectToAction("SanPhamPartial", "SanPham");
            }
            if (listGH.Count == 0) {
                return RedirectToAction("SanPhamPartial", "SanPham");
            }
            return RedirectToAction("SanPhamPartial", "SanPham");
        }

        public ActionResult XoaGioHangAll() {
            List<GioHang> listGH = LayGioHang();
            listGH.Clear();
            if (listGH.Count == 0) {
                return RedirectToAction("SanPhamPartial", "SanPham");
            }
            return RedirectToAction("SanPhamPartial", "SanPham");
        }

        public ActionResult GioHangTrong() {
            ViewBag.thongBao = "Bạn chưa thêm sản phẩm nào";
            return View();
        }

        public ActionResult ViewGioHangHover() {
            List<GioHang> listGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.thongBao = "Bạn chưa thêm sản phẩm nào";
            ViewBag.TongThanhTien = TongThanhTien();
            return View(listGioHang);
        }

        [HttpGet]
        public ActionResult DatHang() {
            //Kiểm tra đăng nhập
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "") {
                return RedirectToAction("DangNhap", "User");
            }
            if (Session["GioHang"] == null) {
                return RedirectToAction("SanPhamPartial", "SanPham");
            }

            // Lấy giỏ hàng từ Session
            List<GioHang> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            if (ViewBag.TongSoLuong == 0) {
                return RedirectToAction("SanPhamPartial", "SanPham");
            }
            ViewBag.TongThanhTien = TongThanhTien();
            return View(lstGioHang);
        }
        [HttpPost]
        public ActionResult DatHang(FormCollection f) {
            // Thêm đơn hàng
            HoaDon ddh = new HoaDon();
            KhachHang kh = (KhachHang)Session["taikhoan"];
            List<GioHang> gh = LayGioHang();
            ddh.MaKH = kh.MaKH;
            ddh.NgayDat = DateTime.Now;
            var NgayGiao = String.Format("{0:mm/dd/yyyy}", f["NgayGiao"]);
            ddh.NgayGiao = DateTime.Parse(NgayGiao);
            ddh.TinhTrang = "Chưa thanh toán";
            db.HoaDons.InsertOnSubmit(ddh);
            db.SubmitChanges();
            Session.Add("NgayGiao", ddh.NgayGiao);
            Session.Add("MaHD", ddh.MaHD);

            foreach (var item in gh) {
                ChiTietHoaDon ctdh = new ChiTietHoaDon();
                ctdh.MaHD = ddh.MaHD;
                ctdh.MaSP = item.maSP;
                ctdh.SoLuong = item.soLuong;
                ctdh.DonGia = (decimal)item.donGia;
                db.ChiTietHoaDons.InsertOnSubmit(ctdh);
            }
            db.SubmitChanges();
            return RedirectToAction("XacNhanDatHang", "GioHang");
        }

        public ActionResult XacNhanDatHang() {
            List<GioHang> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongThanhTien = TongThanhTien();
            Session["GioHang"] = null;
            return View(lstGioHang);
        }
    }
}
