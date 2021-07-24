CREATE DATABASE Task8_SQL4
USE Task8_SQL4

CREATE TABLE NhanVien(
TenNV NVARCHAR(50),
MaNV NVARCHAR(10) PRIMARY KEY NOT NULL
)
INSERT INTO NhanVien VALUES (N'Cao Thị Lan','CTL')
INSERT INTO NhanVien VALUES (N'Vũ Ngọc Hân','VNH')
SELECT * FROM NhanVien

CREATE TABLE SanPham(
TenSP NVARCHAR(50),
MaSP NVARCHAR(10),
NSX DATETIME,
MaNV NVARCHAR(10), CONSTRAINT MNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
INSERT INTO SanPham VALUES (N'Máy Tính','123','2021-3-1','CTL')
INSERT INTO SanPham VALUES (N'Điện Thoại','456','2021-3-2','CTL')
INSERT INTO SanPham VALUES (N'Máy Ảnh','789','2021-3-3','VNH')
INSERT INTO SanPham VALUES ('TIVI','147','2021-3-4','VNH')


SELECT * FROM SanPham

--Liệt kê danh sách sản phẩm của công ty.

SELECT TenSP FROM SanPham 

--Liệt kê danh sách người chịu trách nhiệm của công ty.

SELECT TenNV FROM NhanVien


--Liệt kê danh sách loại sản phẩm của công ty theo thứ tự tăng dần của tên
SELECT TenSP FROM SanPham ORDER BY TenSP ASC

--Liệt kê danh sách người chịu trách nhiệm của công ty theo thứ tự Giam dần của tên.

SELECT TenNV FROM NhanVien ORDER BY TenNV DESC

--Liệt kê các sản phẩm của loại sản phẩm có mã số là 123.

SELECT * FROM SanPham WHERE MaSP='123'

--Liệt kê các sản phẩm Cao Thi Lan chịu trách nhiệm theo thứ tự giảm đần của mã.
SELECT TenSP FROM SanPham WHERE MaNV='CTL'


