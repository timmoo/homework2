USE WideWorldImporters;
GO
SELECT * FROM Purchasing.Suppliers
LEFT OUTER JOIN Purchasing.PurchaseOrders ON Suppliers.SupplierID = PurchaseOrders.SupplierID
where PurchaseOrders.SupplierID is NULL
