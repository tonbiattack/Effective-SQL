-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】CASE式とCURDATE()を組み合わせて現在の年齢を計算する。
--         誕生月・日と現在日付を比較し、誕生日が来ていない場合は1を引く方式。
--         StudentsテーブルはサンプルDBに存在しないため、Employeesテーブルでも同様の例を示す。

-- NOTE: Sample table Students does not exist.
CREATE DATABASE StudentsTest;

USE StudentsTest;

CREATE TABLE Students (
	StudentID int PRIMARY KEY NOT NULL,
	LastName varchar(50),
	FirstName varchar(50),
	BirthDate date
);

-- CASE式で誕生日の到達有無を判定し、正確な年齢を算出
SELECT Students.StudentID, Students.LastName, Students.FirstName,
   YEAR(CURDATE()) - YEAR(Students.BirthDate) -
    CASE WHEN MONTH(Students.BirthDate) < MONTH(CURDATE()) 
    THEN 0 
    WHEN MONTH(Students.BirthDate) > MONTH(CURDATE()) 
    THEN 1 
    WHEN DAY(Students.BirthDate) > DAY(CURDATE()) 
    THEN 1  
    ELSE 0 END AS Age
  FROM Students;
  
DROP DATABASE StudentsTest;
  
-- Similar code using EmpDOB in the Employees table in SalesOrdersSample
-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example. 

USE SalesOrdersSample;

SELECT Employees.EmployeeID, Employees.EmpLastName, Employees.EmpFirstName, 
   YEAR(CURDATE()) - YEAR(Employees.EmpDOB) - 
    CASE WHEN MONTH(Employees.EmpDOB) < MONTH(CURDATE()) 
    THEN 0 
    WHEN MONTH(Employees.EmpDOB) > MONTH(CURDATE()) 
    THEN 1 
    WHEN DAY(Employees.EmpDOB) > DAY(CURDATE()) 
    THEN 1  
    ELSE 0 END AS Age
  FROM Employees;

