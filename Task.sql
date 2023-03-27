create database Company
USE Company

CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(100),
	Surname NVARCHAR(100),
	Age INT,
	Email  NVARCHAR(100)
)
ALTER TABLE Customers
ADD Email NVARCHAR(50)

INSERT INTO Employees (Name,Surname,Age,Email) 
VALUES
('Chinara','Ibadova',22,'chinaraei@code.edu.az'),
('Konul','Ibrahimova',27,'konulsi@code.edu.az'),
('Mubariz','Agayev',18,'mubariz@code.edu.az'),
('Pervin','Rehimli',27,'pervin@code.edu.az')

SELECT * FROM Employees

SELECT Name,Surname,Email,Age FROM Employees 
WHERE Age BETWEEN 18 AND 25
ORDER BY Age DESC

SELECT COUNT(Email) AS EmailCount FROM Employees 
WHERE Email NOT IN('cavid@gmail.com','test@code.edu.az','pervin@code.edu.az') 

SELECT Name,Surname,Email,Age FROM Employees 
WHERE Email LIKE('%z')
ORDER BY Name ASC 

CREATE VIEW GetStudentsCount AS
SELECT * FROM Employees WHERE Age>20

SELECT * FROM Employees
UNION
SELECT * FROM Customers

SELECT * FROM Employees
UNION ALL
SELECT * FROM Customers

SELECT * FROM Customers
EXCEPT
SELECT * FROM Employees

SELECT * FROM Customers
INTERSECT
SELECT * FROM Employees

SELECT * FROM Employees WHERE Age>18 ORDER BY Name ASC
SELECT * FROM Employees WHERE Age>18 ORDER BY Name DESC

SELECT GETDATE() 'Current Date'

SELECT COUNT(*) 'Emp Count',Age FROM Employees 
WHERE Age>18
GROUP BY Age
HAVING COUNT(*)>1

SELECT COUNT(Id) 'Emp Count',Name FROM Employees 
WHERE Name LIKE('%a%')
GROUP BY Name
HAVING COUNT(Id)=1
ORDER BY Name DESC



--SELECT AVG(Age) FROM Employees 23
--SELECT SUM(Age) from Employees 94

BEGIN

DECLARE @avgAge INT = (SELECT AVG(Age) FROM Employees) 
DECLARE @sumAge INT = (SELECT SUM(Age) from Employees)

if @avgAge < @sumAge
   --PRINT 'Yes'
   --SELECT Name,Surname FROM Employees
   --WHERE Age < @avgAge
   
	SELECT COUNT(Id) 'Emp Count',Name FROM Employees 
	WHERE Name LIKE('%a%')
	GROUP BY Name
	HAVING COUNT(Id)=1
	ORDER BY Name DESC

else 
   --PRINT 'No'
   SELECT Name,Surname FROM Employees
   WHERE Age > @avgAge

END