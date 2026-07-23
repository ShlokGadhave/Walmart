-- Holiday vs Non-Holiday Sales
SELECT
Holiday_Flag,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart
GROUP BY Holiday_Flag;

-- Store with highest holiday sales
SELECT
Store,
SUM(Weekly_Sales) AS Holiday_Sales
FROM walmart
WHERE Holiday_Flag=1
GROUP BY Store
ORDER BY Holiday_Sales DESC
LIMIT 1;

-- Holiday sales contribution %
SELECT
ROUND(
SUM(CASE WHEN Holiday_Flag=1 THEN Weekly_Sales END)
/
SUM(Weekly_Sales)*100,2
) AS Holiday_Percentage
FROM walmart;

-- Average holiday sales
SELECT
AVG(Weekly_Sales) AS Average_Holiday_Sales
FROM walmart
WHERE Holiday_Flag=1;

-- Holiday generating highest sales
SELECT
Date,
SUM(Weekly_Sales) AS Holiday_Sales
FROM walmart
WHERE Holiday_Flag=1
GROUP BY Date
ORDER BY Holiday_Sales DESC
LIMIT 1;


