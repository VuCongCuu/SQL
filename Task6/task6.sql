CREATE DATABASE Task6
USE Task6

CREATE TABLE PhongBan(
MaPB VARCHAR(7) PRIMARY KEY,
TenPB NVARCHAR(50)
)
INSERT PhongBan VALUES ('KT','Ke Toan')
INSERT PhongBan VALUES('CV','Co Van')
INSERT PhongBan VALUES('TC','Tai Chinh')
INSERT PhongBan VALUES('CVI','Chuyen Vien')
INSERT PhongBan VALUES('DA','Du An' )
SELECT * FROM PhongBan

CREATE TABLE NhanVien(
MaNV VARCHAR(7) PRIMARY KEY,
TenNV NVARCHAR(50),
NgaySinh DATE,
SoCMND CHAR(9),
GioiTinh Char(1) DEFAULT('M'),
DiaChi NVARCHAR(100),
NgayVaoLam DATETIME, constraint ck_NhanVien CHECK(year(NgayVaoLam) >= year (NgaySinh) + 20)
)
ALTER TABLE NhanVien ADD MaPB VARCHAR(7)
ALTER TABLE NhanVien ADD CONSTRAINT av FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)


INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,DiaChi,NgayVaoLam,MaPB) VALUES ('VTAD','Vu The Anh Duc','1993-3-17','123456789','Thanh Xuan Ha Noi','2021-1-7','DA')
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,DiaChi,NgayVaoLam,MaPB) VALUES ('VKK','Vu Khac Khang','1996-4-8','789456123','Thanh Tri Ha Noi','2021-1-18','DA' )
INSERT INTO NhanVien VALUES ('NNM','Nguyen Nhu Mai','1998-7-19','258963147','F','Tien Du Bac Ninh','2019-7-19','KT')
INSERT INTO NhanVien VALUES('CTL','Cao Thi Lan','1991-7-8','159863254','F','Xuan Truong Nam Dinh','2021-3-1','KT')
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,DiaChi,NgayVaoLam,MaPB) VALUES ('VCC','Vu Cong Cuu','1996-9-3','163310070','Thanh Tri Ha Noi','2018-8-9','CV')
INSERT INTO NhanVien(MaNV,TenNV,NgaySinh,SoCMND,DiaChi,NgayVaoLam,MaPB) VALUES('VKL','Vu Khac Long','1995-5-6','321654987','Giao Thuy Nam Dinh','2020-9-9','CV')
INSERT INTO NhanVien VALUES('VKD','Vu Khac Dong','1991-1-1','852963741','M','Long Bien Ha Noi','2019-8-8','TC')
INSERT INTO NhanVien VALUES('PVA','Phan Van Anh','1992-1-1','852463741','F','Dong Anh Ha Noi','2019-2-8','TC')
INSERT INTO NhanVien VALUES('NCP','Nguyen Cong Phat','1993-1-1','852963841','M','Long Bien Ha Noi','2019-1-8','CVI')
INSERT INTO NhanVien VALUES('LXT','Le Xuan Truong','1995-1-1','852163741','F','Long Bien Ha Noi','2019-8-8','CVI')

SELECT * FROM NhanVien

CREATE TABLE LuongDA (
MaDA VARCHAR(8) PRIMARY KEY,
MaNV VARCHAR(7), CONSTRAINT ax FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
NgayNhan DATETIME NOT NULL DEFAULT(GETDATE()),
SoTien MONEY CHECK(Sotien >0)
)
DROP CONSTRAINT 

INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA1','CTL','9000000')
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA5','LXT','8000000')
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA2','NCP','7000000')
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA3','NNM','9000000')
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA6','PVA','9000000')
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA7','VCC','20000000')
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA4','VKD','7000000')
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA8','VKK','9000000')
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA9','VKL','10000000')
INSERT INTO LuongDA(MaDA,MaNV,SoTien) VALUES('DA10','VTAD','9000000')

INSERT INTO LuongDA VALUES()

SELECT * FROM LuongDA

--Nhân Viên giơi tinh F

SELECT * FROM NhanVien WHERE GioiTinh='F'

--Hien thi tat ca du an
SELECT MaDA FROM LuongDA
--hien thi tong luong cua tung nhan vien

SELECT TenNV,SUM(SoTien) AS TongLuong FROM NhanVien AS A
INNER JOIN LuongDA AS B ON B.MaNV=A.MaNV
GROUP BY TenNV
GO

--Hien thi tat ca thong tin nhan vien cua phong ban ke toan

SELECT * FROM PhongBan AS A
INNER JOIN NhanVien AS B ON B.MaPB=A.MaPB
INNER JOIN LuongDA AS C ON C.MaNV=B.MaNV
WHERE TenPB='KeToan'
GO

--Hien thi luong cua nhan vien phong Co van

SELECT TenNV,SoTien FROM NhanVien AS A
INNER JOIN LuongDA AS B ON B.MaNV=A.MaNV
INNER JOIN PhongBan AS C ON C.MaPB=A.MaPB
WHERE TenPB='Co Van'
Go
--hien thi so luong nhan vien cua tung phong

SELECT TenNV,TenPB,SoTien FROM NhanVien AS A
INNER JOIN LuongDA AS B ON B.MaNV=A.MaNV
INNER JOIN PhongBan AS C ON C.MaPB=A.MaPB
GO

--Tinh tong nhan vien trong phong tai chinh

SELECT COUNT(TenNV) AS TongSoNhanVien FROM NhanVien WHERE MaPB='TC'

--hien thi tong tien cua ca nhan vien co CMT ket thuc bang 1

SELECT SUM(SoTien) AS TongSoTienCoCMT1 FROM NhanVien AS A
INNER JOIN LuongDA AS B ON B.MaNV=A.MaNV
WHERE SoCMND LIKE '%1'
GO

--Tim nhan vien co So luong cao nhat
