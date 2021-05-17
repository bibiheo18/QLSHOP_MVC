create database QLSHOPLAPTOP
use QLSHOPLAPTOP
set dateformat mdy
create table KhachHang
(
	MaKH int primary key identity,
	TenKH nvarchar(50),
	NgaySinh datetime,
	GioiTinh nvarchar(5),
	TaiKhoan varchar(50),
	MatKhau varchar(50),
	DiaChi nvarchar(50),
	Email varchar(50),
	SDT char(11)
)
create table LoaiSanPham
(
	MaLoaiSP int primary key identity,
	TenLoaiSP nvarchar(50)
)
create table NhaCungCap
(
	MaNCC int primary key identity,
	TenNCC nvarchar(50),
	DiaChi nvarchar(50),
	SDT char(13)
)
create table SanPham
(
	MaSP int primary key identity,
	TenSP nvarchar(MAX),
	MoTa nvarchar(MAX),
	GioiTinh nvarchar(5),
	GiaBan decimal(18,0),
	GiaNhap decimal(18,0),
	Anh nvarchar(50),
	MaLoaiSP int,
	MaNCC int,
	SoLuongTon int,
	foreign key (MaLoaiSP) references LoaiSanPham(MaLoaiSP),
	foreign key (MaNCC) references NhaCungCap(MaNCC)
)
create table HoaDon
(
	MaHD int primary key identity,
	NgayDat date,
	NgayGiao date,
	TinhTrang nvarchar(50),
	MaKH int,
	foreign key (MaKH) references KhachHang(MaKH)
)
create table ChiTietHoaDon
(
	MaHD int,
	MaSP int,
	SoLuong int,
	DonGia decimal(18,0),
	primary key (MaHD,MaSP),
	foreign key (MaHD) references HoaDon(MaHD),
	foreign key (MaSP) references SanPham(MaSP)
)
select * from ChiTietHoaDon
select * from SanPham
insert into NhaCungCap values(N'công ty nước hoa',N'26 Pham Phú Thứ , Phường 3 , Quận 6,TP.Hồ Chí Minh','0934977417')
select*from NhaCungCap
update NhaCungCap
set TenNCC='Công Ty Nước Hoa',DiaChi='26 Phạm Phú Thứ', SDT='0934977417'

insert into LoaiSanPham values(N'2–5% tinh dau ')
insert into LoaiSanPham values(N'4–10% tinh dau')
insert into LoaiSanPham values(N'8–15%tinh dau')
insert into LoaiSanPham values(N'15–25% tinh dau')
insert into LoaiSanPham values(N'Perfume oil 15–30% tinh dau')
insert into LoaiSanPham values(N'Perfume Oil 80-90% tinh dau')
insert into LoaiSanPham values(N'Parfum 20-30% tinh dau')
insert into LoaiSanPham values(N'Eau de Cologne 5-7% tinh dau ')
insert into LoaiSanPham values(N'Chanel')
insert into LoaiSanPham values(N'Gucci')
insert into LoaiSanPham values(N'Calvin Klein ')
insert into LoaiSanPham values(N'Dior')
insert into LoaiSanPham values(N'Eau de Cologne 5-7% tinh dau')
insert into LoaiSanPham values(N'Parfum 20-30% tinh dau')
insert into LoaiSanPham values(N'Perfume Oil 80-90% tinh dau')
select*from LoaiSanPham

insert into SanPham values(N'ÁO THUN NAM NGẮN TAY CỔ TRỤ',N'ÁO THUN NAM NGẮN TAY CỔ TRỤ THUN COTTON SỌC NGANG PHỐI 2 MÀU ĐẸP MẮT<br>Chất liệu: Vải 100% thun cotton mềm mịn, thấm hút mồ hôi tốt','Nam',145000,100000,N'ao-thun-nam-ngan-tay.jpg',1,1,100)
insert into SanPham values(N'ÁO THUN NAM NGẮN TAY CỔ TRỤ',N'ÁO THUN NAM CỔ TRỤ NGẮN TAY VIỀN CỔ IN LOGO MẪU MỚI<br>Chất liệu: Vải 100% thun cotton mềm mịn, thấm hút mồ hôi tốt','Nam',155000,100000,N'ao-thun-nam-co-tru-ngan-tay.jpg',1,1,100)
insert into SanPham values(N'ÁO THUN NAM HÌNH HỔ 3D',N'ÁO THUN NAM HÌNH HỔ 3D: Chất vải thun 3D mịn lạnh, thấm hút mồ hôi nhanh giúp các chàng luôn thoải mái khi vận động, chơi các trò chơi thể thao, thể chất. Bên cạnh đó là thiết kế mạnh mẽ với hình hổ ấn tượng mang đến cho các chàng sự sang trọng, trẻ trung  để các chàng luôn sẵn sàng xuất hiện trước các nàng mà không lo thiếu sự thu hút.<br>Chất liệu: VẢI THUN 3D CO GIÃN CAO CẤP','Nam',155000,100000,N'ao-thun-nam-hinh-ho-3d.jpg',1,1,100)

insert into SanPham values(N'SƠ MI NAM HÀN QUỐC TRẺ TRUNG',N'SƠ MI NAM HÀN QUỐC TRẺ TRUNG: Chất vải dày dặn cao cấp, đặc biệt với những sọc nhỏ tinh tế cùng dáng áo chuẩn để các chàng tự tin khoe dáng. Bên cạnh đó là chất màu lên tông chuẩn để các chàng lựa chọn phong cách cho mình thật thoải mái. Ngoài ra, với thiết kế tay dài thanh lịch, chiếc áo sẽ là bạn đồng hành cùng các chàng trai trong những ngày lên công tay hay trong những buổi gặp khách hàng.<br>Chất liệu: VẢI KAKI MỀM','Nam',240000,100000,N'so-mi-nam-han-quoc.jpg',3,1,100)
insert into SanPham values(N'SƠ MI NAM CARO Ô LỚN',N'SƠ MI NAM CARO Ô LỚN: Chất vải kate dày dặn cao cấp, dáng áo chuẩn để các chàng tự tin khoe dáng. Bên cạnh đó là họa tiết caro ôn lớn đối xứng sang trọng nhưng không kém phần tươi trẻ kết hợp với thiết kế tay dài thanh lịch, chiếc áo sẽ là bạn đồng hành cùng các chàng trai trong những ngày lên công ty hay trong những buổi gặp khách hàng.<br>Chất liệu: VẢI KATE DÀY MỊN','Nam',220000,100000,N'so-mi-nam-caro.jpg',3,1,100)
insert into SanPham values(N'ÁO SƠ MI NAM LOANG MÀU THỜI THƯỢNG',N'ÁO SƠ MI NAM LOANG MÀU THỜI THƯỢNG: Chất vải dày dặn cao cấp, dáng áo chuẩn để các chàng tự tin khoe dáng. Bên cạnh đó là chất màu lên tông chuẩn để các chàng lựa chọn phong cách cho mình thật thoải mái. Ngoài ra, với thiết kế tay dài thanh lịch nhưng không mất đi sự trẻ trung pha chút nổi loạn với việc kết hợp màu loang mới mẻ.<br>Chất liệu: KATE BÓNG CAO CẤP','Nam',235000,100000,N'ao-so-mi-nam-loang-mau.jpg',3,1,100)

insert into SanPham values(N'QUẦN SHORT JEANS CÓ KHUY ĐỘC ĐÁO',N'QUẦN SHORT JEANS CÓ KHUY ĐỘC ĐÁO: Chất vải jeans cao cấp xuất khẩu vừa dày dặn, nhẹ mịn vừa co giãn vừa phải giúp người mang dế chịu, tự tin. Bên cạnh đó còn là thiết kế trẻ trung, năng động và đầy độc đáo với khuy sản phẩm lạ mắt.<br>Chất liệu: VẢI JEANS CAO CẤP XUẤT KHẨU','Nam',180000,100000,N'quan-short-jeans-co-khuy.jpg',11,1,100)
insert into SanPham values(N'QUẦN ĐÙI NAM SỐ 69 CAO CẤP',N'QUẦN ĐÙI NAM SỐ 69 CAO CẤP: Thiết kế trẻ trung, năng động với thiết kế săn lai ống giúp các trai trông năng động hơn. Bên cạnh đó chất vải jenas dày dặn mang đến sự tự tin cho các chàng trong việc hoạt động vui chơi mà không lo các sự cố khó xửa xảy ra.<br>Chất liệu: VẢI JEANS CAO CẤP XUẤT KHẨU','Nam',185000,100000,N'quan-dui-nam-so-69-cao-cap.jpg',11,1,100)
insert into SanPham values(N'QUẦN SHORT JEANS NAM KẾT HỢP HỌA TIẾT CHIBI',N'QUẦN SHORT JEANS NAM KẾT HỢP HỌA TIẾT CHIBI ĐÁNG YÊU: Chất vải jeans cao cấp nhập khẩu Thái Lan mang đến cho người mặc sự thoải mái và tin tưởng bởi chất vải dày dặn, mịn nhẹ. bên cạnh đó ngoài những nét cắt rách táo bạo là họa tiết chibi mang đến sự trẻ trung, nắng động cho người mang.<br>Chất liệu: VẢI JEANS NHẬP KHẨU THÁI LAN','Nam',180000,100000,N'quan-short-jeans-nam.jpg',11,1,100)

insert into SanPham values(N'QUẦN JEANS NAM CAO CẤP THIẾT KẾ KẾT HỢP VẢI MẪU',N'QUẦN JEANS NAM CAO CẤP THIẾT KẾ KẾT HỢP VẢI MẪU: Chất vải cao cấp xuất khẩu dày dặn, lên form chuẩn dáng để các chàng thoải mái khoe body. Bên cạnh đó là thiết kế phong cách đường phố mạnh mẽ, phá cách với những nét cắt, xước táo bạo, độc đáo mà chỉ riêng sản phẩm có.<br>Chất liệu: VẢI JEANS NAM CAO CẤP NHẬP KHẨU','Nam',265000,100000,N'quan-jeans-nam-cao-cap.jpg',13,1,100)
insert into SanPham values(N'QUẦN JEANS NAM NHẤN GỐI TRÁI TINH TẾ',N'QUẦN JEANS NAM NHẤN GỐI TRÁI TINH TẾ: Chất vải cao cấp xuất khẩu dày dặn, lên form chuẩn dáng để các chàng thoải mái khoe body. Bên cạnh đó là thiết kế phong cách đường phố mạnh mẽ, phá cách với những nét cắt, xước táo bạo, độc đáo mà chỉ riêng sản phẩm có.<br>Chất liệu: VẢI JEANS NHẬP KHẨU HÀN QUỐC','Nam',270000,100000,N'quan-jeans-nam-nhan-goi-trai.jpg',13,1,100)
insert into SanPham values(N'QUẦN JEAN NAM PHONG CÁC ĐƯỜNG PHỐ MỚI',N'QUẦN JEAN NAM PHONG CÁC ĐƯỜNG PHỐ MỚI: Thiết kế phá cách, theo xu hướng đường phố đem đến cho các chàng trai sự năng động, pha chút nổi loạn làm các chàng trai trông thật sự nổi bật cũng như tự tin thể hiện phong cách của bản thân trong mọi cuộc vui.<br>Chất liệu: VẢI JEANS CAO CẤP XUẤT KHẨU','Nam',265000,100000,N'quan-jean-nam.jpg',13,1,100)

insert into SanPham values(N'QUẦN KAKI LƯNG PHỐI DÂY SỌC QK005 MÀU XANH ĐEN',N'Sớ vải dệt xéo nổi lên khá lạ mắt tạo nên một sản phẩm dày dặn, bền bỉ và ít nhăn, chất liệu cao cấp mang đến sự thoáng mát, thấm hút mồ hôi cao.
<br>- Quần co giãn nhẹ  nhờ có thành phần spandex giúp người mặc cảm thấy thoải mái, dễ chịu hơn.
<br>- Sản phẩm được xử lý wash mềm, đốt lông nên đảm bảo hạn chế co rút, xù lông và bền màu.
<br>- Phần phối dây dệt sọc ở lưng quần làm điểm nhấn mới lạ đầy ấn tượng nhưng vẫn giữ được nét thanh lịch, thời thượng cho phái mạnh.<br>Chất liệu: Khaki 98% cotton 2% spandex twill stretch.','Nam',355000,100000,N'quan-kaki-nam-lung-phoi-day-soc.png',12,1,100)
insert into SanPham values(N'QUẦN KAKI LƯNG PHỐI DÂY SỌC QK005 MÀU CÀ PHÊ',N'Sớ vải dệt xéo nổi lên khá lạ mắt tạo nên một sản phẩm dày dặn, bền bỉ và ít nhăn, chất liệu cao cấp mang đến sự thoáng mát, thấm hút mồ hôi cao.
<br>- Quần co giãn nhẹ  nhờ có thành phần spandex giúp người mặc cảm thấy thoải mái, dễ chịu hơn.
<br>- Sản phẩm được xử lý wash mềm, đốt lông nên đảm bảo hạn chế co rút, xù lông và bền màu.
<br>- Phần phối dây dệt sọc ở lưng quần làm điểm nhấn mới lạ đầy ấn tượng nhưng vẫn giữ được nét thanh lịch, thời thượng cho phái mạnh.<br>Chất liệu: Khaki 98% cotton 2% spandex twill stretch.','Nam',355000,100000,N'quan-kaki-nam.png',12,1,100)
insert into SanPham values(N'QUẦN KAKI CÓ NẮP TÚI SAU QK003 MÀU XÁM',N'Mềm mại, độ bền cao, hút ẩm và thấm hút mồ hôi tốt. Thiết kế căn bản dễ mix&match nhiều dạng quần áo và phong cách.<br>Chất liệu: 98% cotton, 2% spandex.','Nam',310000,100000,N'quan-nam-kaki-co-nap-tui-sau.png',12,1,100)

insert into SanPham values(N'QUẦN TÂY NAZAFU QT006 MÀU XANH ĐEN',N'Chất vải mềm mại, độ bền cao, hút ẩm và thấm hút mồ hôi tốt. Họa tiết kẻ caro Glen plaid rất "đa dụng", thanh nhã. <br>Chất liệu: 73% polyester, 26% rayon, 1% spandex.','Nam',427000,100000,N'quan-tay-nazafu.png',14,1,100)
insert into SanPham values(N'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT015',N'Quần slimfit tôn dáng thon gọn trong thiết kế trơn căn bản. Chất liệu thấm hút tốt, độ bền cao tạo cảm giác thoải mái cho người mặc.<br>Chất liệu: 68% polyester,rayon 29%, 3% spandex.','Nam',382000,100000,N'quan-tay-phoi-day-det.png',14,1,100)
insert into SanPham values(N'QUẦN TÂY XẾP LY FORM SLIMFIT QT007 MÀU XÁM CHUỘT ĐẬM',N'Chống nhăn, co dãn nhẹ. Thiết kế trên chất vải bóng mịn, sở hữu độ bền màu cao tạo phong thái lịch thiệp và tinh tế cho người mặc.<br>Chất liệu: 83% polyester, 15% rayon, 2% spandex.','Nam',346000,100000,N'quan-tay-xep-ly-form.png',14,1,100)

insert into SanPham values(N'QUẦN JOGGER LƯNG THUN CÀI NÚT J004 MÀU XÁM XANH',N'Mềm mịn, có độ rũ nhẹ. Độ bền màu cao, thấm hút mồ hôi tốt. Co giãn nhẹ, hạn chế nhăn tạo cảm giác thoải mái tối đa trong mọi hoạt động<br>Chất liệu: 83% polyester, 15% rayon, 2% spandex.','Nam',337000,100000,N'quan-tay-lung-thun-cai-nut.png',15,1,100)
insert into SanPham values(N'QUẦN JOGGER JEAN J13 MÀU XANH ĐEN',N'Đậm chất jeans nhưng là jogger năng động & cá tính. Jogger đơn giản với thiết kế bo lưng & bo lai mới tạo điểm nhấn cho quần luôn thoải mái, trẻ trung, jogger thực sự thuộc về các chàng trai ưu thích sự di chuyển.<br>Chất liệu: 98% cotton, 2% spandex','Nam',400000,100000,N'quan-jogger-jean-mau-xanh-bien.jpg',15,1,100)
insert into SanPham values(N'QUẦN JOGGER TÚI ĐẮP J001 MÀU ĐEN',N'Co giãn vừa phải, bền màu, ít nhăn. Form dáng thoải mái, năng động với 2 túi đắp bên hông quần tạo phong thái trẻ trung và phóng khoáng.<br>Chất liệu: 65% polyester, 32% rayon, 3% spandex.','Nam',346000,100000,N'quan-jogger-kaki-bo-lai.png',15,1,100)

insert into SanPham values(N'ÁO THUN NỮ TRẺ TRUNG MỚI',N'ÁO THUN NỮ TRẺ TRUNG MỚI: Với thiết kế trẻ trung với viền màu nổi bật cùng hình ảnh bắt mắt bên cạnh đó là chất vải cao cấp, lên màu, lên dáng chuẩn như các cô gái muốn giúp các nàng luôn tự tin tỏa sáng và thoải mái khi mang dù cho là cả ngày dài hoạt động.<br>Chất liệu: VẢI DA CÁ CAO CẤP',N'Nữ',125000,100000,N'ao-thun-nu-tre-trung-moi.jpg',2,1,100)
insert into SanPham values(N'ÁO THUN NỮ HIỆN ĐẠI CAO CẤP',N'ÁO THUN NỮ HIỆN ĐẠI CAO CẤP: Thiết kế hiện đại với kiểu tay phồng nhún viền tinh tế, bắt mắt bên cạnh đó là chất vải thun dày dặn cao cấp không chỉ lên màu chuẩn mà còn lên dáng chuẩn như các nàng muốn giúp các nàng luôn tự tin tỏa sáng và thoải mái khi mang dù cho là cả ngày dài hoạt động.<br>Chất liệu: VẢI THUN CAO CẤP DÀY DẶN',N'Nữ',140000,100000,N'ao-thun-nu-hien-dai-cao-cap.jpg',2,1,100)
insert into SanPham values(N'ÁO THUN NỮ SỌC MÀU NĂNG ĐỘNG',N'ÁO THUN NỮ SỌC MÀU NĂNG ĐỘNG: Thiết kế hiện đại với những sọc màu bắt mắt, sự kết hợp những màu sắc nổi bật đi cùng nhau tạo nên sự khác biệt mang phong cách Hàn Quốc bên cạnh đó là chất vải cao cấp, lên màu, lên dáng chuẩn như ming muốn giúp các nàng luôn tự tin tỏa sáng và thoải mái khi mang dù cho là cả ngày dài hoạt động.<br>Chất liệu: VẢI NHŨ NHẬP KHẨU',N'Nữ',140000,100000,N'ao-thun-nu-soc-mau-nang-dong.jpg',2,1,100)

insert into SanPham values(N'SƠ MI NỮ KIỂU CỔ VUÔNG HIỆN ĐẠI',N'SƠ MI NỮ KIỂU CỔ VUÔNG HIỆN ĐẠI: Chất vải voan mềm mịn cùng với chất len gân co giãn mang đến vẻ đẹp dịu dàng nữ tính cùng sự thoải mái, dễ chịu khi hoạt động cả ngày dài. Đặc biệt là thiết kế hiện đại, mang nét gợi cảm giúp người mang nổi bật với nét đẹp hiện đại thời thượng.<br>Chất liệu: VẢI VOAN MỀM KẾT HỢP LEN GÂN MỎNG',N'Nữ',210000,100000,N'so-mi-nu-kieu-co-vuong-hien-dai.jpg',4,1,100)
insert into SanPham values(N'ÁO SƠ MI NỮ SỌC TAY LỬNG THIẾT KẾ ĐỘC ĐÁO',N'ÁO SƠ MI NỮ SỌC TAY LỬNG THIẾT KẾ ĐỘC ĐÁO: Chất liệu kate mềm mịn cao cấp thướt tha, nhẹ nhàng, dễ chịu. Kiểu dáng áo cổ bẻ, tay lửng thời trang, mang nền vải sọc vân nhỏ đậm chất lịch sự cho bạn gái thêm phần trang nhã, lịch sự và đầy nữ tính. Chiếc áo không chỉ thích hợp cho những ngày đến cơ quan, công sở mà còn là một sự lựa chọn khá hoàn hảo cho những buổi đầu hẹn hò khi muôn xuất hiện với hình ảnh trang nhã.<br>Chất liệu: VẢI KATE MỀM NHẸ CAO CẤP',N'Nữ',220000,100000,N'ao-so-mi-nu-soc-tay-lung.jpg',4,1,100)
insert into SanPham values(N'ÁO SƠ MI NỮ TRƠN FROM ÁO ĐỘC ĐÁO',N'ÁO SƠ MI NỮ TRƠN FROM ÁO ĐỘC ĐÁO: Với chất vải kate cao cấp mềm mịn và thoáng khí giúp người mang thoải mái khi hoạt động cả ngày dù trong thời tiết nắng nóng. Bên cạnh đó là from áo độc đáo mang tới vẻ đẹp cá tính, hiện đại giúp các nàng trông thật nổi bật trong mọi cuộc vui.<br>Chất liệu: VẢI KATE CAO CẤP',N'Nữ',210000,100000,N'ao-so-mi-nu-tron-from-ao.jpg',4,1,100)

insert into SanPham values(N'ĐẦM NỮ CỔ CHỮ U XẺ TÀ SÀNH ĐIỆU',N'ĐẦM NỮ CỔ CHỮ U XẺ TÀ SÀNH ĐIỆU: Với chất vải cao cấp nhập khẩu từ Thái Lan, vải dày dặn, thấm hút mồ hôi tốt. Bên cạnh đó thiết kế sang trọng với cổ chữ U và xẻ tà quyến rũ giúp người mặc trông thật trẻ trung năng động và đầy tự tin. <br>Chất liệu: VẢI KATE CO GIÃN NHẬP KHẨU THÁI LAN',N'Nữ',240000,100000,N'dam-nu-co-chu-u-xe-ta-sanh-dieu.jpg',5,1,100)
insert into SanPham values(N'ĐẦM HOA 2 LỚP XẾP EO MS 48B8245',N'Đầm 2 lớp dáng chữ A, cổ tròn. Xếp nếp ở mặt trước phần eo. Tay lỡ. Cài bằng khóa kéo ẩn sau lưng. Vải họa tiết hoa thu hút. Kiểu dáng chữ A, ôm nhẹ với độ dài trên gối cùng phần tay lỡ giúp che đi hầu hết các khuyết điểm cơ thể. Bên cạnh đó chất liệu thô co giãn nhẹ, bền màu, ít nhăn mang lại cảm giác thoải mái khi mặc. <br>Chất liệu: Thô',N'Nữ',645000,100000,N'damhoa2lop.jpg',5,1,100)
insert into SanPham values(N'ĐẦM LỤA CHẤM BI 2 LỚP MS 48M4844',N'Đầm lụa chấm bi, cổ chữ V vạt trước đáp chéo được xếp nếp tinh tế, tay ngắn. Dáng ôm. Eo chiết kèm đai cùng màu. Gấu sau xẻ. Cài bằng khóa kéo ẩn sau lưng. Những đường xếp ly ở phần chân váy giúp che được hết những khuyết điểm của cô nàng mảnh khảnh và mang đến sự tinh nghịch, trẻ trung, phá cách mà không kém phần quyến rũ cho phái đẹp. <br>Chất liệu: Lụa',N'Nữ',745000,100000,N'damluachambi.jpg',5,1,100)

insert into SanPham values(N'Chân Váy Jean Rách',N'Màu sắc: Đen - Trắng. Kiểu dáng: Chất kaki jeans Co giãn, dày dặn, không xù lông và có thể giặt máy. Size : Size: S (dưới 45kg), M(46-50kg), L(51-55kg). Mục đích sử dụng: dạo phố. đi chơi, đi học hoặc đi làm',N'Nữ',119000,100000,N'chan-vay-jean-rach.jpg',6,1,100)
insert into SanPham values(N'Chân Váy Jean Ngắn',N'Màu sắc: Đen - Trắng. Kiểu dáng: Chất kaki jeans Co giãn, dày dặn, không xù lông và có thể giặt máy. Size : Size: S (dưới 45kg), M(46-50kg), L(51-55kg). Mục đích sử dụng: dạo phố. đi chơi, đi học hoặc đi làm',N'Nữ',129000,100000,N'chan-vay-jean-om.jpg',6,1,100)
insert into SanPham values(N'Chân Váy Xếp Ly',N'Những chiếc Chân Váy Xếp Ly mềm mại với chiều dài trên gối là lựa chọn dành riêng cho các quý cô yêu thích phong cách lãng mạn. Vì sao ư? vì chúng đơn giản nhưng không hề nhàm chán, kín đáo nhưng lại quyến rũ một cách lạ thường. Sự bắt cặp quá đỗi hoàn hảo này là bởi những đường ly thanh mảnh mềm mại đến tinh tế sẽ khiến cho các quý cô trông thật duyên dáng và chiều dài chỉ đến ngang bắp chân sẽ khiến cho mỗi bước đi trông thật uyển chuyển và gợi cảm. Chiếc váy chính là món đồ có thể kết hợp ăn ý cùng áo len chui đầu, áo phông, sơ mi dáng rộng và một đôi giày/sandals cao gót thanh mảnh.',N'Nữ',144000,100000,N'chan-vay-xep-ly.png',6,1,100)

insert into SanPham values(N'SHORT LƯNG THUN VIỀN SỌC',N'Mix- Max phối cùng các kiểu áo thun thời trang, croptop phá cách, áo ba lỗ mát mẻ. Lưng thun dây rút tạo cảm giác thoải mái và tự tin cho người mặc. Short viền sọc là style đầy mới mẻ dành cho tủ đồ ngày hè của bạn gái.',N'Nữ',145000,100000,N'quan-shorrt-nu-lung-thun-vien-soc.png',7,1,100)
insert into SanPham values(N'Quần Short Jean Nhung',N'Quần Short Jean Rách Nhung cách điệu với thiết kế chuẩn form co giãn, đẹp mắt, dễ thương, kiểu dáng đơn giản. Dáng quần vừa vặn nhiều vóc người. Có thể kết hợp cùng nhiều thiết kế áo kiểu khác nhau.',N'Nữ',170000,100000,N'quan-shorrt-nu-lung-thun-vien-soc.png',7,1,100)
insert into SanPham values(N'Quần Short 2 Túi Lai V',N'Mix- Max phối cùng các kiểu áo thun thời trang, croptop phá cách, áo ba lỗ mát mẻ. Lưng thun dây rút tạo cảm giác thoải mái và tự tin cho người mặc. Short viền sọc là style đầy mới mẻ dành cho tủ đồ ngày hè của bạn gái.',N'Nữ',149000,100000,N'quan-short-2-tui-lai.png',7,1,100)

insert into SanPham values(N'QUẦN JEANS NỮ ỐNG SUÔNG CÁCH ĐIỆU CÁ TÍNH',N'QUẦN JEANS NỮ ỐNG SUÔNG CÁCH ĐIỆU CÁ TÍNH: Với những cô nàng đã cực kỳ đam mê với mẫu quần ống suông nhưng thấy nhàm chán với mẫu basic ban đầu thì chắc chắn sản phẩm sẽ làm các nàng hài lòng với sự nhấn nhá, cách điệu với đường cắt dứt khoác, mạnh mẽ lần lượt tại hông và bắp chân. Đặc biệt là ống quần với thiết kế cắt thuần túy tại nên những tua rua tự nhiên mang đến sự năng động cho các nàng.<br>Chất liệu: VẢI JEANS DÀY MỊN',N'Nữ',220000,100000,N'quan-jeans-nu-ong-suong-cach-dieu-ca-tinh.jpg',8,1,100)
insert into SanPham values(N'QUẦN JEANS NỮ NHẤN CHỮ ĐÙI CÁ TÍNH',N'QUẦN JEANS NỮ NHẤN CHỮ ĐÙI CÁ TÍNH : Chất vải jeans cao cấp, tuyển chọn đảm bảo được form quần và màu lên chuẩn cùng với thiết kế hiện đại kèm theo sự trẻ trung thanh lịch để các cô gái luôn có thể tự tin diện ở mọi nơi mà không lo rằng sẽ không phù hợp và chắc chắn là các cô gái sẽ thật tỏa sáng, nổi bật với phong cách nhẹ nhàng.<br>Chất liệu: VẢI JEANS DÀY DẶN XUẤT KHẨU',N'Nữ',210000,100000,N'quan-jeans-nu-nhan-chu-dui-ca-tinh.jpg',8,1,100)
insert into SanPham values(N'QUẦN JEANS NỮ WASH ỐNG ĐỘC ĐÁO',N'QUẦN JEANS NỮ WASH ỐNG ĐỘC ĐÁO: Chất liệu vải jeans dày dặn cao cấp, chắc chắn cho bạn yên tâm khi hoạt động mạnh, có khả năng thấm hút các giọt mồ hôi và co giãn tốt. Kiểu dáng thiết kế ống ôm sang trọng, khoe dáng, luôn luôn được những bạn gái yêu mến trong mọi phong cách thời trang.<br>Chất liệu: VẢI JEANS CHẤT LIỆU CAO CẤP',N'Nữ',250000,100000,N'quan-jeans-nu-wash-ong-doc-dao.jpg',8,1,100)

insert into SanPham values(N'QUẦN JOGGER DÂY KÉO NỮ XANH BIỂN',N'Phối quần jogger nữ với Áo crop top là item thời trang không thể thiếu trong tủ đồ hè của bạn gái. Chiếc áo cá tính này cũng là “người bạn thân” với quần jogger nữ. Cách phối đồ với quần jogger nữ và áo crop top không chỉ mang đến vẻ đẹp khoẻ khoắn, trẻ trung mà còn giúp các nàng khoe khéo vòng eo “con kiến” của mình.',N'Nữ',140000,100000,N'quan-jogger-day-keo-nu-xanh-than.jpg',9,1,100)
insert into SanPham values(N'QUẦN JOGGER KAKI NỮ XÁM TRẮNG',N'Phối quần jogger nữ với Áo crop top là item thời trang không thể thiếu trong tủ đồ hè của bạn gái. Chiếc áo cá tính này cũng là “người bạn thân” với quần jogger nữ. Cách phối đồ với quần jogger nữ và áo crop top không chỉ mang đến vẻ đẹp khoẻ khoắn, trẻ trung mà còn giúp các nàng khoe khéo vòng eo “con kiến” của mình.',N'Nữ',220000,100000,N'quan-jogger-kaki-nu-xam-trang.jpg',9,1,100)
insert into SanPham values(N'QUẦN JOGGER NỮ CÓ KHÓA GỐI KAKI ĐEN',N'Phối quần jogger nữ với Áo crop top là item thời trang không thể thiếu trong tủ đồ hè của bạn gái. Chiếc áo cá tính này cũng là “người bạn thân” với quần jogger nữ. Cách phối đồ với quần jogger nữ và áo crop top không chỉ mang đến vẻ đẹp khoẻ khoắn, trẻ trung mà còn giúp các nàng khoe khéo vòng eo “con kiến” của mình.',N'Nữ',170000,100000,N'quan-jogger-nu-co-khoa.jpg',9,1,100)
select*from SanPham

update SanPham
set TenSP='Alaia',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=2400000,GiaNhap=1000000,Anh='sp1.jpg',MaLoaiSP='1',MaNCC='1',SoLuongTon='100'
where MaSP = 1
update SanPham
set TenSP='Aqva',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=1550000,GiaNhap=1000000,Anh='sp2.jpg',MaLoaiSP='1',MaNCC='1',SoLuongTon='100'
where MaSP = 2
update SanPham
set TenSP='Archives',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=3000000,GiaNhap=1000000,Anh='sp3.jpg',MaLoaiSP='1',MaNCC='1',SoLuongTon='100'
where MaSP = 3
update SanPham
set TenSP=' blackopiumy',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=1800000,GiaNhap=1000000,Anh='sp4.jpg',MaLoaiSP='3',MaNCC='1',SoLuongTon='100'
where MaSP = 4
update SanPham
set TenSP='bulga ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=1900000,GiaNhap=1000000,Anh='sp5.jpg',MaLoaiSP='3',MaNCC='1',SoLuongTon='100'
where MaSP = 5
update SanPham
set TenSP='dolce ',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=2100000,GiaNhap=1000000,Anh='sp6.jpg',MaLoaiSP='3',MaNCC='1',SoLuongTon='100'
where MaSP = 6
update SanPham
set TenSP='Gio ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=2200000,GiaNhap=1000000,Anh='sp7.jpg',MaLoaiSP='11',MaNCC='1',SoLuongTon='100'
where MaSP = 7
update SanPham
set TenSP='GoldCouture ',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=2400000,GiaNhap=1000000,Anh='sp8.jpg',MaLoaiSP='11',MaNCC='1',SoLuongTon='100'
where MaSP = 8
update SanPham
set TenSP='goodgirl ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=2300000,GiaNhap=1000000,Anh='sp9.jpg',MaLoaiSP='11',MaNCC='1',SoLuongTon='100'
where MaSP = 9
update SanPham
set TenSP='ggci ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=2500000,GiaNhap=1000000,Anh='sp10.jpg',MaLoaiSP='13',MaNCC='1',SoLuongTon='100'
where MaSP = 10
update SanPham
set TenSP='Hugo',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=2600000,GiaNhap=1000000,Anh='sp11.jpg',MaLoaiSP='13',MaNCC='1',SoLuongTon='100'
where MaSP = 11
update SanPham
set TenSP='lancome ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=4100000,GiaNhap=1000000,Anh='sp12.jpg',MaLoaiSP='13',MaNCC='1',SoLuongTon='100'
where MaSP = 12
update SanPham
set TenSP='N5 ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=4200000,GiaNhap=1000000,Anh='sp13.jpg',MaLoaiSP='12',MaNCC='1',SoLuongTon='100'
where MaSP = 13
update SanPham
set TenSP='Limiperatri ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=4300000,GiaNhap=1000000,Anh='sp14.jpg',MaLoaiSP='12',MaNCC='1',SoLuongTon='100'
where MaSP = 14
update SanPham
set TenSP='scandal',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=3200000,GiaNhap=1000000,Anh='sp15.jpg',MaLoaiSP='12',MaNCC='1',SoLuongTon='100'
where MaSP = 15
update SanPham
set TenSP='signorina',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=3100000,GiaNhap=1000000,Anh='sp16.jpg',MaLoaiSP='14',MaNCC='1',SoLuongTon='100'
where MaSP = 16
update SanPham
set TenSP='tresoi ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=3000000,GiaNhap=1000000,Anh='sp17.jpg',MaLoaiSP='14',MaNCC='1',SoLuongTon='100'
where MaSP = 17
update SanPham
set TenSP='Ujnardin',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=2900000,GiaNhap=1000000,Anh='sp18.jpg',MaLoaiSP='14',MaNCC='1',SoLuongTon='100'
where MaSP = 18
update SanPham
set TenSP='SYL ',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=3400000,GiaNhap=1000000,Anh='sp19.jpg',MaLoaiSP='15',MaNCC='1',SoLuongTon='100'
where MaSP = 19
update SanPham
set TenSP='Mademoiselle ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=3500000,GiaNhap=1000000,Anh='sp20.jpg',MaLoaiSP='15',MaNCC='1',SoLuongTon='100'
where MaSP = 20
update SanPham
set TenSP='Miss ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nam',GiaBan=3600000,GiaNhap=1000000,Anh='sp21.jpg',MaLoaiSP='15',MaNCC='1',SoLuongTon='100'
where MaSP = 21
update SanPham
set TenSP='Pour',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=3700000,GiaNhap=1000000,Anh='sp22.jpg',MaLoaiSP='2',MaNCC='1',SoLuongTon='100'
where MaSP = 22
update SanPham
set TenSP='Bloom ',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=2550000,GiaNhap=1000000,Anh='sp23.jpg',MaLoaiSP='2',MaNCC='1',SoLuongTon='100'
where MaSP = 23
update SanPham
set TenSP='ABSS ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=2130000,GiaNhap=1000000,Anh='sp24.jpg',MaLoaiSP='2',MaNCC='1',SoLuongTon='100'
where MaSP = 24
update SanPham
set TenSP='DLS ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=2990000,GiaNhap=1000000,Anh='sp25.jpg',MaLoaiSP='4',MaNCC='1',SoLuongTon='100'
where MaSP = 25
update SanPham
set TenSP='Dylan ',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=329000,GiaNhap=1000000,Anh='sp26.jpg',MaLoaiSP='4',MaNCC='1',SoLuongTon='100'
where MaSP = 26
update SanPham
set TenSP='lancome ',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=3490000,GiaNhap=1000000,Anh='sp27.jpg',MaLoaiSP='4',MaNCC='1',SoLuongTon='100'
where MaSP = 27
update SanPham
set TenSP='Tom',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1900000,GiaNhap=1000000,Anh='sp28.jpg',MaLoaiSP='5',MaNCC='1',SoLuongTon='100'
where MaSP = 28
update SanPham
set TenSP='VicTo ',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1800000,GiaNhap=1000000,Anh='sp29.jpg',MaLoaiSP='5',MaNCC='1',SoLuongTon='100'
where MaSP = 29
update SanPham
set TenSP='BVL',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp30.jpg',MaLoaiSP='5',MaNCC='1',SoLuongTon='100'
where MaSP = 30
update SanPham
set TenSP='GAL',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp31.jpg',MaLoaiSP='6',MaNCC='1',SoLuongTon='100'
where MaSP = 31
update SanPham
set TenSP='VSD',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp32.jpg',MaLoaiSP='6',MaNCC='1',SoLuongTon='100'
where MaSP = 32
update SanPham
set TenSP='YVL',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp33.jpg',MaLoaiSP='6',MaNCC='1',SoLuongTon='100'
where MaSP = 33
update SanPham
set TenSP='ASL',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp34.jpg',MaLoaiSP='7',MaNCC='1',SoLuongTon='100'
where MaSP = 34
update SanPham
set TenSP='YIU',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp35.jpg',MaLoaiSP='7',MaNCC='1',SoLuongTon='100'
where MaSP = 35
update SanPham
set TenSP='ALD',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp36.jpg',MaLoaiSP='7',MaNCC='1',SoLuongTon='100'
where MaSP = 36
update SanPham
set TenSP='PEE',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp37.jpg',MaLoaiSP='8',MaNCC='1',SoLuongTon='100'
where MaSP = 37
update SanPham
set TenSP='BAA',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp38.jpg',MaLoaiSP='8',MaNCC='1',SoLuongTon='100'
where MaSP = 38
update SanPham
set TenSP='BKL',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp39.jpg',MaLoaiSP='8',MaNCC='1',SoLuongTon='100'
where MaSP = 39
update SanPham
set TenSP='JBG',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp40.jpg',MaLoaiSP='9',MaNCC='1',SoLuongTon='100'
where MaSP = 40
update SanPham
set TenSP='TSA',MoTa='  Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp41.jpg',MaLoaiSP='9',MaNCC='1',SoLuongTon='100'
where MaSP = 41
update SanPham
set TenSP='SSO',MoTa=' Mot hương thơm bí an đay quyen ru voi tone Da thuoc la chu đao  cung đo luu huong tuyet voi',GioiTinh='Nu',GiaBan=1550000,GiaNhap=1000000,Anh='sp42.jpg',MaLoaiSP='9',MaNCC='1',SoLuongTon='100'
where MaSP = 42
