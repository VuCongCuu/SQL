USE AdventureWorks2019

CREATE PROCEDURE Ten @HireYear INT
AS
SELECT * FROM HumanResources.Employee
WHERE DATEPART(YY,HireDate)=@HireYear
--chay thu
EXECUTE Ten 2009
--Tạo thủ tục đếm số người làm việc 
CREATE PROCEDURE TEN_1 @HireYear INT, @COUNT INT OUTPUT
AS
SELECT @Count=COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY,HireDate)=@HireYear
--chay thu
DECLARE @Number INT
EXECUTE TEN_1 2009,@Number OUTPUT
PRINT @Number
--Tao thu tuc
CREATE PROCEDURE Ten_3 @HireYear INT
AS
DECLARE @Count INT
SELECT @Count=COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY,HireDate)=@HireYear
RETURN @Count
--Chay thu
DECLARE @Number INT
EXECUTE @Number= Ten_3 2009
PRINT @Number

CREATE TABLE Students
(
RollNo varchar(6) CONSTRAINT PK_Students PRIMARY KEY,
FullName nvarchar(100),
Birthday datetime constraint DF_StudentsBirthday DEFAULT DATEADD(yy, -18, GETDATE())
)
DROP TABLE Students
SELECT * FROM Students
--Tạo thủ tục lưu trữ tạm để chèn dữ liệu vào bảng tạm
CREATE PROCEDURE InsertStudents
@rollNo varchar(6),
@fullName nvarchar(100),
@birthday datetime
AS BEGIN
IF(@birthday IS NULL)
SET @birthday=DATEADD(YY, -18, GETDATE())
INSERT INTO Students(RollNo, FullName, Birthday)
VALUES(@rollNo, @fullName, @birthday)
END
.--Sử dụng thủ tục lưu trữ để chèn dữ liệu vào bảng tạm
EXEC Students 'A12345', 'abc', NULL
EXEC #spStudents 'A54321', 'abc', '12/24/2011'
SELECT * FROM Students