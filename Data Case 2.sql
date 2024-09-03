--This table can be used for further analysis, like calculating profitability, vendor performance, or shelf-time efficiency.--
-- focus on the core aspects necessary for analyzing inventory timing, procurement trends, seasonality, and vendor performance.--
--Due to size of data and limits on Tableau Public, I am only doing this Days on Shelf Anlaysis based on Quarter 1 data.--

CREATE TABLE Inventory_Analysis AS
SELECT 
	p.InventoryId,
	p.PurchasePrice,
	p.ReceivingDate,
	p.VendorName,
	s.SalesDate
 FROM 
	PurchasesDec p
INNER JOIN
	SalesDec s
ON 
p.InventoryId = s.InventoryId
WHERE 
    strftime('%m', s.SalesDate) IN ('01', '02', '03')
	AND
    p.InventoryId IN (
        SELECT 
            InventoryId
        FROM 
            PurchasesDec
        GROUP BY 
            InventoryId
        HAVING 
            COUNT(*) <= 2000
