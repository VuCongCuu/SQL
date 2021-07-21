CREATE DATABASE RiverPlate
USE RiverPlate

CREATE TABLE Student(
StudentNo INT PRIMARY KEY,
StudentName VARCHAR(30),
Address VARCHAR(50),
Phone BIGINT
)
INSERT INTO Student VALUES (1,'Hoang Phong','Ha Noi','123456789')
INSERT INTO Student VALUES (2,'Duy Anh','Ha Nam','456789123')
INSERT INTO Student VALUES (3,'Cong Chi','Ha Noi','546456456')
INSERT INTO Student VALUES (4,'Vu Cong','Nam Dinh','45674897')
INSERT INTO Student VALUES (5,'The Duc','Ha Noi','64565646')

SELECT * FROM Student

CREATE TABLE Department(
DeptNo INT PRIMARY KEY,
DeptName VARCHAR(50),
ManagerName VARCHAR(50)
)
INSERT INTO Department VALUES (1,'Toan Hoc','Dinh Thai')
INSERT INTO Department VALUES (2,'Van Hoc','Nhat Nam')
INSERT INTO Department VALUES (3,'Khoa Hoc','Viet Cuong')
SELECT * FROM Department

CREATE TABLE Assignment(
AssignmentNo INT PRIMARY KEY,
Description NVARCHAR(100)
)
INSERT INTO Assignment VALUES (1,'Bai Tap Toan')
INSERT INTO Assignment VALUES (2,'Bai Tap Van')
INSERT INTO Assignment VALUES (3,'Bai Tap KH')
SELECT * FROM Assignment

CREATE TABLE WorksAssign(
JobID INT PRIMARY KEY,
StudentNo INT, CONSTRAINT HS FOREIGN KEY (StudentNo) REFERENCES Student(StudentNo),
AssignmentNo INT, CONSTRAINT BT FOREIGN KEY (AssignmentNo) REFERENCES Assignment(AssignmentNo),
TotalHours INT,
JobDetails NVARCHAR(450)
)
INSERT INTO WorksAssign(JobID,StudentNo,AssignmentNo,TotalHours) VALUES (1,1,1,2)
INSERT INTO WorksAssign(JobID,StudentNo,AssignmentNo,TotalHours) VALUES (2,2,2,2)
INSERT INTO WorksAssign(JobID,StudentNo,AssignmentNo,TotalHours) VALUES (3,3,3,2)
INSERT INTO WorksAssign(JobID,StudentNo,AssignmentNo,TotalHours) VALUES (4,4,2,2)
INSERT INTO WorksAssign(JobID,StudentNo,AssignmentNo,TotalHours) VALUES (5,5,1,2)
SELECT * FROM WorksAssign

--Tạo một clustered index tên là IX_Student trên cột StudentNo của bảng Student


EXEC sp_helpindex 'Student'

--Chỉnh sửa và xây dựng lại (rebuild) IX_Student đã được tạo trên bảng Student
ALTER INDEX IX_Student ON Student REBUILD WITH(FILLFACTOR=60)
--Tạo một chỉ non clustered index tên là IX_Dept trên bảng Department sử dụng 2 trường không khóa DeptName và DeptManagerNo.
CREATE NONCLUSTERED INDEX IX_Dept ON Department(DeptName,ManagerName)


EXEC sp_Helpindex 'Department'
