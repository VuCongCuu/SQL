 CREATE DATABASE Task8_SQL6
USE Task8_SQL6

CREATE TABLE NhaXuatBan(
TenNXB NVARCHAR(50),
MaNXB NVARCHAR (10) PRIMARY KEY NOT NULL
)

INSERT INTO NhaXuatBan VALUES (N'Giáo Dục','GD')
INSERT INTO NhaXuatBan VALUES (N'Kim Đồng','KD')
SELECT * FROM NhaXuatBan

CREATE TABLE Sach(
TenSach NVARCHAR(50),
MaSach NVARCHAR(10) PRIMARY KEY NOT NULL,
TenTG NVARCHAR(50),
MaNXB NVARCHAR(10),CONSTRAINT MA FOREIGN KEY (MaNXB) REFERENCES NhaXuatBan(MaNXB),
LoaiSach NVARCHAR(40),
LanXuatBan INT DEFAULT '1'
)
INSERT INTO Sach(TenSach,MaSach,TenTG,MaNXB,LoaiSach) VALUES (N'Toán Lớp 1','TOAN1',N'Vũ Ngọc Hân','GD',N'Toán Học')
INSERT INTO Sach(TenSach,MaSach,TenTG,MaNXB,LoaiSach) VALUES (N'Văn Lớp 1','VAN1',N'Phạm Anh Khoa','GD',N'Văn Học')
INSERT INTO Sach(TenSach,MaSach,TenTG,MaNXB,LoaiSach) VALUES (N'Tin Học Lớp 5','TIN5',N'Vũ Khắc Khang','KD',N'Tin Học')
INSERT INTO Sach(TenSach,MaSach,TenTG,MaNXB,LoaiSach) VALUES (N'Khoa Học Lớp 5','KHOA5',N'Cao Thị Lan','KD',N'Khoa Học')

ALTER TABLE Sach ADD NamXuatBan DATETIME DEFAULT GETDATE()
DELETE TABLE S

SELECT * FROM Sach

CREATE TABLE Kho(
MaSach NVARCHAR(10), CONSTRAINT SA FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
Gia MONEY,
SoLuong INT,
Note TEXT
)
INSERT INTO Kho VALUES ('TOAN1','1000',100,N'Sách Ế')
INSERT INTO Kho(MaSach,Gia,SoLuong) VALUES ('VAN1','2000',50)
INSERT INTO Kho VALUES ('TIN5','6000',10,N'Sách Bán Chạy')
INSERT INTO Kho(MaSach,Gia,SoLuong) VALUES ('KHOA5','4000',20)

SELECT * FROM Kho

--Liệt kê 10 cuốn sách có giá bán cao nhất

--Tìm những cuốn sách có tiêu đề chứa từ “tin học”

--Liệt kê các cuốn sách có tên bắt đầu với chữ “T” theo thứ tự giá giảm dần

--Liệt kê các cuốn sách của nhà xuất bản Tri thức

--Lấy thông tin chi tiết về nhà xuất bản xuất bản cuốn sách “Trí tuệ Do Thái”

--Hiển thị các thông tin sau về các cuốn sách: Mã sách, Tên sách, Năm xuất bản, Nhà xuất bản,

--Tìm cuốn sách có giá bán đắt nhất

--Tìm cuốn sách có số lượng lớn nhất trong kho

--Tìm các cuốn sách của tác giả “Eran Katz”

--Giảm giá bán 10% các cuốn sách xuất bản từ năm 2008 trở về trước

--Thống kê số đầu sách của mỗi nhà xuất bản


--Thống kê số đầu sách của mỗi loại sách

--

--

--

--

--