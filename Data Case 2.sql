--This table can be used for further analysis, like calculating profitability, vendor performance, or shelf-time efficiency.--
--focus on the core aspects necessary for analyzing inventory timing, procurement trends, seasonality, and vendor performance.--

CREATE TABLE TEMP.c2_Prep_Analysis_Simplified AS
SELECT  
    p.InventoryId,
    p.PODate,
    s.SalesDate,
    ROUND(julianday(s.SalesDate) - julianday(p.PODate)) AS DaysOnShelf,
    p.PurchasePrice,
    strftime('%m', p.PODate) AS PurchaseMonth,
    strftime('%m', s.SalesDate) AS SaleMonth,
    p.VendorName,
    p.VendorNumber
FROM  
    PurchasesDec p 
INNER JOIN 
    SalesDec s 
ON 
    p.InventoryId = s.InventoryId;
