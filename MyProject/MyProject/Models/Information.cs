using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MyProject.Models {
    public class Information {

        [Required(ErrorMessage = "Tên đăng nhập không được để trống!")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Mật khẩu không được để trống!")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Tên của bạn là gì ?????")]
        [StringLength(50, MinimumLength = 10, ErrorMessage = "Vui lòng nhập đầy đủ họ va tên !")]
        public string tenKhachHang { get; set; }

        public string gioitinh { get; set; }

        [Required(ErrorMessage = "Ngày sinh không được bỏ trống")]
        public string ngaySinh { get; set; }

        [Required(ErrorMessage = "Mật khẩu không được bỏ trống")]
        [StringLength(20, MinimumLength = 10, ErrorMessage = "Mật khẩu ít nhất 10 kí tự và không quá 30 kí tự")]
        public string matkhau { get; set; }

        [Required(ErrorMessage = "Mật khẩu không được bỏ trống")]
        [Compare("matkhau", ErrorMessage = "Mật khẩu không khớp")]
        public string nhaplaiMK { get; set; }

        [Required(ErrorMessage = "Tài khoản không được bỏ trống")]
        [StringLength(15, ErrorMessage = "Tài khoản không quá 15 kí tự")]
        public string tendangnhap { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập email của bạn !")]
        [EmailAddress(ErrorMessage = "Địa chỉ email không hợp lệ !")]
        public string email { get; set; }

        [Required(ErrorMessage = "Bạn ở đâu ???")]
        [StringLength(50, ErrorMessage = "Địa chỉ nhà dài dữ vậy, sao kiếm ?")]
        public string diachi { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số điện thoại của bạn!")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$",ErrorMessage = "Số điện thoại không hợp lệ")]
        public string dienthoai { get; set; }


    }
}