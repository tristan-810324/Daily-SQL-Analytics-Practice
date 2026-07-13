
-- PRACTICES 
-- 1 
select
c.customer_name
FROM customers c 
left join orders o 
on c.customer_id = o.customer_id
where o.customer_id is null; 

-- 2 
select
o.order_id, 
c.customer_name, 
o.product_name
from customers c 
left join orders o 
on c.customer_id = o.customer_id; 

-- 3 
select 
customer_id, customer_name, country 
from customers 
where country in ("Philippines"); 


-- 4 
select 
	customer_id, 
	customer_name, 
	country
from customers
order by customer_name asc; 


-- 5 
select
	c.customer_name, 
	o.product_name
from customers c 
left join orders o 
on c.customer_id = o.customer_id; 



-- 6  
select count(*) as customer_without_orders 
from customers c 
left join orders o 
on c.customer_id  = o.customer_id
where o.customer_id is null ; 

-- 8 
SELECT
    c.customer_name,
    COUNT(*) AS total_orders
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(*) > 1;















