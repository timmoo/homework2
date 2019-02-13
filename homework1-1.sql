
USE WideWorldImporters;
GO
SELECT  *
FROM Warehouse.StockItems
where StockItemName LIKE ('Animal%') OR StockItemName LIKE ('%urgent%');