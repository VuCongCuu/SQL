CREATE DATABASE Task5
USE Task5
--dung IDENTITY (1,1) tu dong dien CategoriesId =1 va tang dan 1 don vi
CREATE TABLE Categories(
CategoryID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
CategoriesName VARCHAR(50),
Descrlptlon text
)
INSERT INTO Categories(CategoriesName,Descrlptlon) VALUES ('Beverages','Soft drinks, coffees,teas')
INSERT INTO Categories(CategoriesName,Descrlptlon) VALUES ('Condiments','Sweet and savory sauces,relishes,spreads')
INSERT INTO Categories(CategoriesName,Descrlptlon) VALUES ('Confections','Desserts,candies,and sweet breads')
INSERT INTO Categories(CategoriesName,Descrlptlon) VALUES ('Dairy','Cheeses')
INSERT INTO Categories(CategoriesName,Descrlptlon) VALUES ('Grains/Cereals','Dreads,crackers,pasta and cereal')
INSERT INTO Categories(CategoriesName,Descrlptlon) VALUES ('Meat/Poultry','Prepared meats')
INSERT INTO Categories(CategoriesName,Descrlptlon) VALUES ('Produce','Dried fruit and bean curd')
INSERT INTO Categories(CategoriesName,Descrlptlon) VALUES ('Seafood','Seaweed and fish')

SELECT * FROM Categories



CREATE TABLE Customers(
CustomerID VARCHAR(50) PRIMARY KEY,
CompanyName NVARCHAR(50),
ContactName NVARCHAR(50),
ContactTitle NVARCHAR(50),
Address NVARCHAR(50),
City NVARCHAR(50),
PostalCode VARCHAR(50),
Country VARCHAR(50),
Phone BIGINT,
FAX BIGINT
)
INSERT INTO Customers VALUES ('ALFKI','Alfreds Futterklste','Maria Andern','Sales Representatlve','Obere Str.57','Berlln','12209','Germany','0300074321','030076545')
INSERT INTO Customers VALUES ('ANATR','Ana Trujlllo Emparedados y Helados','Ana Trujlllo','Owner','Avda.de la Constltuclon 2222','Mexico D.F.','05021','Mexico','5554729','5553745')
INSERT INTO Customers VALUES ('ANTON','Antonio Moreno Taqueria','Antonio Moreno','Owner','Mataderos 2312','Mexico D.F.','05023','Mexico','5553932','123456')
INSERT INTO Customers VALUES ('AROUT','Around the Horn','Thomas Hardy','Sales Representatlve','120 Hanover Sq.','London','WA1 1DP','UK','1715557788','1715556750' )

SELECT * FROM Customers

CREATE TABLE Employees(
EmployeesID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
LastName NVARCHAR(50),
FirstName NVARCHAR(50),
Title VARCHAR(50),
TitleOfCourtesy NVARCHAR(50),
BirthDate DATE,
HireDate DATE,
Address NVARCHAR(50),
City NVARCHAR(50),
Region NVARCHAR(50),
PostalCode INT NOT NULL,
Country NVARCHAR(50),
HomePhone BIGINT,
Extension BIGINT,
Note Text,
ReportsTo INT
)

INSERT INTO Employees(LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Note,ReportsTo)
VALUES ('Davolio','Nancy','Sales Representative','Ms.','1948-12-08','1992-05-01','507-20th Ave.E. Apt.2A','Seattle','WA','98122','USA','2065559857','5467','khong','2')

INSERT INTO Employees(LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Note)
VALUES ('Fuller','Andrew','Vice President, Sale','Dr.','1952-02-19','1992-02-14','908 W Capital Way','Tacoma','WA','98401','USA','2065559482','3457','edrtyg')

INSERT INTO Employees(LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Note,ReportsTo)
VALUES ('Leverling','Janet','Sales Representative','Ms.','1963-08-30','1992-04-01','722 Moss Bay Blvd.','Kirkland','WA','98033','USA','2065553412','3355','fghjk','2')

SELECT * FROM Employees


CREATE TABLE Suppliers(
SupplierID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
CompanyName NVARCHAR(50),
ContactName NVARCHAR(50),
ContactTitle NVARCHAR(50),
Address NVARCHAR(50),
City NVARCHAR(50),
Region NVARCHAR(50),
PostalCode NVARCHAR(50),
Country NVARCHAR(50),
Phone BIGINT,
Fax BIGINT,
HomePage NVARCHAR(50)
)

INSERT INTO Suppliers(CompanyName,ContactName,ContactTitle,Address,City,PostalCode,Country,Phone,Fax)
VALUES('Exotic Liquids','Charlotte Cooper','Purchasing Manager','49 Gibert St.','London','EC1 4SD','UK','1715552222','123456')

INSERT INTO Suppliers(CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,HomePage)
VALUES('New Orleans Cajun Delights','Shelley Burke','Order Administrator','P.O Box 78934','New Orleans','LA','70117','USA','1005554822','#CAJUN.HTM#' )

INSERT INTO Suppliers(CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax)
VALUES ('Grandma Kellys Homestead','Regina Murphy','Sales Representative','707 Oxford Rd.','Ann Arbor','MI','48104','USA','3135555735','3135553349')


SELECT * FROM Suppliers
DROP TABLE Suppliers

CREATE TABLE Shippers(
ShipperID INT IDENTITY(1,1) NOT NULL,
CompanyName NVARCHAR(50),
Phone BIGINT
)
INSERT INTO Shippers(CompanyName,Phone) VALUES('Speedy Express','503559831')

INSERT INTO Shippers(CompanyName,Phone) VALUES('United Package','5035553199')

INSERT INTO Shippers(CompanyName,Phone) VALUES('Federal Shipping','503559931')


SELECT * FROM Shippers

CREATE TABLE Products(
ProductID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
ProductName NVARCHAR(50),
SuppllerID INT, CONSTRAINT fk FOREIGN KEY (SuppllerID) REFERENCES Suppliers(SupplierID),
CategoryID INT, CONSTRAINT ac FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
QuantityPerUnit NVARCHAR(50),
UnitPrice INT,
UnitsinStock INT,
UnitsOnOrder INT,
ReorderLevel INT,
Discontlnued INT
)

INSERT INTO Products(ProductName,SuppllerID,CategoryID,QuantityPerUnit,UnitPrice,UnitsinStock,UnitsOnOrder,ReorderLevel,Discontlnued)
VALUES ('Chai','1','1','10 boxes x 20 bags','18000','39','0','10','0' )
INSERT INTO Products(ProductName,SuppllerID,CategoryID,QuantityPerUnit,UnitPrice,UnitsinStock,UnitsOnOrder,ReorderLevel,Discontlnued)
VALUES ('Chef Antons Cajun Seasoning','2','2','48-6 oz jars','220000','53','0','0','0')
INSERT INTO Products(ProductName,SuppllerID,CategoryID,QuantityPerUnit,UnitPrice,UnitsinStock,UnitsOnOrder,ReorderLevel,Discontlnued)
VALUES ('Grandmas Boysenberry Spread','3','2','12-8 oz jars','250000','120','0','25','0')
SELECT * FROM Products

CREATE TABLE Orders(
OrderID INT PRIMARY KEY NOT NULL,
CustomerID VARCHAR(50), CONSTRAINT am FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
EmployeeID INT , CONSTRAINT ak FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeesID),
OrderDate DATE,
RequiredDate DATE,
ShipperDate DATE,
ShipVia INT,
Freight INT,
ShipName NVARCHAR(50),
ShipAddress NVARCHAR(50),
ShipCity NVARCHAR(50),
ShipReglon NVARCHAR(50),
ShipPostalCode NVARCHAR(50),
ShipCountry NVARCHAR(50)
)

INSERT INTO Orders(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,ShipperDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipReglon,ShipPostalCode,ShipCountry)
VALUES ('10248','ALFKI','1','1994-08-16','1994-09-01','1994-08-16','3','323800','Vins Et','59 reim', 'Remims','RJ','51100','France')
SELECT * FROM Orders

CREATE TABLE OrderDetails(
OrderID INT PRIMARY KEY NOT NULL,  CONSTRAINT ah FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
ProductID INT,CONSTRAINT aj FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
UnitPrice INT,
Quantity INT,
Discount INT
)
INSERT INTO OrderDetails VALUES('10248','1','140000','12','0')

SELECT * FROM OrderDetails