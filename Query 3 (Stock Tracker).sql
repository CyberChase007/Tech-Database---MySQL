SELECT 
    Name AS ProductName,
    Stock AS StockLevel
FROM 
    Products
ORDER BY 
    Stock ASC
LIMIT 10; -- Fetches only 10 products
