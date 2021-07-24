CREATE DATABASE Lab10

USE AdventureWorks2019
--Sao dữ liệu từ bảng WorkOrder của cơ sở dữ liệu AdventueWorks sang cơ sở dữ liệu Lab10
SELECT * INTO Lab10.dbo.WorkOrder FROM Production.WorkOrder

--Sao dữ liệu từ bảng WorkOrder của cơ sở dữ liệu Lab10 sang bảng WorkOrderIX của cơ sở dữ liệu Lab10:
USE Lab10
SELECT * INTO WorkOrderIX FROM WorkOrder
--Xem dữ liệu ở cả hai bảng:

SELECT * FROM WorkOrder
SELECT * FROM WorkOrderIX
--Tạo một chỉ mục trên cột WorkOrderID của bảng WorkOrderIX bằng câu lệnh sau:
CREATE INDEX IX_WorkOrderID ON WorkOrderIX(WorkOrderID)

SELECT * FROM WorkOrder WHERE WorkOrderID=72000
SELECT * FROM WorkOrderIX WHERE WorkOrderID=72000

CREATE DATABASE CodeLean 
USE CodeLean

CREATE TABLE Classes(
ClassName VARCHAR(50),
Teacher VARCHAR(50),
TimeSlot VARCHAR(50),
Class INT,
Lab INT
)
--Tạo an unique, clustered index tên là MyClusteredIndex trên trường ClassName
ALTER TABLE Classes ADD CONSTRAINT KH UNIQUE(ClassName)

CREATE CLUSTERED INDEX MyClusteredInde  ON Classes(ClassName)

--Tạo a nonclustered index tên là TeacherIndex trên trường Teacher
CREATE NONCLUSTERED INDEX TeacherIndex ON Classes(Teacher)
--Xóa chỉ mục TeacherIndex
DROP INDEX TeacherIndex ON Classes
--Xây dựng lại MyClusteredIndex với các thuộc tính FILLFACTOR

ALTER INDEX MyClusteredInde ON Classes REBUILD WITH(FILLFACTOR=60)

--Tạo một composite index tên là ClassLabIndex trên 2 trường Class và Lab.
CREATE INDEX ClassLabIndex ON Classes(Class,Lab)
--Viết câu lệnh xem toàn bộ các chỉ mục của cơ sở dữ liệu CodeLean.
EXEC sp_helpindex 'Classes'
EXECUTE sp_helpindex 'Classes'
