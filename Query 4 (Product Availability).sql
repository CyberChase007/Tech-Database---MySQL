USE tech;
SELECT CompanyName, COUNT(*) AS NumberOfProducts
FROM Products
GROUP BY CompanyName;
