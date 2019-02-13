/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
USE WideWorldImporters;
GO
SELECT A.PurchaseOrderID
      ,A.SupplierID
      ,A.OrderDate
      ,A.DeliveryMethodID
      ,A.ContactPersonID
      ,A.ExpectedDeliveryDate
      ,A.SupplierReference
      ,A.IsOrderFinalized
      ,A.Comments
      ,A.InternalComments
      ,A.LastEditedBy
      ,A.LastEditedWhen
	  ,P.SupplierName
	  , Z.FullName AS PrimaryContactPerson
	  FROM WideWorldImporters.Purchasing.PurchaseOrders as A
	  LEFT OUTER JOIN WideWorldImporters.Purchasing.Suppliers AS P ON A.SupplierID = P.SupplierID
	  LEFT OUTER JOIN WideWorldImporters.Application.People AS Z ON P.PrimaryContactPersonID = Z.PersonID
	  	    WHERE (YEAR(A.OrderDate) = '2014') AND (A.DeliveryMethodID = '7' OR  A.DeliveryMethodID = '1');
