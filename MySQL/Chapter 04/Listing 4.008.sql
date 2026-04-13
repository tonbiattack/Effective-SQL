-- NOTE that some are code snippets that are not executable.

-- 【概要】検索CASE式（CASE WHEN ...）のコードスニペット集。
--         性別・婚姻状況による敬称生成、商品販売数によるランク付け、
--         役職に応じた昇給計算などの実用パターンを示す。

-- (Generate a salutation based on gender and marital status.)
-- 検索CASE: 性別と婚姻状況から敬称を生成
CASE WHEN Students.Gender = 'M' THEN 'Mr.'
  WHEN Students.MaritalStatus = 'S' THEN 'Ms.'
    ELSE 'Mrs.' END

-- (Rate sales based by Product on quantity sold.)
-- CASE＋相関サブクエリで商品ごとの販売数をPoor/Average/Good/Excellentにランク付け
Use Salesorderssample;

SELECT Products.ProductNumber, Products.ProductName,
CASE WHEN (SELECT SUM(QuantityOrdered)
    FROM Order_Details 
    WHERE (Order_Details.ProductNumber = 
                 Products.ProductNumber)) <= 200 
  THEN 'Poor' 
  WHEN (SELECT SUM(QuantityOrdered)
    FROM Order_Details 
    WHERE (Order_Details.ProductNumber = 
      Products.ProductNumber)) <= 500 
  THEN 'Average' 
  WHEN (SELECT SUM(QuantityOrdered)
    FROM Order_Details 
    WHERE (Order_Details.ProductNumber = 
      Products.ProductNumber)) <= 1000 
  THEN 'Good' 
  ELSE 'Excellent' END
FROM Products;

-- (Calculate raises based on position.)
CASE Staff.Title 
WHEN 'Instructor' 
THEN ROUND(Salary * 1.05, 0) 
WHEN 'Associate Professor' 
THEN ROUND(Salary * 1.04, 0) 
WHEN 'Professor' THEN ROUND(Salary * 1.035, 0) 
ELSE Salary END
