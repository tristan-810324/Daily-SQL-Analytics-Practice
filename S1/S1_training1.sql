/*  Understanding how primary keys, foreign keys works and how to 
buid proper relationships on tables */ 

create DATABASE coffee_shop; 
use coffee_shop;

create table products (
    product_id int primary key, 
    product_name varchar(50) not null,
    price decimal(10, 2) not null
); 


create table customers (
    customer_id int primary key auto_increment,
    customer_name varchar(50) not null, 
    email_address varchar(50) not null
); 


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    quantity INT NOT NULL,

    CONSTRAINT fk_orders_products
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT fk_orders_customers
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);





