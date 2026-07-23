-- Average weekly sales by store
SELECT
Store,
AVG(Weekly_Sales) AS Avg_Sales
FROM walmart
GROUP BY Store;

-- Stores above overall average
SELECT
Store,
AVG(Weekly_Sales) Avg_Sales
FROM walmart
GROUP BY Store
HAVING Avg_Sales >
(
SELECT AVG(Weekly_Sales)
FROM walmart
);

-- Stores below overall average
SELECT
Store,
AVG(Weekly_Sales) Avg_Sales
FROM walmart
GROUP BY Store
HAVING Avg_Sales <
(
SELECT AVG(Weekly_Sales)
FROM walmart
);

-- Store contribution %
SELECT
Store,
ROUND(
SUM(Weekly_Sales)/
(SELECT SUM(Weekly_Sales) FROM walmart)*100,
2
) AS Contribution
FROM walmart
GROUP BY Store;

-- Most consistent store
SELECT
Store,
VARIANCE(Weekly_Sales) AS Sales_Variance
FROM walmart
GROUP BY Store
ORDER BY Sales_Variance
LIMIT 1;