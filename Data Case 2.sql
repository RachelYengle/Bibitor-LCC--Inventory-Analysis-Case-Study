--This table can be used for further analysis, like calculating profitability, vendor performance, or shelf-time efficiency.--

CREATE TABLE TEMP.c2_Prep_Analysis AS
SELECT  
    p.InventoryId,
    p.PODate,
    s.SalesDate,
    ROUND(julianday(s.SalesDate) - julianday(p.PODate)) AS 'DaysOnShelf',
    p.PurchasePrice,
    s.SalesPrice,
    strftime('%m', p.PODate) AS 'PurchaseMonth',
    strftime('%m', s.SalesDate) AS 'SaleMonth',
    p.VendorName,
    p.VendorNumber,
    p.Quantity AS 'PurchasedQuantity',
    s.SalesQuantity
FROM  
    PurchasesDec p 
LEFT JOIN 
    SalesDec s 
ON 
    p.InventoryId = s.InventoryId;
