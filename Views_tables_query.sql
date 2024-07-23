--Creating a schema for the views
CREATE SCHEMA SalesWH

--Creating a view for adding customer information to Sales.Customers table such as their city and state instead of having to import 3 tables
CREATE VIEW SalesWH.CustomerView AS
SELECT sc.[CustomerID], sc.[CustomerName], sc.[BillToCustomerID], sc.[CustomerCategoryID], sc.[BuyingGroupID]
      , sc.[PrimaryContactPersonID], sc.[AlternateContactPersonID], sc.[DeliveryMethodID], sc.[DeliveryCityID]
      , sc.[PostalCityID], sc.[CreditLimit], sc.[AccountOpenedDate], sc.[StandardDiscountPercentage]
      , sc.[IsStatementSent], sc.[IsOnCreditHold], sc.[PaymentDays], sc.[PhoneNumber], sc.[FaxNumber], sc.[DeliveryRun]
      , sc.[RunPosition], sc.[WebsiteURL], sc.[DeliveryAddressLine1], sc.[DeliveryAddressLine2]
      , sc.[DeliveryPostalCode], sc.[PostalAddressLine1], sc.[PostalAddressLine2], sc.[PostalPostalCode]
      , sc.[LastEditedBy], sc.[ValidFrom], sc.[ValidTo]
	  , ac.CityID, ac.CityName
	  , asp.StateProvinceID, asp.StateProvinceName, asp.SalesTerritory
FROM Sales.Customers sc
JOIN Application.Cities ac
ON sc.DeliveryCityID = ac.CityID
JOIN Application.StateProvinces asp
ON ac.StateProvinceID = asp.StateProvinceID

--Creating a view for Warehouse.StockItems to include the item's group to eliminate the need for a StockGroups table
CREATE VIEW SalesWH.StockItems_View AS
SELECT wsi.*, wsg.StockGroupID, wsg.StockGroupName
FROM Warehouse.StockItems wsi
JOIN Warehouse.StockItemStockGroups wsisg
ON wsi.StockItemID = wsisg.StockItemID
JOIN Warehouse.StockGroups wsg
ON wsisg.StockGroupID = wsg.StockGroupID

--Creating a fact table
CREATE VIEW SalesWH.Fact_Table AS
SELECT si.InvoiceID, wsit.StockItemTransactionID, wsit.StockItemID
	  , ABS(wsit.Quantity) AS SalesQuantity, si.InvoiceDate, si.ConfirmedDeliveryTime
FROM Warehouse.StockItemTransactions wsit
JOIN Sales.Invoices si
ON wsit.InvoiceID = si.InvoiceID