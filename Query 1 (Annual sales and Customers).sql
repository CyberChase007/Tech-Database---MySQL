SELECT Year, SUM(TotalSalesAmount) AS TotalRevenue, SUM(UniqueCustomers) AS TotalCustomers
FROM SalesPerformance
GROUP BY Year;
