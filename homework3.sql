USE WideWorldImporters;
GO
SELECT  Orders.OrderID,
 Orders.OrderDate,
  Orders.ExpectedDeliveryDate,
   Orders.PickingCompletedWhen,
    (MONTH(orders.orderdate) - 1)/3 +1 as Quarter,
	(MONTH(orders.orderdate) - 1)/4 +1 as Third
FROM Sales.Orders
INNER JOIN Sales.OrderLines
ON Orders.OrderID = OrderLines.OrderID
WHERE (Orders.PickingCompletedWhen is not null)
AND (OrderLines.UnitPrice > 100 OR OrderLines.Quantity > 20)
GROUP BY Orders.OrderID, Orders.OrderDate, Orders.ExpectedDeliveryDate, Orders.PickingCompletedWhen
ORDER BY Quarter, Third, Orders.OrderDate, Orders.OrderID
OFFSET 1000 ROWS FETCH NEXT 100 ROWS ONLY
