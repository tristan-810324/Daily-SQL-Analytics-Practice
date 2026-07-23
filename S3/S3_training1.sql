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













