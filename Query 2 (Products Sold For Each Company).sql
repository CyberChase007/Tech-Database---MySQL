USE tech;
SELECT P.Name, S.TotalProductsSold
FROM SalesPerformance S
JOIN Products P ON S.TopSellingProductID = P.ProductID
ORDER BY S.TotalProductsSold DESC
LIMIT 10;
