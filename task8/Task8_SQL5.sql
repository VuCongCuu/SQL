CREATE DATABASE Task8_SQL5
USE Task8_SQL5

CREATE TABLE Name (
Ten NVARCHAR(40),
MaT NVARCHAR(10) PRIMARY KEY NOT NULL,
DiaChi NVARCHAR(40),
NgaySinh DATETIME
)

INSERT INTO Name VALUES (N'Cao Thị Lan','CTL',N'Nam Định','1991-1-2')
INSERT INTO Name VALUES (N'Vũ Ngọc Hân','VNH',N'Hà Nội','1992-1-2')
INSERT INTO Name VALUES (N'Nguyễn Văn An','NVA',N'Ha Nam','1991-1-2')
SELECT * FROM Name

CREATE TABLE SDT (
MaT NVARCHAR(10),CONSTRAINT MT FOREIGN KEY (MaT) REFERENCES Name(MaT),
Sdt BIGINT
)

DROP TABLE SDT
INSERT INTO SDT VALUES ('CTL','123456789')
INSERT INTO SDT VALUES ('CTL','123456781')
INSERT INTO SDT VALUES ('VNH','123456782')
INSERT INTO SDT VALUES ('VNH','123456783')

SELECT * FROM SDT

SELECT * FROM Name AS A
INNER JOIN SDT AS B ON B.MaT=A.MaT
GO

--Liệt kê danh sách những người trong danh bạ
	 SELECT Ten FROM Name

--Liệt kê danh sách số điện thoại có trong danh bạ
	SELECT Sdt FROM SDT

--Liệt kê danh sách người trong danh bạ theo thứ thự alphabet.
  SELECT Ten FROM Name ORDER BY Ten ASC

--Liệt kê các số điện thoại của người có thên là Cao Thi Lan.
 
SELECT Ten,Sdt FROM Name AS A
INNER JOIN SDT AS B ON B.MaT=A.MaT
WHERE Ten=N'Cao Thị Lan'
GO

--Liệt kê những người có ngày sinh là 1991-1-2
SELECT Ten,NgaySinh FROM Name 
WHERE NgaySinh='1991-1-2'
GROUP BY Ten,NgaySinh
GO
--Tìm số lượng số điện thoại của mỗi người trong danh bạ.
SELECT MaT,COUNT(*)[SoTB] FROM SDT GROUP BY MaT
--Tìm tổng số người trong danh bạ sinh vào thang 12.

--Hiển thị toàn bộ thông tin về người, của từng số điện thoại.

--Hiển thị toàn bộ thông tin về người, của số điện thoại 123456789.

--Viết câu lệnh để thay đổi trường ngày sinh là trước ngày hiện tại.

--Viết câu lệnh để xác định các trường khóa chính và khóa ngoại của các bảng.

--Viết câu lệnh để thêm trường ngày bắt đầu liên lạc.