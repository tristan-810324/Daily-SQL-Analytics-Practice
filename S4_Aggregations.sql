-- 1. Count 
SELECT COUNT(*) AS total_employees
FROM customers;

SELECT COUNT(*) as total_it
from customers
where department = "IT";  

SELECT COUNT(*) as total_it 
from customers
where department = "hr";  


SELECT
    c.customer_name,
    COUNT(*) AS total_completed_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_name
HAVING COUNT(*) >= 2
ORDER BY total_completed_orders DESC;