create database hustle_app; 
use hustle_app;

create table products ( 
product_id INT PRIMARY KEY, 
product_name Varchar(50), 
price decimal(10,2) 
); 

create table orders (
order_id int primary key, 
product_id int, 
quantity int, 
foreign key (product_id) references	products(product_id)
); 

create table staff ( 
staff_id int primary key auto_increment, 
staff_name varchar(50), 
positions varchar(30)
);

alter table orders
add column staff_id int, 
add foreign key (staff_id) references staff (staff_id);





