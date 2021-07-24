CREATE DATABASE Task8_SQL3
USE Task8_SQL3

CREATE TABLE KhachHang(
TenKH NVARCHAR(50),
MaKH NVARCHAR(30) PRIMARY KEY NOT NULL,
CMT BIGINT,
DiaChi TEXT
)
INSERT INTO KhachHang VALUES(N'Cao Thị Lan','CTL',123456789,N'Hà Nội')
INSERT INTO KhachHang VALUES (N'Vũ Ngọc Hân','VNH',456789123,N'Hà Nam')
INSERT INTO KhachHang VALUES (N'Nguyễn Như Mai','NNM',852698740,N'Bắc Ninh')

SELECT * FROM KhachHang

CREATE TABLE ThueBao(
MaKH NVARCHAR(30),CONSTRAINT KH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
SoTB BIGINT,
LoaiTB NVARCHAR(30),
NgayDK DATETIME
)

INSERT INTO ThueBao VALUES ('CTL','1234567891',N'Trả Sau','2021-1-8')
INSERT INTO ThueBao VALUES ('CTL','78965412581',N'Trả Trước','2021-9-1')
INSERT INTO ThueBao VALUES ('VNH','78965412583',N'Trả Sau','2021-10-1')
INSERT INTO ThueBao VALUES ('VNH','78965412584',N'Trả Trước','2021-7-1')
INSERT INTO ThueBao VALUES ('NNM','78965412585',N'Trả Sau','2021-5-1')
INSERT INTO ThueBao VALUES ('NNM','78965412586',N'Trả Trước','2021-4-1')


SELECT * FROM ThueBao

--Hiển Thị toàn bộ thông tin của khách hang

SELECT * FROM KhachHang AS A
INNER JOIN ThueBao AS B ON B.MaKH=A.MaKH
GO
--Hiên Thi Toan bộ thông tin của thuê bao
SELECT * FROM ThueBao

-- hiên thị thông tin thue bao co số 78965412586
SELECT * FROM KhachHang AS A
INNER JOIN ThueBao AS B ON B.MaKH=A.MaKH
WHERE SoTB='78965412586'
GO

--Tổng Số Khách Của Công ty
SELECT COUNT(TenKH)[SoKhachHang] FROM KhachHang
--Tông so thuê bao công ti

SELECT COUNT(SoTB)[TongTB] FROM ThueBao

--thay đổi trường ngay đăng ký là NOT NULL
ALTER TABLE ThueBao 
ALTER COLUMN NgayDK DATETIME NOT NULL

--viết lệnh thay đổi trường ngày đăng ký trước ngày hiện tại

ALTER TABLE ThueBao ADD CONSTRAINT BF CHECK (NgayDK<GETDATE())

--Viết câu lệnh để thay đổi số điện thoại phải bắt đầu 09

-- Viết câu lệnh để thêm trường số điểm thưởng cho mỗi số thuê bao.

ALTER TABLE ThueBao ADD DiemThuong INT.

