SELECT*
FROM 
brightlearn.coffee.bright_coffee_shop
;



--HOW MANY STORES DO WE HAVE
--To check the name of the stores locations that i have
SELECT DISTINCT store_location
 FROM 
brightlearn.coffee.bright_coffee_shop;

--What is the period of this data?

SELECT MIN(transaction_date) AS start_date,
  MAX(transaction_date) AS last_date
  FROM brightlearn.coffee.bright_coffee_shop;

  SELECT MIN(transaction_time) AS opening_time,
  MAX(transaction_time) AS closing_time
  FROM brightlearn.coffee.bright_coffee_shop;


--How many different products are we selling in total?
SELECT COUNT(DISTINCT product_id) AS number_of_products
FROM brightlearn.coffee.bright_coffee_shop;


--How many products are we selling per store?
  SELECT store_location,
  COUNT(DISTINCT product_id) AS number_of_products
  FROM brightlearn.coffee.bright_coffee_shop
GROUP BY store_location;

--What are the different product category
SELECT DISTINCT product_category, product_type, product_detail
FROM brightlearn.coffee.bright_coffee_shop
WHERE product_category IN ('Coffee')
ORDER BY product_category;


SELECT MONTH(transaction_date) AS month,
       SUM(transaction_qty) AS units_sold
FROM brightlearn.coffee.bright_coffee_shop
WHERE transaction_date BETWEEN '2023-01-01' AND '2023-01-31'
GROUP BY month;

SELECT DAY(transaction_date) day,
      
      ROUND(SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)),2) AS revenue_by_day
FROM brightlearn.coffee.bright_coffee_shop
WHERE transaction_date BETWEEN '2023-01-01' AND '2023-01-31'
GROUP BY day;

