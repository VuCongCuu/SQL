USE AdventureWorks2019

--lay ra giu lieu tu bang ContactType co ContactTypeID >=3 va ContactTypeID<=9

SELECT * FROM Person.ContactType WHERE ContactTypeID >= 3 AND ContactTypeID <= 9


SELECT * FROM Person.ContactType WHERE ContactTypeID BETWEEN 3 and 9

-- lay ra giu lieu tu bang ContactType trong tap hop 1,3,5,7
SELECT * FROM Person.ContactType WHERE ContactTypeID IN(1,3,5,7)


--lay ra lastname ket thuc boi ky tu e
SELECT * FROM Person.Person WHERE LastName LIKE '%e'

--lay ra lastname bat dau boi ky tu R hoac A va ket thuc boi ky tu e
SELECT * FROM Person.Person WHERE LastName LIKE '[RA]%e'

-- lay ra lastname co 4 ky tu bat dau boi ky tu R hoac A va ket thuc boi ky tu e
SELECT * FROM Person.Person WHERE LastName LIKE '[RA]__e'

--lay ra lastname co ky tu a
SELECT * FROM Person.Person WHERE LastName LIKE '%a%'

-- su dung DISTINCT cac du kieu trung lap bi loai bo trong cot Title
SELECT DISTINCT Title FROM Person.Person

-- GROUP BY nhom thanh tung nhom trong cot Title
SELECT Title FROM Person.Person GROUP BY Title

--
SELECT Title, COUNT(*)[Title Number]  FROM Person.Person GROUP BY Title

SELECT Title , COUNT(*) [Title Number] FROM Person.Person WHERE Title LIKE 'Mr%' GROUP BY Title

SELECT Title , COUNT(*) [Title Number] FROM Person.Person WHERE Title LIKE 'Mr%' GROUP BY ALL Title

--HAVING loc ket qua trong luc gop
SELECT Title , COUNT(*) [Title Number] FROM Person.Person  GROUP BY ALL Title HAVING Title LIKE 'Mr%'

--
SELECT Title , COUNT(*) [Title Number] 
FROM Person.Person
WHERE Title LIKE 'Mr%'
GROUP BY ALL Title
HAVING COUNT(*)>=2

--them 1 hang tinh tong
SELECT Title , COUNT(*) [Title Number] 
FROM Person.Person
GROUP BY Title WITH CUBE


SELECT Title , COUNT(*) [Title Number] 
FROM Person.Person
GROUP BY Title WITH ROLLUP

--ORDER BY sap xep gia tri tra ve
SELECT * FROM Person.Person
ORDER BY FirstName,LastName DESC

SELECT * FROM Person.Person 
WHERE BusinessEntityID in(SELECT BusinessEntityID FROM HumanResources.Employee  )

SELECT * FROM Person.Person C
WHERE EXISTS (SELECT BusinessEntityID FROM HumanResources.Employee WHERE BusinessEntityID=C.BusinessEntityID)

--ket hop 2 bang bang UNION
SELECT ContactTypeID, Name FROM Person.ContactType WHERE ContactTypeID IN (1,2,3,4,5,6)
UNION
SELECT ContactTypeID, Name FROM Person.ContactType WHERE ContactTypeID IN (1,3,5,7)

--Khong loai bo gia tri trung nhau
SELECT ContactTypeID, Name FROM Person.ContactType WHERE ContactTypeID IN (1,2,3,4,5,6)
UNION ALL
SELECT ContactTypeID, Name FROM Person.ContactType WHERE ContactTypeID IN (1,3,5,7)

--
SELECT * 
FROM HumanResources.Employee AS e INNER JOIN Person.Person AS p 
ON e.BusinessEntityID= p.BusinessEntityID
ORDER BY p.LastName

SELECT * FROM Person.Person
SELECT * FROM HumanResources.Employee

SELECT DISTINCT p1.ProductSubcategoryID,p1.ListPrice
FROM Production.Product p1 INNER JOIN Production.Product p2
ON p1.ProductSubcategoryID = p2.ProductSubcategoryID AND p1.ListPrice <> p2.ListPrice
WHERE p1.ListPrice < $15 AND p2.ListPrice < $15

ORDER BY ProductSubcategoryID;