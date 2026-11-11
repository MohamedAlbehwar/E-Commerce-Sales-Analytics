-- =========================================================================
-- DATA ANALYSIS (SQL)
-- =========================================================================

-- 1. Top 10 profitable products
SELECT product_name, SUM(profit) AS total_profit
FROM cleaned_df cd 
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;


-- 2. Top 10 customers by sales
SELECT customer_name, SUM(sales) AS total_sales
FROM cleaned_df cd 
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- 3. Region-wise total sales
SELECT region, SUM(sales) AS total_sales
FROM cleaned_df cd 
GROUP BY region
ORDER BY total_sales DESC;


-- 4. Category-wise average profit
SELECT category, ROUND(AVG(profit)::numeric, 2) AS average_profit
FROM cleaned_df cd 
GROUP BY category
ORDER BY average_profit DESC;


-- 5. Highest discount category
SELECT category, MAX(discount) AS max_discount
FROM cleaned_df cd
GROUP BY category
ORDER BY max_discount DESC
LIMIT 1;


-- 6.1 Orders with negative profit
SELECT order_id, product_name, profit
FROM cleaned_df cd 
WHERE profit < 0
ORDER BY profit ASC;

-- 6.2 Count Orders with negative profit
SELECT COUNT(order_id) AS total_negative_orders
FROM cleaned_df cd 
WHERE profit < 0;

-- 7. Monthly sales trend
SELECT TO_CHAR(order_date::date, 'YYYY-MM') AS sales_month, SUM(sales) AS total_sales
FROM cleaned_df cd 
GROUP BY sales_month
ORDER BY sales_month ASC;


-- 8. Market-wise revenue analysis
SELECT market, SUM(sales) AS total_revenue
FROM cleaned_df cd 
GROUP BY market
ORDER BY total_revenue DESC;


-- 9. Top-performing sub-categories
SELECT sub_category, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM cleaned_df cd 
GROUP BY sub_category
ORDER BY total_profit DESC;

-- 10. Ship mode usage analysis
SELECT ship_mode, COUNT(order_id) AS total_orders, SUM(sales) AS total_sales
FROM cleaned_df cd 
GROUP BY ship_mode
ORDER BY total_orders DESC;

--Key Insights

--• Market with Highest Revenue:
--  The "APAC" market generates the highest total revenue, reaching $3576349, making it the primary driver of global sales.

--• Least Profitable Categories:
--  The "Office Supplies" category is the least profitable, with an average profit of $16.57, indicating a strict need for pricing or cost restructuring.

--• Most Commonly Used Shipping Mode:
--  "Standard Class" is the most preferred shipping mode, capturing the largest share with "30717" total orders.

--• Negative Profit (Losses) Alert:
--  There are "12518" orders generating negative profit, which represents an area of leakage that requires immediate discount-policy reviews.

--• Top Product Performance:
--  The most profitable product is "Canon imageCLASS 2200 Advanced Copier", which generated a total profit of $25199.928.

--• Sales Trend & Seasonality:
--  The monthly sales trend shows a peak performance during the month of 2014-11, indicating strong seasonal demand.