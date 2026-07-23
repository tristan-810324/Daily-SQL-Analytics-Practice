-- online shopping system

create database shopping;
use shopping; 

create table customers ( 
	customer_id int primary key auto_increment, 
    customer_name varchar(50) not null, 
    email varchar(50) not null, 
	city varchar(50) not null
); 

create table products ( 
	product_id int primary key auto_increment,
    product_name varchar(50) not null, 
    category varchar(30) not null,
    price decimal(10, 2) not null
); 

create table employees ( 
	employee_id int primary key auto_increment, 
    employee_name varchar(50) not null, 
    emp_position varchar(50) not null
); 

create table orders ( 
	order_id int primary key auto_increment,      
    customer_id int,  -- fk in customers table
	employee_id int, -- fk in employees table
    order_date timestamp,
    
	constraint fk_orders_customers 
	foreign key (customer_id)
	references customers(customer_id), 
    
    constraint fk_orders_employees
    foreign key (employee_id)
    references employees(employee_id)
	
); 

create table order_items ( 
	order_item_id int primary key auto_increment, 
    order_id int,  -- fk in orders table 
    product_id int,  -- fk in products table 
    quatity int null, 
    
    constraint fk_orderItems_orders 
    foreign key (order_id)
    references orders(order_id),
    
    constraint fk_orderItem_orders 
    foreign key (product_id)
	references products(product_id)
); 


INSERT INTO customers VALUES
(1,'Tristan Bautista','tristan@gmail.com','Manila'),
(2,'Maria Santos','maria@gmail.com','Quezon City'),
(3,'John Cruz','john@gmail.com','Cebu'),
(4,'Ana Reyes','ana@gmail.com','Davao'),
(5,'Peter Lim','peter@gmail.com','Baguio');


INSERT INTO products VALUES
(1,'Mechanical Keyboard','Electronics',2500),
(2,'Gaming Mouse','Electronics',1500),
(3,'Office Chair','Furniture',5500),
(4,'Laptop Stand','Accessories',800),
(5,'USB Hub','Accessories',600),
(6,'Monitor','Electronics',9500);



INSERT INTO employees VALUES
(1,'Alex','Sales'),
(2,'Erica','Sales'),
(3,'Michael','Manager');

INSERT INTO orders VALUES
(1,1,1,'2026-07-20'),
(2,2,2,'2026-07-21'),
(3,3,1,'2026-07-21'),
(4,1,3,'2026-07-22'),
(5,5,2,'2026-07-23');

INSERT INTO order_items VALUES
(1,1,1,1),
(2,1,2,2),
(3,2,3,1),
(4,3,6,1),
(5,3,4,1),
(6,4,5,3),
(7,5,2,1),
(8,5,6,2);

-- Part A — INNER JOIN
-- Challenge 1: Show order_id and customer_name.
	select 
		customer_name, 
		order_id 
    from customers c 
    inner join  orders o 
	on c.customer_id  = o.customer_id; 

-- Challenge 2: Show order_id, customer_name, and order_date.
    select 
		order_id, 
        customer_name, 
        order_date
	from customers c 
    inner join orders o 
    on c.customer_id = o.customer_id; 

-- Challenge 3: Show employee_name and order_date.
	SELECT
		e.employee_name,
		o.order_date
	FROM employees e
	INNER JOIN orders o
	ON e.employee_id = o.employee_id;

-- Challenge 4: Show order_id and employee_name.

-- Challenge 5: Show customer_name and employee_name for every order.

-- Challenge 6: Show product_name and quantity.

-- Challenge 7: Show order_id, product_name, and quantity.

-- Challenge 8: Show customer_name, product_name, and quantity.

-- Challenge 9: Show customer_name and all products they purchased.

-- Challenge 10: Show order_date and product_name.




-- Part B — INNER JOIN + WHERE


-- Challenge 11: Show all orders made by Tristan Bautista.

-- Challenge 12: Show all products purchased by Maria Santos.

-- Challenge 13: Show all Electronics products ordered.

-- Challenge 14: Show products with price greater than 3000.

-- Challenge 15: Show orders handled by Alex.

-- Challenge 16: Show all Accessories products.

-- Challenge 17: Show all orders from Quezon City customers.

-- Challenge 18: Show all products purchased on 2026-07-21.

-- Challenge 19: Show all products purchased by customers from Manila.

-- Challenge 20: Show orders handled by the Manager.
 


 -- Part C — INNER JOIN + ORDER BY COMMENT

-- Challenge 21: Show all purchased products sorted by price (Highest to Lowest).

-- Challenge 22: Show customers sorted alphabetically with their orders.

-- Challenge 23: Show products sorted by quantity (Highest to Lowest).

-- Challenge 24: Show orders sorted by order_date (Newest to Oldest).

-- Challenge 25: Show employees sorted alphabetically with the orders they handled.


-- Part D — LEFT JOIN 

-- Challenge 26: Show all customers, even those without orders.

-- Challenge 27: Show all products, even if they have never been ordered.

-- Challenge 28: Show all employees, even if they never handled an order.

-- Challenge 29: Show customers who have never placed an order.

-- Challenge 30: Show products that have never been purchased.












