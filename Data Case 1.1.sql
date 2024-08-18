--A critcal vendor is a vendor with >$50,000 purchase amount--
CREATE TABLE TEMP.c1_Prep_Billing_Amount as
SELECT VendorNumber,VendorName,
 SUM(Dollars) AS 'TotalBilling'
 FROM VendorInvoicesDec
 WHERE Approval = 'Frank Delahunt'
 GROUP BY VendorNumber, VendorName
 HAVING SUM(Quantity) > 50000
 ORDER BY TotalBilling DESC;

CREATE TABLE TEMP.c1_Prep_Purchase_Orders_Amount as
SELECT VendorNumber, VendorName,
 COUNT(DISTINCT PONumber) AS 'TotalPurchaseOrders'
 FROM VendorInvoicesDec
 WHERE Approval = 'Frank Delahunt'
 GROUP BY VendorNumber, VendorName
 HAVING SUM(Quantity) > 50000
 ORDER BY TotalPurchaseOrders DESC;
