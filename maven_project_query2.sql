-- Active: 1730905934188@@127.0.0.1@3306@restaurant_db

-- 1) View the order_details table. What is the date range of the table?
--View order_details table
SELECT * FROM order_details;

-- Date range of table
SELECT MIN(order_date) AS earliest_date, MAX(order_date) AS latest_date
FROM order_details;

-- 2) How many orders were made within this date range? How many items were ordered within this date range?
-- Order count
SELECT COUNT(DISTINCT order_id) AS order_count FROM order_details;

-- Order items count
SELECT COUNT(item_id) AS order_count FROM order_details;

-- 6) Total spend
SELECT SUM(price) AS order_total FROM comb_orders_menu;

-- 3) Which orders had the most number of items?
SELECT order_id, COUNT(item_id) AS order_item_count
FROM order_details
GROUP BY
    order_id
ORDER BY order_item_count DESC;

-- 4) How many orders had more than 12 items?
SELECT COUNT(*)
FROM (
        SELECT order_id, COUNT(item_id) AS order_item_count
        FROM order_details
        GROUP BY
            order_id
        HAVING
            order_item_count > 12
    ) AS order_count;