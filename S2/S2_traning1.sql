-- Phase 1 (S1 + S2)

-- Cinema Ticket Booking System


CREATE DATABASE cinema;
USE cinema;

-- Movies Table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(50) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL,
    duration_minutes INT NOT NULL  
);

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);

-- Cashiers Table
CREATE TABLE cashiers (
    cashier_id INT PRIMARY KEY AUTO_INCREMENT,
    cashier_name VARCHAR(50) NOT NULL,
    shift ENUM('morning','afternoon','evening') DEFAULT 'morning'
);

-- Tickets Table
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    customer_id INT NOT NULL,
    cashier_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    purchase_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_ticket_movie
        FOREIGN KEY (movie_id)
        REFERENCES movies(movie_id),

    CONSTRAINT fk_ticket_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_ticket_cashier
        FOREIGN KEY (cashier_id)
        REFERENCES cashiers(cashier_id)
);


INSERT INTO movies VALUES
(1,'Avengers Endgame','Action',350,181),
(2,'Inside Out 2','Animation',280,96),
(3,'John Wick 4','Action',320,169),
(4,'Interstellar','Sci-Fi',300,169),
(5,'The Conjuring','Horror',250,112);


INSERT INTO customers VALUES
(1,'Tristan Bautista','tristan@gmail.com','09171234567'),
(2,'Maria Santos','maria@gmail.com','09181111111'),
(3,'John Cruz','john@gmail.com','09192222222'),
(4,'Ana Reyes','ana@gmail.com','09333333333'),
(5,'Peter Lim','peter@gmail.com','09444444444');


INSERT INTO cashiers VALUES
(1,'Alex','morning'),
(2,'Erica','afternoon'),
(3,'Michael','evening');


INSERT INTO tickets VALUES
(1,1,1,1,'A1','2026-07-15 09:30:00'),
(2,2,2,2,'B5','2026-07-15 11:00:00'),
(3,1,3,1,'A2','2026-07-15 12:00:00'),
(4,4,4,3,'C8','2026-07-16 02:00:00'),
(5,5,5,2,'D1','2026-07-16 04:30:00'),
(6,3,1,3,'A5','2026-07-17 05:30:00');   

-- Challenge 1: Show movie_name and ticket_price

SELECT movie_name, ticket_price
FROM movies;


-- Challenge 2: Show customer_name and email

SELECT customer_name, email
FROM customers;


-- Challenge 3: Display all cashiers

SELECT *
FROM cashiers;


-- Challenge 4: Show cashier_name and shift

SELECT cashier_name, shift
FROM cashiers;


-- Challenge 5: Display all tickets

SELECT *
FROM tickets;


-- Challenge 6: Show all movies sorted by ticket_price (Lowest to Highest)

SELECT *
FROM movies
ORDER BY ticket_price ASC;


-- Challenge 7: Show all movies sorted by ticket_price (Highest to Lowest)

SELECT *
FROM movies
ORDER BY ticket_price DESC;


-- Challenge 8: Show all customers sorted alphabetically by customer_name

SELECT *
FROM customers
ORDER BY customer_name ASC;


-- Challenge 9: Show all tickets sorted by most recent purchase_date

SELECT *
FROM tickets
ORDER BY purchase_date DESC;


-- Challenge 10: Find movies with ticket_price greater than 300

SELECT *
FROM movies
WHERE ticket_price > 300;


-- Challenge 11: Find movies with ticket_price less than or equal to 300

SELECT *
FROM movies
WHERE ticket_price <= 300;


-- Challenge 12: Find all Action movies

SELECT *
FROM movies
WHERE genre = 'Action';


-- Challenge 13: Find movies that are NOT Action

SELECT *
FROM movies
WHERE genre <> 'Action';


-- Challenge 14: Find the customer named Maria Santos

SELECT *
FROM customers
WHERE customer_name = 'Maria Santos';


-- Challenge 15: Find movies with ticket_price between 250 and 320

SELECT *
FROM movies
WHERE ticket_price BETWEEN 250 AND 320;


-- Challenge 16: Find movies with duration between 100 and 180 minutes

SELECT *
FROM movies
WHERE duration_minutes BETWEEN 100 AND 180;


-- Challenge 17: Find movies whose name starts with 'I'

SELECT *
FROM movies
WHERE movie_name LIKE 'I%';


-- Challenge 18: Find movies whose name ends with '4'

SELECT *
FROM movies
WHERE movie_name LIKE '%4';


-- Challenge 19: Find customers whose name contains 'an'

SELECT *
FROM customers
WHERE customer_name LIKE '%an%';


-- Challenge 20: Find customers whose email ends with gmail.com

SELECT *
FROM customers
WHERE email LIKE '%gmail.com';


-- Challenge 21: Find movies whose genre is Action or Sci-Fi

SELECT *
FROM movies
WHERE genre IN ('Action', 'Sci-Fi');


-- Challenge 22: Find cashiers whose shift is morning or evening

SELECT *
FROM cashiers
WHERE shift IN ('morning', 'evening');


-- Challenge 23: Find Action movies with ticket_price greater than 300 and sort by highest price

SELECT *
FROM movies
WHERE genre = 'Action'
AND ticket_price > 300
ORDER BY ticket_price DESC;


-- Challenge 24: Find movies with duration greater than 150 minutes

SELECT *
FROM movies
WHERE duration_minutes > 150;


-- Challenge 25: Find customers whose name starts with 'T'

SELECT *
FROM customers
WHERE customer_name LIKE 'T%';