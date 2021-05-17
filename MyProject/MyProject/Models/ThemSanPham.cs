using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MyProject.Models {
    public class ThemSanPham {
        [Required(ErrorMessage = "Tên sản phẩm là gì ?????")]
        [StringLength(50, MinimumLength = 10, ErrorMessage = "Tên sản phẩm ít nhất 10 kí tự !")]
        public string tenSP { get; set; }

        [Required(ErrorMessage = "Mô tả không được để trống!")]
        [StringLength(50, MinimumLength = 15, ErrorMessage = "Mô tả ít nhất 10 kí tự !")]
        public string moTa { get; set; }

        [Required(ErrorMessage = "Giá bán bao nhiêu ?")]
        [Range(10000,10000000, ErrorMessage = "Giá bán nằm trong khoảng 10.000 và 10.000.000")]
        public int giaBan { get; set; }

        [Required(ErrorMessage = "Giá nhập bao nhiêu ?")]
        [Range(10000, 10000000, ErrorMessage = "Giá nhập nằm trong khoảng 10.000 và 10.000.000")]
        public int giaNhap { get; set; }

        [Required(ErrorMessage = "Vui lòng cung cấp hình ảnh ?")]
        public string hinhAnh { get; set; }

        [Required]
        public string gioiTinh { get; set; }

        [Required(ErrorMessage = "Vui lòng chọn tên loại sản phẩm ?")]
        public int maLoaiSP { get; set; }

        [Required(ErrorMessage = "Vui lòng chọn tên nha cung cấp ?")]
        public int maNhaCC { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số lượng tồn")]
        public int soLuongTon { get; set; }
    }
}