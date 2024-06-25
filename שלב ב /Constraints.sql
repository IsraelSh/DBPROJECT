--1
ALTER TABLE movie
MODIFY (categorie VARCHAR(20) DEFAULT 'Unknown');

--requires that the price is not negative
ALTER TABLE ticket
ADD CONSTRAINT check_price_non_negative CHECK (price >= 0);

--not NULL 
ALTER TABLE cinema_room
MODIFY (room_number INT NOT NULL);
