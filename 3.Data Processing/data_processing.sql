SELECT * 
FROM
brightlearn.coffee.bright_coffee_shop
;

--Big Code
SELECT
transaction_date,
 --From original table
DAYNAME(transaction_date) AS Day_name, --Gives the specific name of the day of the week,e.g, Sun:New column
MONTHNAME(transaction_date) AS Month_name, --Gives the specific name of the month of the year,e.g, Jan:New column

--Sales metrics
COUNT(transaction_id) AS number_of_sales, --Counting all the rows:New column
SUM(transaction_qty) AS total_units_sold, --Sum of all the units sold:New column
COUNT(DISTINCT product_id) AS unique_products, --Counting the number of unique products:New column
COUNT(store_id) AS number_of_stores, --Counting all the rows :New column

--Total Revenue
ROUND(SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)),2) AS total_sales_revenue, --Sum of all the revenue using Transaction qty and unit price generated:New column




--1:Case statements always create buckets for enhanced analysis

--This Case statement is classifying the DAYNAME column into day classification buckets:New column
CASE
WHEN DAYNAME(transaction_date) IN ('Sun','Sat') THEN 'Weekend'
WHEN  DAYNAME(transaction_date) IN ('Mon','Tue','Wed','Thu','Fri') THEN 'Weekday'
END AS day_classification, --Extract the day of the week,e.g, mon

--This Case statement is classifying the transaction time column into time classification buckets:New column
CASE
 WHEN transaction_time BETWEEN '6:00:00' AND '11:59:59' THEN 'Morning'
WHEN transaction_time BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
WHEN transaction_time BETWEEN '18:00:00' AND '21:59:59' THEN 'Night'
END AS time_classification,

store_location,
product_category,
product_type,
product_detail

FROM brightlearn.coffee.bright_coffee_shop

GROUP BY ALL;
