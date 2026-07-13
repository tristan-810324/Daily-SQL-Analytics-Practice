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




-- sum 
select sum(amount) as tristan_sales 
from sales 
where customers = "itan"; 



select
	c.customer_name, 
    sum(o.total) as total_spent 
from customer c 
inner join orders o 
on c.customer_id = o.customer_id 
group by c.customer_name; 



SELECT
    seller,
    SUM(amount) AS total_sales
FROM sales
GROUP BY seller;



-- AVG 
SELECT  avg(price) as average_price 
from products; 

SELECT
	Employee_name, 
    AVG(amount) as average_sales 
FROM sales 
GROUP BY Employees;

Select 
	e.employee_name, 
    avg(s.amount) as average_sales 
FROM employees e 
INNER JOIN sales s 
on e.employee_id = s.employee_id 
GROUP BY e.employee_name; 




-- group by 
SELECT
    employee,
    SUM(amount)
FROM sales
GROUP BY employee;

SELECT
    employee,
    SUM(amount) AS total_sales
FROM sales
GROUP BY employee;


SELECT
    employee,
    SUM(amount) AS total_sales
FROM sales
WHERE sale_month = 'July'
GROUP BY employee;



SELECT
    c.customer_name,
    SUM(o.total) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id
WHERE c.city = 'Manila'
GROUP BY c.customer_name;


SELECT
    employee,
    SUM(amount) AS total_sales
FROM sales
GROUP BY employee
HAVING SUM(amount) > 3000;










