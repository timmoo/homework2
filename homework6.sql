/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
USE WideWorldImporters;
GO
SELECT 	 A.*,
		P.CustomerID,
		Z.CustomerName,
		Z.PhoneNumber
	  FROM Sales.OrderLines as A
	  LEFT OUTER JOIN WideWorldImporters.Sales.Orders AS P ON A.OrderID = P.OrderID
	  LEFT OUTER JOIN WideWorldImporters.Sales.Customers AS Z ON P.CustomerID = Z.CustomerID
	  Where Description LIKE ('Chocolate frogs 250g')
