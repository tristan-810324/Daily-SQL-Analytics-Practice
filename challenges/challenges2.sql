-- CHALLENGES #2

/* Show all registered customers 
who have never successfully completed an order
*/

select 
	c.customer_id, 
    c.customer_name
From Customers c 
left join orders o 
	on c.customer_id = o.customer_id 
    and o.status = 'completed'
where o.order_id is null; 