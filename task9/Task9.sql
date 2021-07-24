USE AdventureWorks2019
CREATE VIEW TenVIEW AS
SELECT FirstName,LastName FROM Person.Person

SELECT * FROM TenVIEW


CREATE VIEW ProductList AS
SELECT ProductID, Name FROM Production.Product
SELECT * FROM ProductList

--Bài 2: Tạo khung nhìn có sử dụng câu lệnh JOIN.

CREATE TABLE Customer(
CustomerID INT PRIMARY KEY,
CustomerName NVARCHAR(40),
Address VARCHAR(100),
Phone BIGINT
)

INSERT INTO Customer VALUES (1,N'Vũ Hoàng Phong',N'Hà Nội','123456789')
INSERT INTO Customer VALUES (2,N'Cao Minh Bách', N'Hà Nam','789456123')
INSERT INTO Customer VALUES (3,N'Cao Mạnh Đạt',N'Bắc Ninh','963205742')
INSERT INTO Customer VALUES (4,N'Võ Chí Công',N'Hà Nội','369741485')
INSERT INTO Customer VALUES (5,N'Văn Anh',N'Hà Nam','852364789')

SELECT * FROM Customer

CREATE TABLE Book(
BookCode INT PRIMARY KEY,
Category VARCHAR(50),
Author VARCHAR(50),
Publisher VARCHAR(50),
Title VARCHAR(50),
Price MONEY,
InStore INT
)
INSERT INTO Book VALUES (1,'Van Hoc','Hoang The','Giao Duc','no','1000',100)
INSERT INTO Book VALUES (2,'Toan Hoc','Lam Anh','Kim Dong','no','200',50)
INSERT INTO Book VALUES (3,'Tin Hoc','Anh Vu','Giao Duc','No','500',20)
INSERT INTO Book VALUES (4,'Khoa Hoc','Vu Cong','Kim Dong','nn','300',30)
INSERT INTO Book VALUES (5,'Xa Hoi','Cao Lan','Giao Duc','nn','700',10)

SELECT * FROM Book
DELETE FROM Book WHERE BookCode=1

CREATE TABLE BookSold(
BookSoldID INT PRIMARY KEY,
CustomerID INT, CONSTRAINT KH FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
BookCode INT ,CONSTRAINT SA FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
Date DATETIME,
Price MONEY,
Amount INT
)
INSERT INTO BookSold VALUES (1,1,1,'2021-4-3','400',2)
INSERT INTO BookSold VALUES (6,1,2,'2021-4-3','500',2)
INSERT INTO BookSold VALUES (2,2,2,'2021-5-3','500',3)
INSERT INTO BookSold VALUES (3,3,3,'2021-2-3','600',4)
INSERT INTO BookSold VALUES (4,4,4,'2021-1-3','700',5)
INSERT INTO BookSold VALUES (5,5,5,'2021-7-3','800',6)

SELECT * FROM BookSold

--Tạo một khung nhìn chứa danh sách các cuốn sách (BookCode, Title, Price) kèm theo số lượng đã án được của mỗi cuốn sách.

CREATE VIEW BookVIEW AS
SELECT Author, b.Price FROM Book AS a
INNER JOIN BookSold AS b ON b.BookCode=a.BookCode
GO

SELECT * FROM BookVIEW

--Tạo một khung nhìn chứa danh sách các khách hàng (CustomerID, CustomerName, Address) kèm theo số lượng các cuốn sách mà khách hàng đó đã mua.
CREATE VIEW CuView AS
SELECT CustomerID,CustomerName,Address FROM Customer

SELECT * FROM CuView
--Tạo một khung nhìn chứa danh sách các khách hàng (CustomerID, CustomerName, Address) đã mua sách vào tháng trước, kèm theo tên các cuốn sách mà khách hàng đã mua.
CREATE VIEW KHView AS
SELECT CustomerName,Address,Category, Date FROM Customer AS a
INNER JOIN BookSold AS b ON b.CustomerID= a.CustomerID
INNER JOIN Book AS c ON c.BookCode=b.BookCode
GO

SELECT * FROM KHView
--Tạo một khung nhìn chứa danh sách các khách hàng kèm theo tổng tiền mà mỗi khách hàng đã chi cho việc mua sách.
CREATE VIEW TienVIEW AS
SELECT SUM(Price) [TongTien] FROM BookSold WHERE CustomerID=1

sp_helptext 'KHView'

sp_depends 'KHView'