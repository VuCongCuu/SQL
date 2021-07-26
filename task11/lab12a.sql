CREATE DATABASE Lab12
USE Lab12

CREATE TABLE Employee(
EmployeeID INT, CONSTRAINT KT_EmployeeID PRIMARY KEY(EmployeeID),
Name VARCHAR(30),
Tel BIGINT,
Email VARCHAR(30)
)
GO
CREATE TABLE Project(
ProjectID INT NOT NULL ,
ProjectName VARCHAR(30),
StartDate DATETIME,
EndDate DATETIME,
Period INT,
Cost MONEY

)
GO
CREATE TABLE GroupI (
GroupID INT NOT NULL,
GroupName VARCHAR(30),
LeaderID INT,
ProjectID INT
)
GO

CREATE TABLE GroupDetail(
GroupID INT,
EmployeeID INT,
Status NVARCHAR(100)
)
GO

/*Xác định thuộc tính khóa (khóa chính, khóa ngoại) và viết câu lệnh thay đổi các trường với thuộc
tính khóa vừa xác định.*/
ALTER TABLE Project ADD CONSTRAINT KC_ProjectID PRIMARY KEY (ProjectID)
ALTER TABLE GroupI ADD CONSTRAINT KC_Group PRIMARY KEY (GroupID)

ALTER TABLE GroupI ADD CONSTRAINT KP_ProjectID FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
ALTER TABLE GroupDetail ADD CONSTRAINT KP_GroupID FOREIGN KEY (GroupID) REFERENCES GroupI(GroupID)
ALTER TABLE GroupDetail ADD CONSTRAINT KP_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
ALTER TABLE GroupI ADD CONSTRAINT FK FOREIGN KEY (LeaderID) REFERENCES Employee(EmployeeID)

--Thêm dữ liệu cho các bảng
INSERT INTO Employee VALUES (1,'Vu Thanh Nam','123456','adasd')
INSERT INTO Employee VALUES (2,'Nguyen Thi Hue','56465','sdad')
INSERT INTO Employee VALUES (3,'Nguyen Nhu Mai','623656341','545')
INSERT INTO Employee VALUES (4,'A','623656341','545')


UPDATE Employee SET Tel='0123' WHERE EmployeeID=1
UPDATE Employee SET Tel='0133' WHERE EmployeeID=2
UPDATE Employee SET Tel='0143' WHERE EmployeeID=3
UPDATE Employee SET Tel='0153' WHERE EmployeeID=4

SELECT * FROM Employee

INSERT INTO GroupI VALUES  (1,'Nhom A',1,1)
INSERT INTO GroupI VALUES  (2,'Nhom B',2,2)
INSERT INTO GroupI VALUES  (3,'Nhom C',3,3)


SELECT * FROM GroupI
DROP TABLE GroupI

INSERT INTO Project VALUES (1,'Du An A','2019-01-20','2021-07-22',4,'1000')
INSERT INTO Project VALUES (2,'Du An B','2018-02-21','2020-07-21',5,'2000')
INSERT INTO Project VALUES (3,'Du An C','2019-07-20','2021-5-21',6,'3000')
INSERT INTO Project VALUES (4,'Du An D','2019-07-20','2022-5-21',6,'4000')

SELECT * FROM Project

INSERT INTO GroupDetail(GroupID,EmployeeID) VALUES (1,1)
INSERT INTO GroupDetail(GroupID,EmployeeID) VALUES (2,2)
INSERT INTO GroupDetail(GroupID,EmployeeID) VALUES (3,3)
INSERT INTO GroupDetail(GroupID,EmployeeID) VALUES (2,1)
INSERT INTO GroupDetail(GroupID,EmployeeID) VALUES (3,2)
INSERT INTO GroupDetail(GroupID,EmployeeID) VALUES (1,3)

SELECT * FROM GroupDetail
/*3. Viết câu lệnh truy vấn để:
a. Hiển thị thông tin của tất cả nhân viên*/
SELECT * FROM Employee

--b. Liệt kê danh sách nhân viên đang làm dự án “Du An A”
SELECT Name,ProjectName FROM Employee AS a
INNER JOIN GroupDetail AS b ON b.EmployeeID=a.EmployeeID
INNER JOIN GroupI AS c ON c.GroupID=b.GroupID
INNER JOIN Project AS d ON d.ProjectID=c.GroupID
WHERE ProjectName='Du An A'
Go

--c. Thống kê số lượng nhân viên đang làm việc tại mỗi nhóm
SELECT e.Name,g.GroupName FROM Employee AS E,GroupDetail AS gr,GroupI AS g 
WHERE e.EmployeeID=gr.EmployeeID AND g.GroupID=gr.GroupID ORDER BY g.GroupName ASC
GO

--d. Liệt kê thông tin cá nhân của các trưởng nhóm
SELECT a.Name [Ten Nhom Truong],g.GroupName FROM Employee AS a,GroupI AS g 
WHERE a.EmployeeID=g.LeaderID
GO


/*e. Liệt kê thông tin về nhóm và nhân viên đang làm các dự án có ngày bắt đầu làm trước ngày
12/10/2010*/

SELECT * FROM Project WHERE StartDate > '2019-01-01'
--f. Liệt kê tất cả nhân viên dự kiến sẽ được phân vào các nhóm 1
SELECT Name[Nhan vien nhom 1] FROM Employee AS a, GroupDetail AS b,GroupI AS c
WHERE c.GroupID=1 AND
a.EmployeeID=b.EmployeeID AND b.GroupID=c.GroupID 

--g. Liệt kê tất cả thông tin về nhân viên, nhóm làm việc, dự án của những dự án đã hoàn thành
SELECT ProjectName,EndDate FROM Project WHERE EndDate < GETDATE()
/*a. Ngày hoàn thành dự án phải sau ngày bắt đầu dự án*/
 ALTER TABLE Project ADD CONSTRAINT CK CHECK(StartDate < EndDate)

--b. Trường tên nhân viên không được null

ALTER TABLE Employee ADD  NOT NULL (Name)

--d. Trường giá trị dự án phải lớn hơn or bang 1000
ALTER TABLE Project ADD CONSTRAINT CKG CHECK(Cost>=1000)

--e. Trưởng nhóm làm việc phải là nhân viên
--Khoa Phu
ALTER TABLE GroupI ADD CONSTRAINT FK FOREIGN KEY (LeaderID) REFERENCES Employee(EmployeeID)

--f. Trường điện thoại của nhân viên chỉ được nhập số và phải bắt đầu bằng số 1
ALTER TABLE Employee ADD CONSTRAINT FG CHECK(Tel LIKE '1%')




--6. Tạo các chỉ mục:


/*a. Tạo chỉ mục duy nhất tên là IX_Group trên 2 trường GroupID và EmployeeID của bảng
GroupDetail*/
CREATE CLUSTERED INDEX IX_Group ON GroupDetail(GroupID,EmployeeID)

/*b. Tạo chỉ mục tên là IX_Project trên trường ProjectName của bảng Project gồm các trường
StartDate và EndDate*/
CREATE NONCLUSTERED INDEX IX_Project ON Project (StartDate,EndDate)

--7. Tạo các khung nhìn để


--a. Liệt kê thông tin về nhân viên, nhóm làm việc có dự án đang thực hiện
CREATE VIEW NV_View AS
SELECT Name,GroupName FROM Employee AS a
INNER JOIN GroupDetail AS b ON b.EmployeeID=a.EmployeeID
INNER JOIN GroupI AS c ON b.GroupID=c.GroupID
INNER JOIN Project AS D ON d.ProjectID=c.ProjectID
GO

SELECT * FROM NV_View

/*b. Tạo khung nhìn chứa các dữ liệu sau: tên Nhân viên, tên Nhóm, tên Dự án và trạng thái làm
việc của Nhân viên.*/
CREATE VIEW NV_Vieww AS
SELECT Name,GroupName,Status FROM Employee AS a
INNER JOIN GroupDetail AS b ON b.EmployeeID=a.EmployeeID
INNER JOIN GroupI AS c ON b.GroupID=c.GroupID
INNER JOIN Project AS D ON d.ProjectID=c.ProjectID
GO
SELECT * FROM NV_Vieww



