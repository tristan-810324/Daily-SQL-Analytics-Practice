/*  Understanding how primary keys, foreign keys works and how to 
buid proper relationships on tables */ 

-- Challenge #2 - Restaurant Management System
create database resto; 
use resto;

-- for menu table
create table menu  ( 
   
    menu_id int primary key auto_increment,
    menu_name varchar(50) not null, 
    price decimal (10,2) not null
    
);

-- for customers table
create table Customers (
    customer_id int primary key auto_increment,
    customer_name varchar(50) not null, 
    contact_number varchar (15) not null
); 

-- for waiters table
create table waiters (
    waiter_id int primary key auto_increment,
    waiter_name varchar(50) not null,
    shift_statu enum('morning', 'afternoon', 'evening') default 'morning'
);

-- for payents table
create table payments (
    payment_id int primary key auto_increment,
    payment_type enum('cash', 'card', 'online') default 'cash',
    total_amount decimal(10,2) not null
);

-- for orders table
create table orders (
     order_id int primary key auto_increment,
     menu_id int not null,
     customer_id int not null, 
     waiter_id  int not  null, 
     paymaent_id int not null, 
    order_date datetime default current_timestamp,
    
    
    constraint fk_orders_menu
        foreign key (menu_id)
        references menu(menu_id),


    constraint fk_orders_customers
        foreign key (customer_id)
        references customers(customer_id), 


    constraint fk_orders_waiters
        foreign key (waiter_id)
        references waiters(waiter_id),

    constraint  fk_orders_payments
        foreign key (payment_id)
        references payments(payment_id)


);  





