-- online shopping system

CREATE DATABASE IF NOT EXISTS shopping;
USE shopping; 



CREATE TABLE customers ( 
    customer_id INT PRIMARY KEY AUTO_INCREMENT, 
    customer_name VARCHAR(50) NOT NULL, 
    email VARCHAR(50) NOT NULL, 
    city VARCHAR(50) NOT NULL
); 

CREATE TABLE products ( 
    product_id INT PRIMARY KEY AUTO_INCREMENT, 
    product_name VARCHAR(50) NOT NULL, 
    category VARCHAR(30) NOT NULL, 
    price DECIMAL(10, 2) NOT NULL
); 

CREATE TABLE employees ( 
    employee_id INT PRIMARY KEY AUTO_INCREMENT, 
    employee_name VARCHAR(50) NOT NULL, 
    emp_position VARCHAR(50) NOT NULL
); 

CREATE TABLE orders ( 
    order_id INT PRIMARY KEY AUTO_INCREMENT,      
    customer_id INT,  
    employee_id INT, 
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_orders_customers 
        FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    
    CONSTRAINT fk_orders_employees
        FOREIGN KEY (employee_id) 
        REFERENCES employees(employee_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
); 

CREATE TABLE order_items ( 
    order_item_id INT PRIMARY KEY AUTO_INCREMENT, 
    order_id INT,  
    product_id INT,  
    quantity INT NULL, -- Inayos mula sa 'quatity'
    
    CONSTRAINT fk_orderItems_orders 
        FOREIGN KEY (order_id) 
        REFERENCES orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    CONSTRAINT fk_orderItems_products 
        FOREIGN KEY (product_id) 
        REFERENCES products(product_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
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



-- PART A — INNER JOIN


-- Challenge 1: Show order_id and customer_name.
SELECT 
    c.customer_name, 
    o.order_id 
FROM customers c 
INNER JOIN orders o ON c.customer_id = o.customer_id; 

-- Challenge 2: Show order_id, customer_name, and order_date.
SELECT 
    o.order_id, 
    c.customer_name, 
    o.order_date
FROM customers c 
INNER JOIN orders o ON c.customer_id = o.customer_id; 

-- Challenge 3: Show employee_name and order_date.
SELECT
    e.employee_name,
    o.order_date
FROM employees e
INNER JOIN orders o ON e.employee_id = o.employee_id;

-- Challenge 4: Show order_id and employee_name.
SELECT 
    o.order_id, 
    e.employee_name
FROM orders o 
INNER JOIN employees e ON o.employee_id = e.employee_id; 

-- Challenge 5: Show customer_name and employee_name for every order.
SELECT 
    c.customer_name,
    e.employee_name,
    o.order_id
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN employees e ON o.employee_id = e.employee_id;

-- Challenge 6: Show product_name and quantity.
SELECT  
    p.product_name, 
    oi.quantity
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id; 

-- Challenge 7: Show order_id, product_name, and quantity.
SELECT 
    oi.order_id,
    p.product_name, 
    oi.quantity  
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id;

-- Challenge 8: Show customer_name, product_name, and quantity.
SELECT 
    c.customer_name,
    p.product_name,
    oi.quantity
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- Challenge 9: Show customer_name and all products they purchased.
SELECT DISTINCT
    c.customer_name,
    p.product_name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- Challenge 10: Show order_date and product_name.
SELECT 
    o.order_date,
    p.product_name
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;



-- PART B — INNER JOIN + WHERE


-- Challenge 11: Show all orders made by Tristan Bautista.
SELECT 
    o.order_id,
    c.customer_name,
    o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_name = 'Tristan Bautista';

-- Challenge 12: Show all products purchased by Maria Santos.
SELECT 
    p.product_name,
    oi.quantity
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE c.customer_name = 'Maria Santos';

-- Challenge 13: Show all Electronics products ordered.
SELECT DISTINCT
    p.product_name,
    p.category
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
WHERE p.category = 'Electronics';

-- Challenge 14: Show products with price greater than 3000.
SELECT DISTINCT
    p.product_name,
    p.price
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
WHERE p.price > 3000;

-- Challenge 15: Show orders handled by Alex.
SELECT 
    o.order_id,
    e.employee_name,
    o.order_date
FROM orders o
INNER JOIN employees e ON o.employee_id = e.employee_id
WHERE e.employee_name = 'Alex';

-- Challenge 16: Show all Accessories products.
SELECT DISTINCT
    p.product_name,
    p.category
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
WHERE p.category = 'Accessories';

-- Challenge 17: Show all orders from Quezon City customers.
SELECT 
    o.order_id,
    c.customer_name,
    c.city
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'Quezon City';

-- Challenge 18: Show all products purchased on 2026-07-21.
SELECT 
    p.product_name,
    o.order_date
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE DATE(o.order_date) = '2026-07-21';

-- Challenge 19: Show all products purchased by customers from Manila.
SELECT DISTINCT
    p.product_name,
    c.customer_name,
    c.city
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE c.city = 'Manila';

-- Challenge 20: Show orders handled by the Manager.
SELECT 
    o.order_id,
    e.employee_name,
    e.emp_position
FROM orders o
INNER JOIN employees e ON o.employee_id = e.employee_id
WHERE e.emp_position = 'Manager';



-- PART C — INNER JOIN + ORDER BY


-- Challenge 21: Show all purchased products sorted by price (Highest to Lowest).
SELECT DISTINCT
    p.product_name,
    p.price
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
ORDER BY p.price DESC;

-- Challenge 22: Show customers sorted alphabetically with their orders.
SELECT 
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_name ASC;

-- Challenge 23: Show products sorted by quantity (Highest to Lowest).
SELECT 
    p.product_name,
    oi.quantity
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
ORDER BY oi.quantity DESC;

-- Challenge 24: Show orders sorted by order_date (Newest to Oldest).
SELECT 
    o.order_id,
    c.customer_name,
    o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC;

-- Challenge 25: Show employees sorted alphabetically with the orders they handled.
SELECT 
    e.employee_name,
    o.order_id,
    o.order_date
FROM employees e
INNER JOIN orders o ON e.employee_id = o.employee_id
ORDER BY e.employee_name ASC;


-- =====================================================
-- PART D — LEFT JOIN
-- =====================================================

-- Challenge 26: Show all customers, even those without orders.
SELECT 
    c.customer_name,
    o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Challenge 27: Show all products, even if they have never been ordered.
SELECT 
    p.product_name,
    oi.order_id
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id;

-- Challenge 28: Show all employees, even if they never handled an order.
SELECT 
    e.employee_name,
    o.order_id
FROM employees e
LEFT JOIN orders o ON e.employee_id = o.employee_id;

-- Challenge 29: Show customers who have never placed an order.
SELECT 
    c.customer_name,
    c.email
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Challenge 30: Show products that have never been purchased.
SELECT 
    p.product_name,
    p.price
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;