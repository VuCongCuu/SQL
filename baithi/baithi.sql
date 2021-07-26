CREATE DATABASE SellPoint
USE SellPoint

CREATE TABLE Categories(
CateID CHAR(6) CONSTRAINT PK_Categories PRIMARY KEY,
CateName NVARCHAR(100) NOT NULL,
Description NVARCHAR(100)
)


CREATE TABLE Parts (
PartID INT CONSTRAINT PK_Parts PRIMARY KEY IDENTITY(1,1),
PartName NVARCHAR(100) NOT NULL,
CateID CHAR(6), CONSTRAINT FK_Parts FOREIGN KEY (CateID) REFERENCES Categories(CateID),
Description NVARCHAR(1000),
Price MONEY NOT NULL DEFAULT '0',
Quantity INT DEFAULT '0',
Warranty INT DEFAULT '1',
Photo NVARCHAR(200) DEFAULT 'photo/nophoto.png'
)

--3. Insert into each table at least three records.
INSERT INTO Categories VALUES ('Cp','CPU','computer components')
INSERT INTO Categories VALUES('Ss','SSD','computer components')
INSERT INTO Categories VALUES('Vg','VGA','computer components')
SELECT * FROM Categories

INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty) 
VALUES ('CPU Intel Core i9-10920X','Cp','computer brain','1000',10,36)
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty) 
VALUES ('CPU Intel Core i5-10400','Cp','computer brain','500',20,36)
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty) 
VALUES ('SSD WD SN750 Black 250GB ','Ss','Hard Drive','2000',30,12)
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity,Warranty) 
VALUES ('Gigabyte RTX 3060','Vg','display','6000',40,36)

SELECT * FROM Parts


--List all parts in the store with price > 100$.
	SELECT PartName FROM Parts WHERE Price>100
--List all parts of the category ‘CPU’
	SELECT * FROM Categories AS a
	INNER JOIN Parts AS p ON p.CateID=a.CateID
	WHERE CateName='CPU'
	GO
 --Create a view v_Parts contains the following information (PartID, PartName, CateName,Price,Price,Quantity)
	CREATE VIEW v_Parts AS
	SELECT PartID,PartName,CateName,Price,Quantity FROM Categories AS a
	INNER JOIN Parts AS p ON p.CateID=a.CateID
	GO

	SELECT * FROM v_Parts
	
	-- Create a view v_TopParts about 3 parts with the most expensive price.
	
	CREATE VIEW v_TopParts AS
	SELECT TOP(3) * FROM Parts ORDER BY Price DESC 
	GO
	SELECT * FROM v_TopParts