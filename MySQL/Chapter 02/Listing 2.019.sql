-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example.

-- 【概要】Order_Details の INSERT / UPDATE / DELETE 時に Orders.OrderTotal を
--         自動再計算するストアドプロシージャと3つのトリガーを作成する。
--         最後にクリーンアップ用の DROP 文も実行する。

USE SalesOrdersSample;

DELIMITER $$

-- Order_Details の変更に応じて OrderTotal を再計算するプロシージャ
CREATE PROCEDURE UpdateOrdersOrderTotalProc (
	IN NewOrderNumber int,
	IN OldOrderNumber int
)
BEGIN
  UPDATE Orders
  SET OrderTotal = (
    SELECT SUM(OD.QuantityOrdered * OD.QuotedPrice) 
    FROM Order_Details OD
    WHERE OD.OrderNumber = Orders.OrderNumber
  )
  WHERE (Orders.OrderNumber = OldOrderNumber AND OldOrderNumber IS NOT NULL)
     OR (Orders.OrderNumber = NewOrderNumber AND NewOrderNumber IS NOT NULL)
  ;
END;
$$

DELIMITER ;

-- INSERT 後に新しい OrderNumber の OrderTotal を更新
CREATE TRIGGER updateOrdersOrderTotalsTrigInsert AFTER INSERT
ON Order_Details
FOR EACH ROW
CALL UpdateOrdersOrderTotalProc(NEW.OrderNumber, NULL);

-- UPDATE 後に新旧両方の OrderNumber の OrderTotal を更新
CREATE TRIGGER updateOrdersOrderTotalsTrigUpdate AFTER UPDATE
ON Order_Details
FOR EACH ROW
CALL UpdateOrdersOrderTotalProc(NEW.OrderNumber, OLD.OrderNumber);

-- DELETE 後に削除前の OrderNumber の OrderTotal を更新
CREATE TRIGGER updateOrdersOrderTotalsTrigDelete AFTER DELETE
ON Order_Details
FOR EACH ROW
CALL UpdateOrdersOrderTotalProc(NULL, OLD.OrderNumber);

-- クリーンアップ：作成したトリガーとプロシージャを削除
DROP TRIGGER updateOrdersOrderTotalsTrigDelete;
DROP TRIGGER updateOrdersOrderTotalsTrigUpdate;
DROP TRIGGER updateOrdersOrderTotalsTrigInsert;
DROP PROCEDURE UpdateOrdersOrderTotalProc;