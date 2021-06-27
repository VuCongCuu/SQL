IF EXISTS ( SELECT * FROM sys.database WHERE Name='Example5') --kiem tra trong database co example 5 ko
 DROP DATABASE Example5 --xoa database example5
 GO
 CREATE DATABASE Example5
 GO
 USE Example5
 CREATE TABLE LopHoc(
 MaLopHoc INT PRIMARY KEY IDENTITY,
 TenlopHoc VARCHAR(10)
 )
  SELECT * FROM LopHoc
 GO
 -- Tạo bảng Sinh Viên có khóa ngoại la cot ma lop hoc ,nối với bảng lớp học 
 CREATE TABLE SinhVien(
 MaSV INT PRIMARY KEY,
 TenSV VARCHAR(40),
 MaLopHoc INT, CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)

 SELECT * FROM SinhVien

 GO
 --Tạo bảng Sanpham với 1 cột null , 1 cột not null
 CREATE TABLE SanPham(
 MaSP INT NOT NULL,
 TenSP VARCHAR(40) NULL
 )
 SELECT * FROM SanPham

 GO
 --Tao bang voi thuoc tinh DEFAULT
 CREATE TABLE StoreProduct(
 ProductID INT NOT NULL,
 Name VARCHAR(40),
 Price MONEY NOT NULL DEFAULT(100)
 )
  SELECT * FROM StoreProduct

 INSERT INTO StoreProduct(ProductID,Name ) VALUES (111,'Rivets')

 -- Tạo bảng ContactPhone voi thuộc tính IDENTITY(Tự đọng tăng giá trị của cột)
 CREATE TABLE ContactPhone(
 Preson_ID INT IDENTITY(100,1) NOT NULL,
 MobileName VARCHAR(40) NOT NULL
 )
 INSERT INTO ContactPhone(MobileName) VALUES('Iphone')
 INSERT INTO ContactPhone(MobileName) VALUES('Bphone')
 --Chỉnh su cot trong bang
  ALTER TABLE ContactPhone
 ALTER COLUMN MobileName VARCHAR(50)
 -- Them cot cho bang
 ALTER TABLE ContactPhone ADD SDT INT
  ALTER TABLE ContactPhone ADD Name VARCHAR(30)

  --Xóa cot trong bảng
  ALTER TABLE ContactPhone DROP COLUMN SDT
  --THÊM ràng buộc cho côt
  ALTER TABLE ContactPhone ADD CONSTRAINT MK CHECK (SDT>3)

  INSERT INTO ContactPhone(MobileName, SDT)  VALUES('Xphone',123)
  INSERT INTO ContactPhone(MobileName, SDT)  VALUES('Xphone',2)--2 không thỏa mãn điều kiên SDT >3
  
  --Xóa ràng buộc cho cột
ALTER TABLE ContactPhone DROP CONSTRAINT MK
INSERT INTO ContactPhone(MobileName, SDT)  VALUES('Xphone',2) --không còn điều kiện nên 2 được insert vào bảng


  SELECT * FROM ContactPhone


 --Tạo cột nhận dạng duy nhất tổng thể
 GO
 CREATE TABLE CellularPhone(
 Preson_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
 PresonName VARCHAR(40) NOT NULL
 )
INSERT INTO CellularPhone(PresonName) VALUES ('Smith')
INSERT INTO CellularPhone(PresonName) VALUES ('William')

 SELECT * FROM CellularPhone

 -- Thuộc tính UNIQUE

 CREATE TABLE Contact(
 Preson_ID INT PRIMARY KEY,
 MobileNumber BIGINT UNIQUE,
 ServiceProvider VARCHAR(30),
 LandlineNumber BIGINT UNIQUE
)
INSERT INTO Contact VALUES(101,123456,'Cong',NULL)
INSERT INTO Contact VALUES(102,NULL,'Vu',123)

 SELECT * FROM Contact

 --Rang buoc CHECk
 CREATE TABLE PhoneExpenses(
 Expenses_ID INT PRIMARY KEY,
 MobileNumber BIGINT FOREIGN KEY REFERENCES Contact(MobileNumber),
 Amount BIGINT CHECK ( Amount >0 )
 )
 INSERT INTO PhoneExpenses VALUES (123,123456,1)

 SELECT * FROM PhoneExpenses

 






 


