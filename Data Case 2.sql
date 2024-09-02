--This table can be used for further analysis, like calculating profitability, vendor performance, or shelf-time efficiency.--
--focus on the core aspects necessary for analyzing inventory timing, procurement trends, seasonality, and vendor performance.--

CREATE TABLE TEMP.c2_DaysonShelf_Anlaysis AS
SELECT
    ROUND(julianday(s.SalesDate) - julianday(p.PODate)) AS DaysOnShelf
FROM  
    PurchasesDec p 
INNER JOIN 
    SalesDec s 
ON 
    p.InventoryId = s.InventoryId;
--

CREATE TABLE TEMP.c2_Season_Anlaysis AS
SELECT  
  strftime('%m', p.PODate) AS PurchaseMonth,
  strftime('%m', s.SalesDate) AS SaleMonth
FROM  
    PurchasesDec p 
INNER JOIN 
    SalesDec s 
ON 
    p.InventoryId = s.InventoryId;

--
CREATE TABLE TEMP.c2_Data_Analysis AS
SELECT  
    p.InventoryId,
    p.PODate,
    s.SalesDate,
	p.PurchasePrice,
	p.VendorName,
    p.VendorNumber
FROM  
    PurchasesDec p 
INNER JOIN 
    SalesDec s 
ON 
    p.InventoryId = s.InventoryId;
