/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
USE WideWorldImporters;
GO
SELECT O.*
      ,S.SupplierName
	  ,P.FullName AS PrimaryContactPerson
	  ,M.DeliveryMethodName
	  FROM Purchasing.PurchaseOrders as O
	  INNER JOIN Purchasing.Suppliers AS S ON O.SupplierID = S.SupplierID
	  INNER JOIN Application.People AS P ON S.PrimaryContactPersonID = P.PersonID
	  INNER JOIN Application.DeliveryMethods AS M ON O.DeliveryMethodID = M.DeliveryMethodID
	  	    WHERE (YEAR(O.OrderDate) = '2014') AND (M.DeliveryMethodName LIKE 'Post' OR  M.DeliveryMethodName LIKE 'Road Freight');
