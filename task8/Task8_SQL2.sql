CREATE DATABASE Task8
USE Task8

CREATE TABLE SanPham(
STT INT IDENTITY(1,1),
TenSP NVARCHAR(50),
MaSP NVARCHAR(30) PRIMARY KEY NOT NULL,
MoTa NVARCHAR(50),
DonVi NVARCHAR(30),
Gia MONEY,
SoLuongHienCo INT,
Note TEXT
)

INSERT INTO SanPham (TenSP,MaSP,MoTa,DonVi,Gia,SoLuongHienCo) VALUES (N'Máy Tính DELL7510','7510',N'Hàng Bán Chạy',N'Chiếc',1000,50)
INSERT INTO SanPham (TenSP,MaSP,MoTa,DonVi,Gia,SoLuongHienCo) VALUES (N'Điện Thoại NOKIA6570','6570',N'Hàng Thanh Lý',N'Chiếc',500,10)
INSERT INTO SanPham (TenSP,MaSP,MoTa,DonVi,Gia,SoLuongHienCo) VALUES (N'Máy In SAMSUNG 450','450',N'Hàng Mới Nhập',N'Chiếc',200,20)
INSERT INTO SanPham (TenSP,MaSP,DonVi,Gia,SoLuongHienCo) VALUES(N'Chuột Máy Tinh','123',N'Chiếc',700,15)
INSERT INTO SanPham (TenSP,MaSP,DonVi,Gia,SoLuongHienCo) VALUES (N'Bàn Phím Máy Tính','456',N'Chiếc',100,20)
SELECT * FROM SanPham

--Xóa  dong
DELETE FROM SanPham WHERE STT=5

CREATE TABLE NhaSX(
TenNXS NVARCHAR(50),
MaNSX NVARCHAR(50),
MaSP NVARCHAR(30),CONSTRAINT SP FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
DiaChi NVARCHAR(50),
SDT BIGINT

)
INSERT INTO NhaSX VALUES ('Asus','AS123','123','USA',1234567890)
INSERT INTO NhaSX VALUES ('Asus','AS123','456','USA',1234567890)
INSERT INTO NhaSX VALUES ('NOKIA','N123','6570','JAPAN',4567891230)
INSERT INTO NhaSX VALUES ('Dell','D123','7510','USA',7418589630)
INSERT INTO NhaSX VALUES ('Samsung','S123','450','KOREA',8526987890)


SELECT * FROM NhaSX

--Hiển thi tát cả nha sx
SELECT TenNXS FROM NhaSX GROUP BY TenNXS

--Hiển thi tất cả SP

SELECT TenSP FROM SanPham

--Liệt kê danh sach hang theo thư tuwh ngược ALPHABET

SELECT TenNXS FROM NhaSX GROUP BY TenNXS ORDER BY TenNXS DESC 

--liet ke san pham theo gia giam dan

SELECT TenSP,Gia FROM SanPham ORDER BY Gia DESC

--Hiển thị thông tin hãng ASUS

SELECT * FROM NhaSX AS A
INNER JOIN SanPham AS B ON B.MaSP=A.MaSP
WHERE TenNXS='Asus'
GO

-- Liet ke san pham con it hon 20 chiec

SELECT TenSP,SoLuongHienCo FROM SanPham WHERE SoLuongHienCo<20

--liet ke sp của asus

SELECT TenSP FROM SanPham AS A
INNER JOIN NhaSX AS B ON B.MaSP=A.MaSP
WHERE TenNXS='Asus'
GO

--So luong sp Cua hang bán
 SELECT COUNT(TenSP) AS SoSP FROM SanPham
--Số hãng mà cửa hàng có
SELECT  COUNT(TenNXS) AS SoHang FROM NhaSX 

