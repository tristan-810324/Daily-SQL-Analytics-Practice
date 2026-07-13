create database employ; 
use employ; 


-- Inayos ang Employees para may foreign key na dept_id
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    genre VARCHAR(30),
    price DECIMAL(10, 2),
    stock INT
);

CREATE TABLE Gadgets (
    gadget_id INT PRIMARY KEY,
    model_name VARCHAR(50),
    brand VARCHAR(30),
    category VARCHAR(30),
    price DECIMAL(10, 2),
    stock_qty INT
);

-- 3. PAGPASOK NG DATA (INSERT INTO)
INSERT INTO Departments VALUES 
(101, 'IT'), (102, 'HR'), (103, 'Sales'), (104, 'Management');

INSERT INTO Employees VALUES 
(1, 'Juan Dela Cruz', 'IT', 45000, '2023-01-15', 101), 
(2, 'Maria Santos', 'HR', 38000, '2022-11-20', 102),
(3, 'Pedro Penduko', 'IT', 47000, '2024-02-10', 101),
(4, 'Ana Reyes', 'Sales', 32000, '2023-05-05', 103),
(5, 'Jose Rizal', 'Management', 80000, '2020-01-01', 104),
(6, 'Elena Cruz', 'HR', 40000, '2023-08-12', 102);

INSERT INTO Books VALUES 
(1, 'Hustle Hard', 'John Doe', 'Business', 500.00, 10),
(2, 'SQL Mastery', 'Jane Smith', 'Education', 850.00, 5),
(3, 'Midnight Tales', 'Rizal', 'Fiction', 300.00, 20),
(4, 'Web Dev Basics', 'John Doe', 'Education', 600.00, 15),
(5, 'Cooking 101', 'Maria Clara', 'Lifestyle', 450.00, 8),
(6, 'Business Logic', 'John Doe', 'Business', 900.00, 3);

INSERT INTO Gadgets VALUES 
(1, 'iPhone 15', 'Apple', 'Smartphone', 55000.00, 10),
(2, 'Galaxy S24', 'Samsung', 'Smartphone', 52000.00, 15),
(3, 'MacBook Air', 'Apple', 'Laptop', 65000.00, 5),
(4, 'Pixel 8', 'Google', 'Smartphone', 40000.00, 8),
(5, 'ZenBook', 'Asus', 'Laptop', 48000.00, 12),
(6, 'Watch Series 9', 'Apple', 'Wearable', 22000.00, 20),
(7, 'Tab S9', 'Samsung', 'Tablet', 35000.00, 6),
(8, 'ROG Strix', 'Asus', 'Laptop', 85000.00, 3);


-- 1. SELECT 
SELECT title, price FROM Books;

SELECT title AS "Book Name", stock AS "Available Qty" FROM Books;

SELECT title, price 
FROM Books 
ORDER BY price asc; 

SELECT title, price 
FROM Books 
ORDER BY price desc; 

select author, title, price from books 
order by price desc;

select emp_id, name, 
department from employees; 

-- 2. WHERE CLAUSE
select * from Gadgets;

-- 2.1 EQUALS
select * from gadgets where brand = "Apple"; 

-- 2.2 GREATER AND LESS THAN
select * from gadgets where price > 52000;  
select * from gadgets where price < 52000;

-- 2.3 GREATER/LESS THAN OR EQUAL
select * from gadgets where price >= 40000
order by price asc;

select * from gadgets where price <= 40000
order by price desc;

-- 2.4 NOT EQUAL
select * from gadgets where brand <> 'google';
select model_name, brand, category from gadgets 
where brand <> "samsung"; 

-- 2.5 EXPERIMENTS
SELECT model_name, category, price from gadgets
where price >= 10000
order by price asc;

select * from gadgets where price > 40000
order by price asc;

-- 2.6 BETWEEN
select model_name, brand, price from gadgets where price BETWEEN 55000 AND 65000;
SELECT * from gadgets where price  between 20000 and 50000 
order by price asc;

-- 2.7 LIKE
select * from books where author like 'j%'; 
select * from books where author like '%doe%' 
order by price desc; 

-- 2.8 IN
select * from employees;
select name, department, salary from employees
where department in ("it","hr")
order by salary asc; 













