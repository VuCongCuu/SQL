CREATE DATABASE TIKI
USE TIKI

CREATE TABLE San_Pham(
Id INTEGER,
Name TEXT,
Gia INTEGER,
Trang_Thai TEXT,
So_Luong INTEGER
)
SELECT * FROM San_Pham 

INSERT INTO San_Pham(Id,Name,Gia,Trang_Thai,So_Luong) VALUES (1,N'Áo',200.000,N'Còn',10)
INSERT INTO San_Pham(Id,Name,Gia,Trang_Thai,So_Luong) VALUES (2,N'Quần',300.000,N'Còn',11)
INSERT INTO San_Pham(Id,Name,Gia,Trang_Thai,So_Luong) VALUES (3,N'Túi',400.000,N'Còn',12)
INSERT INTO San_Pham(Id,Name,Gia,Trang_Thai,So_Luong) VALUES (4,N'Giày',500.000,N'Còn',13)
INSERT INTO San_Pham(Id,Name,Gia,Trang_Thai,So_Luong) VALUES (5,N'Sách',600.000,N'Còn',14)

DELETE FROM San_Pham WHERE Id=1
UPDATE San_Pham SET Trang_Thai=N'Hết' WHERE Id=5
UPDATE San_Pham SET So_Luong=0 WHERE Id=5

CREATE TABLE Khach_Hang(
Id INTEGER,
Name TEXT,
Email TEXT,
SDT INTEGER,
Cap_Do INTEGER,
Trang_Thai TEXT
)
INSERT INTO Khach_Hang(Id,Name,Email,SDT,Cap_Do,Trang_Thai) VALUES (1,N'Nguyễn Văn A', 'abc@gmail.com',123,1,N'Hoạt Động')
INSERT INTO Khach_Hang(Id,Name,Email,SDT,Cap_Do,Trang_Thai) VALUES (2,N'Nguyễn Văn B', 'abcd@gmail.com',1234,2,N'Hoạt Động')
INSERT INTO Khach_Hang(Id,Name,Email,SDT,Cap_Do,Trang_Thai) VALUES (3,N'Nguyễn Văn C', 'abce@gmail.com',1235,3,N' Không Hoạt Động')
INSERT INTO Khach_Hang(Id,Name,Email,SDT,Cap_Do,Trang_Thai) VALUES (4,N'Nguyễn Văn D', 'abcf@gmail.com',1236,1,N'Hoạt Động')
INSERT INTO Khach_Hang(Id,Name,Email,SDT,Cap_Do,Trang_Thai) VALUES (5,N'Nguyễn Văn E', 'abcg@gmail.com',1237,2,N'Không Hoạt Động')

UPDATE Khach_Hang SET Cap_Do=4 WHERE Id=5
DELETE FROM Khach_Hang WHERE Id=2

SELECT * FROM Khach_Hang
