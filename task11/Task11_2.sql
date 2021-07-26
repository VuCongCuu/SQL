CREATE DATABASE Task11
USE Task11

CREATE TABLE #Students
(
RollNo varchar(6) CONSTRAINT PK_Students PRIMARY KEY,
FullName nvarchar(100),
Birthday datetime constraint DF_StudentsBirthday DEFAULT DATEADD(yy, -18, GETDATE())
)
SELECT * FROM #Students

--Tạo thủ tục lưu trữ tạm để chèn dữ liệu vào bảng tạm
CREATE PROCEDURE #spInsertStudents
@rollNo varchar(6),
@fullName nvarchar(100),
@birthday datetime
AS BEGIN
IF(@birthday IS NULL)
SET @birthday=DATEADD(YY, -18, GETDATE())
INSERT INTO #Students(RollNo, FullName, Birthday)
VALUES(@rollNo, @fullName, @birthday)

END
GO
--Sử dụng thủ tục lưu trữ để chèn dữ liệu vào bảng tạm
	EXECUTE #spInsertStudents 'A12345', 'abc', NULL
	EXECUTE #spInsertStudents 'A54321', 'abc', '12/24/2011'
	SELECT * FROM #Students
--Tạo thủ tục lưu trữ tạm để xóa dữ liệu từ bảng tạm theo RollNo
CREATE PROCEDURE #spDeleteStudents
@rollNo varchar(6)
AS BEGIN
DELETE FROM #Students WHERE RollNo=@rollNo
END
--Xóa dữ liệu sử dụng thủ tục lưu trữ
EXECUTE #spDeleteStudents 'A12345'
GO
DECLARE 
SELECT * FROM #Students

--Tạo một thủ tục lưu trữ sử dung lệnh RETURN để trả về một số nguyên
CREATE PROCEDURE Cal_Square @num int=0 AS
BEGIN
RETURN (@num * @num);
END
GO
--Chạy thủ tục lưu trữ
DECLARE @square int;
EXEC @square = Cal_Square 10;
PRINT @square;
GO
--Xem định nghĩa thủ tục lưu trữ bằng hàm OBJECT_DEFINITION
SELECT
OBJECT_DEFINITION(OBJECT_ID('HumanResources.uspUpdateEmployeePersonalInfo')) AS DEFINITION

CREATE TABLE DoChoi(
MaDC INT CONSTRAINT KC PRIMARY KEY,
TenDC VARCHAR(50),
LoaiDC VARCHAR(50),
TenNSX VARCHAR(50),
PhuHop VARCHAR(50),
Gia MONEY,
TrongLuong INT,
TonKho INT
)
SELECT * FROM DoChoi
DROP TABLE DoChoi
--Tạo bảng Toys với cấu trúc giống như trên. Thêm dữ liệu (15 bản ghi) vào bảng với giá trị của
--trường QtyOnHand ít nhất là 20 cho mỗi sản phẩm đồ chơi.
INSERT INTO DoChoi VALUES(1,'Gau Bong','Be Gai','ABC','10 tuoi','1000',50,30)
INSERT INTO DoChoi VALUES(2,'Lego','Xep Hinh','ABC','15 tuoi','2000',100,40)
INSERT INTO DoChoi VALUES(3,'Oto','Be Trai','ADC','3 tuoi','500',10,20)
INSERT INTO DoChoi VALUES()
INSERT INTO DoChoi VALUES()

--Viết câu lệnh tạo Thủ tục lưu trữ có tên TDoChoi là  cho phép liệt kê tất cả các loại đồ chơi có trọng lượng lớn hơn 50g.

CREATE PROCEDURE TDoChoi @TrongLuong INT
AS
SELECT * FROM DoChoi WHERE TrongLuong=@TrongLuong

EXECUTE TDoChoi 50 

--Viết câu lệnh tạo Thủ tục lưu trữ có tên là PriceIncrease cho phép tăng giá của tất cả các loại đồ chơi lên thêm 10 đơn vị giá.
CREATE PROCEDURE QtyOnHand AS
SELECT ProductCode,Name,QtyOnHand-5 AS SauKhiGiamSoLuong FROM Toys