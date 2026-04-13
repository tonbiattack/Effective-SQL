-- NOTE that these are code snippets that are not executable.

-- 【概要】CASE式の各種パターンを示すコードスニペット集。
--         単純CASE（値の比較）、検索CASE（条件式）、サブクエリを使ったCASE等を示す。

-- (Replace a code with a word – two examples.)
-- 単純CASE: GenderコードをMale/Femaleに変換
CASE Students.Gender WHEN 'M' THEN 'Male' ELSE 'Female' END

CASE Students.Gender
  WHEN 'M' THEN 'Male'
  WHEN 'F' THEN 'Female'
  ELSE 'Unknown' END

--(Convert a Centigrade reading to Fahrenheit.)
CASE Readings.Measure WHEN 'C' 
  THEN (Temperature * 9 / 5) + 32 
  ELSE Temperature
END

--(Return the discount amount based on customer rating.)
CASE (SELECT Customers.Rating FROM Customers
    WHERE Customers.CustomerID = Orders.CustomerID)
  WHEN 'A' THEN 0.10
  WHEN 'B' THEN 0.05
  ELSE 0.00 END
