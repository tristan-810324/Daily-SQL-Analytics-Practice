/*  Understanding how primary keys, foreign keys works  and how to 
buid proper relationships on tables */ 

CREATE DATABASE hustle_app; 
USE hustle_app;

-- Dimension Table: Products
CREATE TABLE products ( 
    product_id INT PRIMARY KEY, 
    product_name VARCHAR(50) NOT NULL, 
    price DECIMAL(10, 2) NOT NULL 
); 

-- Dimension Table: Staff
CREATE TABLE staff ( 
    staff_id INT PRIMARY KEY AUTO_INCREMENT, 
    staff_name VARCHAR(50) NOT NULL, 
    position VARCHAR(30)
);

-- Fact Table: Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY, 
    product_id INT, 
    quantity INT NOT NULL, 
    staff_id INT, 
    
    -- Maintain referential integrity across tables
    CONSTRAINT fk_orders_products FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_orders_staff FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);