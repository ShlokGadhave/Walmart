-- Fuel Price Range
SELECT
CASE
WHEN Fuel_Price<3 THEN 'Low'
WHEN Fuel_Price BETWEEN 3 AND 3.5 THEN 'Medium'
ELSE 'High'
END AS Fuel_Range,
AVG(Weekly_Sales) Avg_Sales
FROM walmart
GROUP BY Fuel_Range;

-- Unemployment Range
SELECT
CASE
WHEN Unemployment<6 THEN 'Low'
WHEN Unemployment BETWEEN 6 AND 8 THEN 'Medium'
ELSE 'High'
END AS Unemployment_Range,
AVG(Weekly_Sales)
FROM walmart
GROUP BY Unemployment_Range;

-- CPI Range
SELECT
CASE
WHEN CPI<180 THEN 'Low'
WHEN CPI BETWEEN 180 AND 220 THEN 'Medium'
ELSE 'High'
END AS CPI_Range,
AVG(Weekly_Sales)
FROM walmart
GROUP BY CPI_Range;

-- Temperature Range
SELECT
CASE
WHEN Temperature<40 THEN 'Cold'
WHEN Temperature BETWEEN 40 AND 70 THEN 'Moderate'
ELSE 'Hot'
END AS Temp_Range,
AVG(Weekly_Sales)
FROM walmart
GROUP BY Temp_Range;

-- Highest fuel price weeks
SELECT
Date,
Fuel_Price,
Weekly_Sales
FROM walmart
ORDER BY Fuel_Price DESC
LIMIT 10;