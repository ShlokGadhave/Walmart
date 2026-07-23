-- Rank()
SELECT
Store,
SUM(Weekly_Sales) Total_Sales,
RANK() OVER(ORDER BY SUM(Weekly_Sales) DESC) Store_Rank
FROM walmart
GROUP BY Store;

-- Dense Rank()
SELECT
Store,
SUM(Weekly_Sales) Total_Sales,
DENSE_RANK() OVER(ORDER BY SUM(Weekly_Sales) DESC)
FROM walmart
GROUP BY Store;

-- Cumulative Sales
SELECT
Date,
Weekly_Sales,
SUM(Weekly_Sales)
OVER(ORDER BY Date) Running_Total
FROM walmart;

-- 4-week Moving Average

SELECT
Date,
Weekly_Sales,
AVG(Weekly_Sales)
OVER(
ORDER BY Date
ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
) Moving_Average
FROM walmart;

-- Highest weekly sale of each store
SELECT
Store,
MAX(Weekly_Sales) Highest_Sale
FROM walmart
GROUP BY Store;

-- Lowest weekly sale
SELECT
Store,
MIN(Weekly_Sales) Lowest_Sale
FROM walmart
GROUP BY Store;

-- Rolling yearly sales
SELECT
Date,
SUM(Weekly_Sales)
OVER(
ORDER BY Date
ROWS BETWEEN 51 PRECEDING AND CURRENT ROW
) Rolling_Year
FROM walmart;

-- Weeks where sales increased
SELECT
Date,
Weekly_Sales,
LAG(Weekly_Sales)
OVER(ORDER BY Date) Previous_Sales
FROM walmart;


