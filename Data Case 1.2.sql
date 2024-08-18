--A critcal vendor is a vendor with >$50,000 of inventory purchased from.--
CREATE TABLE TEMP.c1_Prep_Purchase_Amount AS
SELECT 
    VendorNumber, 
    VendorName,
    SUM(Quantity) AS 'TotalPurchaseAmount'
FROM 
    VendorInvoicesDec
WHERE 
    Approval = 'Frank Delahunt'
GROUP BY 
    VendorNumber, 
    VendorName
HAVING 
    SUM(Quantity) > 50000
ORDER BY 
    TotalPurchaseAmount DESC;
