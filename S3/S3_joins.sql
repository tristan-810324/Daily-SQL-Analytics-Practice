create database practice; 
use practice;

-- create a table for course
create table Courses ( 
course_id int primary key, 
course_name VARCHAR(50)
);

-- Create a table for student
create table Students (
student_id int primary key, 
student_name varchar(50), 
course_id int
);


insert into Courses (course_id,course_name) values
(101, 'bsit'), 
(102, 'hm'), 
(103, 'com engr'),
(104, 'tambay'); 

INSERT INTO students (student_id, student_name, course_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 101),
(4, 'David', NULL); -- Walang kurso si David

-- INNER JOIN 
select 
S.student_id, 
S.student_name, 
C.course_id
from students S
inner join courses C 
on S.course_id = C.course_id;

-- LEFT JOIN
SELECT 
    S.student_id, 
    S.student_name, 
    C.course_name
FROM Students S                  -- KALIWA (Bida)
LEFT JOIN Courses C              -- KANAN
    ON S.course_id = C.course_id;

-- RIGHT JOIN
SELECT 
    S.student_name, 
    C.course_id, 
    C.course_name
FROM Students S                  -- KALIWA
RIGHT JOIN Courses C             -- KANAN (Bida)
    ON S.course_id = C.course_id;


-- Right join ipapakita ang lahat ng nasa table kahit null 
SELECT 
    c.customer_id, 
    c.customer_name, 
    o.order_id, 
    o.product_name
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;


-- Left join ipapakita lahat ng nasa table kahit null
SELECT 
    c.customer_id, 
    c.customer_name, 
    o.order_id, 
    o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;