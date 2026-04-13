-- Ensure you've run Listing 4.028.sql to create the Employees table

-- 【概要】サーガブル（インデックス利用可能）な年別絞り込みの推奨パターン。
--         カラムに関数を適用せず、定数側で範囲を計算してインデックスを活用する。

USE Item28Example;

-- Listing 4.30 Sargable query to limit data to a particular year

-- 良い例: カラムに関数を使わず範囲指定でEmpDOBインデックスを有効活用
SELECT EmployeeID, EmpFirstName, EmpLastName
  FROM Employees
 WHERE EmpDOB >= Cast('1950-01-01' AS Date)
   AND EmpDOB <  Cast('1951-01-01' AS Date);

