-- Hotel Reservation System


CREATE DATABASE hotel;
USE hotel;


CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT, 
    room_number VARCHAR(10) NOT NULL, 
    room_type ENUM('Standard', 'Deluxe', 'Suite', 'VIP') DEFAULT 'Standard',
    price_per_night DECIMAL(10, 2) NOT NULL
);

CREATE TABLE guests (
    guest_id INT PRIMARY KEY AUTO_INCREMENT, 
    guest_name VARCHAR(50) NOT NULL, 
    email VARCHAR(50) NOT NULL, 
    phone VARCHAR(20) DEFAULT NULL
); 

CREATE TABLE receptionists ( 
    receptionist_id INT PRIMARY KEY AUTO_INCREMENT, 
    receptionist_name VARCHAR(50) NOT NULL, 
    shift ENUM('morning', 'afternoon', 'evening') DEFAULT 'morning'
); 

CREATE TABLE reservations ( 
    reservation_id INT PRIMARY KEY AUTO_INCREMENT, 
    room_id INT NOT NULL, 
    guest_id INT NOT NULL, 
    receptionist_id INT NOT NULL, 
    check_in DATETIME NOT NULL, 
    check_out DATETIME NOT NULL, 

    CONSTRAINT fk_reservations_room_id 
        FOREIGN KEY (room_id)
        REFERENCES rooms(room_id), 

    CONSTRAINT fk_reservations_guest_id
        FOREIGN KEY (guest_id)
        REFERENCES guests(guest_id), 

    CONSTRAINT fk_reservations_receptionist_id
        FOREIGN KEY (receptionist_id)
        REFERENCES receptionists(receptionist_id)
); 


INSERT INTO rooms VALUES
(1, '101', 'Standard', 1800.00),
(2, '102', 'Deluxe', 2500.00),
(3, '201', 'Suite', 4500.00),
(4, '202', 'Standard', 1800.00),
(5, '301', 'VIP', 8500.00); 

INSERT INTO guests VALUES
(1, 'Tristan Bautista', 'tristan@gmail.com', '09171234567'),
(2, 'Maria Santos', 'maria@gmail.com', '09181111111'),
(3, 'John Cruz', 'john@gmail.com', '09192222222'),
(4, 'Ana Reyes', 'ana@gmail.com', '09333333333'),
(5, 'Peter Lim', 'peter@gmail.com', '09444444444');

INSERT INTO receptionists VALUES
(1, 'Alex', 'morning'),
(2, 'Erica', 'afternoon'),
(3, 'Michael', 'evening');

INSERT INTO reservations VALUES
(1, 1, 1, 1, '2026-07-20 14:00:00', '2026-07-22 12:00:00'),
(2, 2, 2, 2, '2026-07-21 14:00:00', '2026-07-24 12:00:00'),
(3, 3, 3, 1, '2026-07-22 14:00:00', '2026-07-25 12:00:00'),
(4, 4, 4, 3, '2026-07-23 14:00:00', '2026-07-24 12:00:00'),
(5, 5, 5, 2, '2026-07-25 14:00:00', '2026-07-28 12:00:00'), 
(6, 2, 1, 3, '2026-07-30 14:00:00', '2026-08-02 12:00:00');


SELECT * FROM reservations;
select * from guests; 