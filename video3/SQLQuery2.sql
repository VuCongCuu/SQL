USE AdventureWorks2019
SELECT *FROM HumanResources.Employee

Go
DECLARE @deptID INT
SELECT @deptID=1
SELECT Name, GroupName FROM HumanResources.Department WHERE DepartmentID =@deptID

Go
SELECT @@LANGUAGE
SELECT @@VERSION
SELECT @@IDENTITY

Go
SELECT SUM(StandardCost) FROM Production.ProductCostHistory
SELECT AVG(StandardCost) FROM Production.ProductCostHistory 
SELECT MAX(StandardCost) FROM Production.ProductCostHistory
SELECT COUNT(*) FROM Production.ProductCostHistory --Dem tong so ban ghi trong bang productPhoto
SELECT GETDATE() -- Ngay gio
SELECT DATEPART(hh,GETDATE()) --lay ra gio
SELECT CONVERT (VarChar(50),GETDATE(),103)

SELECT DB_ID('AdventureWOrks2019') --dinh danh cua co so du lieu

CREATE DATABASE --EXAMPLE3 THem co so du lieu

USE EXAMPLE3 --Goi den example3

CREATE TABLE Contacts --them bang

(MailID VARCHAR(20),
Name NTEXT,TelephoneNumber INT) --dinh dang ten cac cot

ALTER TABLE Contacts ADD Assress NVARCHAR(50) --them cot Assress

INSERT INTO Contacts values ('abc@gmail.com',N'Nguyen Van',123,N'Ha Noi') --THEM giu lieu trong bang
INSERT INTO Contacts values ('abcd@gmail.com',N'Nguyen HAi',1234, N'Ha Noi')
INSERT INTO Contacts values ('abcde@gmail.com',N'Nguyen BA',12345,N'Ha Noi')
INSERT INTO Contacts values ('abcdef@gmail.com',N'Nguyen BON',123456, N'Ha Noi')

SELECT * FROM Contacts --Lay tat ca ban ghi trong bang

 DELETE FROM Contacts WHERE MailID='abc@gmail.com' --xoa abc@gmail.com
 UPDATE Contacts SET Name=N'Nguyen LAM' WHERE MailID='abcd@gmail.com'
  UPDATE Contacts SET Name=N'Nguyen Sau' WHERE MailID='abcdef@gmail.com'

 CREATE LOGIN example3 WITH PASSWORD='123456'
 
 CREATE USER example3 FROM LOGIN example3

 REVOKE ALL ON Contacts FROM example3 --HUY BO CAC QUYEN USER EXAMPLE3

 GRANT SELECT ON Contacts TO example3 --GAN QUYEN SELECT CHO EXAMPLE3