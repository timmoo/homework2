/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
USE WideWorldImporters;
GO
SELECT 	 TOP 10 A.*,
		P.FullName As Salesperson,
		Z.CustomerName
	  FROM Sales.Orders as A
	  LEFT OUTER JOIN WideWorldImporters.Application.People AS P ON A.SalespersonPersonID = P.PersonID
	  LEFT OUTER JOIN WideWorldImporters.Sales.Customers AS Z ON A.CustomerID = Z.CustomerID
	  ORDER BY A.OrderDate DESC

