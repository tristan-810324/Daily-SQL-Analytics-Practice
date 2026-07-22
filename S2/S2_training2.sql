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



-- Challenge 1: Show room_number and price_per_night

	select room_number, price_per_night from rooms; 

-- Challenge 2: Show guest_name and email

	select guest_name, email from guests; 
    
-- Challenge 3: Display all receptionists
	
    select * from receptionists;

-- Challenge 4: Show receptionist_name and shift
     
     select receptionist_name, shift from receptionists; 

-- Challenge 5: Display all reservations

	select * from reservations; 
    
-- Challenge 6: Show all rooms sorted by price_per_night (Lowest to Highest)
	
	select * from rooms
    order by price_per_night asc; 


-- Challenge 7: Show all rooms sorted by price_per_night (Highest to Lowest)
	
    select  * from rooms 
    order by  price_per_night desc; 

-- Challenge 8: Show all guests sorted alphabetically by guest_name
	
	select * from guests
    order by guest_name asc; 

-- Challenge 9: Show all reservations sorted by check_in (Newest to Oldest)

	select * from reservations 
    order by check_in  desc;
   
-- Challenge 10: Find rooms with price_per_night greater than 2000

	select * from rooms
	where  price_per_night > 2000; 

-- Challenge 11: Find rooms with price_per_night less than or equal to 2500 to lowest use descending 
    
    select * from  rooms
	where  price_per_night <= 2500
    order by price_per_night desc;

-- Challenge 12: Find all Standard rooms

	select * from rooms 
    where room_type = "standard"; 

-- Challenge 13: Find rooms that are NOT Deluxe

	select * from rooms 
    where room_type <> 'deluxe'; 

-- Challenge 14: Find the guest named Maria Santos
	
    select * from guests 
    where guest_name = "maria santos";  

-- Challenge 15: Find rooms with price_per_night between 1800 and 4500
	
    select * from rooms 
    where price_per_night 
    between 1800 and 4500; 
	
-- Challenge 16: Find reservations with check_in between '2026-07-21' and '2026-07-24'
		
	select * from reservations 
    where check_in 
	between '2026-07-21' and '2026-07-24'; 
    
-- Challenge 17: Find guests whose name starts with 'A'
	
    select * from guests 
    where guest_name
	like 'A%';

-- Challenge 18: Find rooms whose room_number ends with '1'
 
	select * from rooms 
    where room_number 
    like '%1';

-- Challenge 19: Find guests whose name contains 'an'
	
    select  * from guests 
    where guest_name
    like '%an%';

-- Challenge 20: Find guests whose email ends with gmail.com
	
    select * from guests 
    where email
    like '%gmail.com'; 
    
-- Challenge 21: Find rooms whose room_type is Standard or Suite
	
    

-- Challenge 22: Find receptionists whose shift is morning or evening

-- Challenge 23: Find Standard rooms with price_per_night less than 2000 and sort by price_per_night ascending

-- Challenge 24: Find rooms with price_per_night greater than 3000

-- Challenge 25: Find guests whose name starts with 'T'