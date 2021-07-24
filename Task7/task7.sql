CREATE DATABASE Task7
USE Task7

CREATE TABLE DanhSachCacMatHang(
STT INT IDENTITY(1,1),
TenSP NVARCHAR(50),
MaSP NVARCHAR(50) PRIMARY KEY NOT NULL ,
MoTa NVARCHAR(50),
DonVi VARCHAR(50), 
Gia MONEY CHECK(Gia >0),
SoLuong INT,
)

ALTER TABLE DanhSachCacMatHang ADD Note TEXT

INSERT INTO DanhSachCacMatHang(TenSP,MaSP,MoTa,DonVi,Gia,SoLuong) VALUES (N'Máy Tính T450','T450',N'Máy Nhập Mới',N'Chiếc',1000,100)
INSERT INTO DanhSachCacMatHang(TenSP,MaSP,MoTa,DonVi,Gia,SoLuong) VALUES (N'Điên Thoai NOKIA5670','5670',N'Điện Thoại Đang Hot',N'Chiếc',200,99)
INSERT INTO DanhSachCacMatHang(TenSP,MaSP,MoTa,DonVi,Gia,SoLuong) VALUES (N'Máy In SAMSUNG 450','450',N'Máy In Đang Ế',N'Chiếc',100,50)
INSERT INTO DanhSachCacMatHang(TenSP,MaSP,MoTa,DonVi,Gia,SoLuong) VALUES (N'Laptop','7510',N'Máy 99%',N'Chiếc',900,50)
UPDATE DanhSachCacMatHang SET Note=N'Còn' WHERE STT=1

SELECT * FROM DanhSachCacMatHang


CREATE TABLE KhachHang(
STT INT IDENTITY(1,1),
TenKH NVARCHAR(50),
MaKH NVARCHAR(50) PRIMARY KEY NOT NULL,
DiaChi NVARCHAR(50),
SDT INT,
Note TEXT
)
ALTER TABLE KhachHang ALTER COLUMN SDT BIGINT



INSERT INTO KhachHang(TenKH,MaKH,DiaChi,SDT,Note) VALUES (N'Nguyễn Văn An','KH1',N'Thanh Xuân Hà Nội','123456789','VIP')
INSERT INTO KhachHang(TenKH,MaKH,DiaChi,SDT,Note) VALUES (N'Phan Anh Vũ','KH2',N'Thanh Trì Hà Nội','456789126',N'Hay Hủy Đơn')
INSERT INTO KhachHang(TenKH,MaKH,DiaChi,SDT) VALUES (N'Vũ Tông Phan','KH3',N'Long Biên Hà Nội','234564545')
INSERT INTO KhachHang(TenKH,MaKH,DiaChi,SDT) VALUES (N'Phan Thế Anh','KH4',N'Gia Lâm- Hà Nội','564564565')

SELECT * FROM KhachHang

CREATE TABLE DonDatHang(
STT INT IDENTITY(1,1),
MaDH INT PRIMARY KEY  NOT NULL ,
MaKH NVARCHAR(50), CONSTRAINT KH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
NgayDatHang DATETIME,
Note TEXT
)
INSERT INTO DonDatHang(MaDH,MaKH,NgayDatHang,Note) VALUES (100,'KH1','12-7-2021',N'Đang Giao')
INSERT INTO DonDatHang(MaDH,MaKH,NgayDatHang,Note) VALUES (101,'KH2','11-7-2021',N'Đang Gói Hàng')
INSERT INTO DonDatHang(MaDH,MaKH,NgayDatHang) VALUES (102,'KH3','10-7-2021')

SELECT * FROM DonDatHang


CREATE TABLE ChiTietDonHang(
STT INT IDENTITY (1,1),
MaDH INT , CONSTRAINT DH FOREIGN KEY (MaDH) REFERENCES DonDatHang(MaDH),
MaSP NVARCHAR(50), CONSTRAINT SP FOREIGN KEY (MaSP) REFERENCES DanhSachCacMatHang(MaSP),
Gia MONEY,
SoLuong INT,
ThanhTien MONEY
)

INSERT INTO ChiTietDonHang(MaDH,MaSP,Gia,SoLuong,ThanhTien) VALUES (100,'T450','1000',2,'2000')
INSERT INTO ChiTietDonHang(MaDH,MaSP,Gia,SoLuong,ThanhTien) VALUES (100,'450','100',2,'200')
INSERT INTO ChiTietDonHang(MaDH,MaSP,Gia,SoLuong,ThanhTien) VALUES (100,'5670','100',2,'200')
INSERT INTO ChiTietDonHang(MaDH,MaSP,Gia,SoLuong,ThanhTien) VALUES (101,'5670','2000',1,'2000')
INSERT INTO ChiTietDonHang(MaDH,MaSP,Gia,SoLuong,ThanhTien) VALUES(102,'450','100',3,'300')

SELECT * FROM ChiTietDonHang

-- Danh sách khách hàng đã mua ở cửa hàng
SELECT TenKH FROM KhachHang


--Danh sach sp của cửa hàng
SELECT TenSP FROM DanhSachCacMatHang


--Danh Sach Đơn Đặt hàng của cửa hàng
SELECT MaDH FROM DonDatHang


-- Liet ke danh sach khach hàng theo thu tu Alphabet
	
	SELECT * FROM KhachHang ORDER BY TenKH ASC 

--lien ke danh sách sp của cửa hàng theo thứ tự giảm dần

SELECT * FROM DanhSachCacMatHang ORDER BY Gia DESC 

--Liet ke danh sach ma Nguyễn Văn An Đã mua

SELECT TenKH,TenSP FROM DonDatHang AS A
INNER JOIN KhachHang AS B ON B.MaKH = A.MaKH
INNER JOIN ChiTietDonHang AS C ON C.MaDH=A.MaDH
INNER JOIN DanhSachCacMatHang AS D ON D.MaSP= C.MaSP
WHERE TenKH=N'Nguyễn Văn An'
GO

--Số khach hàng đã mua ở cửa hàng
SELECT COUNT(TenKH) AS SoKhacDaMua FROM KhachHang

--Số mặt hàng mà của hàng bán
SELECT COUNT(TenSP) AS SoSanPham FROM DanhSachCacMatHang

--Tổng tiền từng đơn hàng
SELECT TenKH,Sum(ThanhTien) AS TongTien FROM KhachHang AS A
INNER JOIN DonDatHang AS B ON B.MaKH = A.MaKH
INNER JOIN ChiTietDonHang AS C ON C.MaDH = B.MaDH
GROUP BY TenKH
GO

--thay đổi trường giá tiền của từng mặt hàng >>1
ALTER TABLE DanhSachCacMatHang ADD CONSTRAINT GIA CHECK(Gia>1)

--thay đổi ngày đặt hàng của khách hàng phải nhỏ hơn ngày hiện tại (Cô kiêm tra giup e câu lệnh này sai chỗ nào với ạ ht toàn báo sung đột thôi ạ)

ALTER TABLE DonDatHang ADD CONSTRAINT DY CHECK(NgayDatHang < GETDATE())

--thêm cột ngày xuất hiện trên thị trường sản phẩm
ALTER TABLE DanhSachCacMatHang ADD NgayXuatHien DATETIME
SELECT * FROM DanhSachCacMatHang

