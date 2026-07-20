-- Library Management System

create database library; 
use library; 


-- table for books
create table books (
book_id int primary key auto_increment, 
title varchar(50) not null, 
author varchar(50) not null

); 

-- table for members
create table members ( 
member_id int primary key auto_increment,
member_name varchar(50) not null,
contact_number varchar(15) not null
); 


-- table for libnarians
 create table librarians (
librarian_id int primary key auto_increment,
librarian_name varchar(50) not null
);


create tables borrow_records (

    borrowrecord_id INT PRIMARY KEY AUTO_INCREMENT,

    book_id INT NOT NULL,
    member_id INT NOT NULL,
    librarian_id INT NOT NULL,
    
    borrow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    return_date DATETIME,

    CONSTRAINT fk_borrow_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id),

    CONSTRAINT fk_borrow_member
        FOREIGN KEY (member_id)
        REFERENCES members(member_id),

    CONSTRAINT fk_borrow_librarian
        FOREIGN KEY (librarian_id)
        REFERENCES librarians(librarian_id)

);