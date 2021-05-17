using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



namespace MyProject.Models {
    public class GioHang {
        QLBanQuanAoDataContext db = new QLBanQuanAoDataContext();
        public int maSP { get; set; }
        public string tenSP { get; set; }
        public string hinhAnh { get; set; }
        public double donGia { get; set; }
        public int soLuong { get; set; }
        public double thanhTien {
            get { return soLuong * donGia; }
        }

        // Khởi tạo giỏ hàng
        public GioHang(int maSanPham) {
            maSP = maSanPham;
            SanPham sanPham = db.SanPhams.Single(sp => sp.MaSP == maSP);
            tenSP = sanPham.TenSP;
            hinhAnh = sanPham.Anh;
            donGia = double.Parse(sanPham.GiaBan.ToString());
            soLuong = 1;
        }

    }
}