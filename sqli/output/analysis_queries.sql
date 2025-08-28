SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(order_total) AS total_sales
FROM cu_pu.customer_purchase_dataset
GROUP BY month
ORDER BY month;

SELECT customer_id, SUM(order_total) AS total_spent
FROM cu_pu.customer_purchase_dataset
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

SELECT category, COUNT(DISTINCT order_id) AS total_orders,
       SUM(quantity) AS total_units
FROM cu_pu.customer_purchase_dataset
GROUP BY category
ORDER BY total_units DESC;


SELECT 'customer_id', 'total_spent'
UNION ALL
SELECT customer_id, SUM(order_total) AS total_spent
FROM cu_pu.customer_purchase_dataset
GROUP BY customer_id
HAVING total_spent > 2 * (SELECT AVG(order_total) FROM cu_pu.customer_purchase_dataset)
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/high_spenders.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

SELECT 'month', 'total_sales'
UNION ALL
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(order_total) AS total_sales
FROM cu_pu.customer_purchase_dataset
GROUP BY month
ORDER BY month
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/monthly_sales.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

