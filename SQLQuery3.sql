
--entire table
SELECT * FROM customer;

-- Male vs Female PurhcaseAmount
SELECT gender , SUM(purchase_amount) AS REVENUE
FROM customer 
GROUP BY gender;

-- Customer highest purchase given using discount_applpied
SELECT customer_id, discount_applied, purchase_amount, (select AVG(purchase_amount) FROM customer) AS Average_PurhcaseAmount
FROM customer
WHERE discount_applied = 'yes' AND purchase_amount >= (select AVG(purchase_amount) FROM customer) 
ORDER BY purchase_amount DESC;

-- how many customers have the same purchase_amount, but only for amounts greater than the average
SELECT 
    purchase_amount,
    COUNT(customer_id) AS num_customers,
    AVG(purchase_amount) OVER () AS avg_purchase_amount, SUM(purchase_amount)/41 AS Percentile
FROM customer
WHERE discount_applied = 'yes'
AND purchase_amount > (SELECT AVG(purchase_amount) FROM customer)
GROUP BY purchase_amount
ORDER BY purchase_amount DESC;
