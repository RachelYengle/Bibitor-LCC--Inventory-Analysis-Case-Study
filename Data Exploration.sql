SELECT COUNT(PurchasePrice)
FROM PurchasesDec
WHERE PurchasePrice < '1000';

SELECT COUNT(PurchasePrice)
FROM PurchasesDec
WHERE PurchasePrice > '1000';

SELECT * 
FROM BegInvDec
WHERE Store = 79
AND Brand = 58
ORDER BY Store DESC; 

SELECT * 
FROM EndInvDec
WHERE Store = 79
AND Brand = 58
ORDER BY Store DESC; 

SeLECT * 
FROM PricingPurchasesDec
ORDER BY Brand ASC;

SELECT * 
FROM PricingPurchasesDec
ORDER BY Classification DESC;

SELECT Classification, SUM(Volume)
FROM PricingPurchasesDec
WHERE Classification = '2'; --7,408,100.50--

SELECT Classification, SUM(Volume)
FROM PricingPurchasesDec
WHERE Classification = '1'; --2,922,745.0--

SELECT VendorName, VendorNumber, PONumber, Dollars 
FROM PurchasesDec
WHERE Classification = '2'
ORDER BY Dollars DESC LIMIT 10;

SELECT * 
FROM SalesDec;

SELECT *
FROM VendorInvoicesDec
WHERE Approval = 'Frank Delahunt';

-- tired discounts given to vendors based on volume--
