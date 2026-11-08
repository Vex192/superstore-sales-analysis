-- Day 6

-- Query 1: Total sales and profit by region
SELECT 
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

-- Query 2: Top 10 customers by sales
SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Query 3: Loss-making sub-categories
SELECT    
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

-- Query 4: Monthly sales totals
SELECT    
    month,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY month
ORDER BY month;

-- Query 5: Rank customers by profit (Window Function)
SELECT   
    customer_name,
    ROUND(SUM(profit), 2) AS total_profit,
    RANK() OVER (
        ORDER BY SUM(profit) DESC
        ) AS profit_rank
FROM superstore
GROUP BY customer_name
ORDER BY profit_rank;