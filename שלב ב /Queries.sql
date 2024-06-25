--Calculate the occupancy rate for each cinema room as well as ticket sold
SELECT 
    cr.names AS cinema_room,
    cr.room_number,
    COUNT(t.identifying_number) AS tickets_sold,
    total_seats,
    CASE 
        WHEN total_seats = 0 THEN 0
        ELSE (COUNT(t.identifying_number) * 100.0 / total_seats)
    END AS occupancy_rate
FROM 
    cinema_room cr
JOIN 
    movie m ON cr.room_number = m.room_number
JOIN 
    ticket t ON m.film_code = t.film_code
JOIN 
    (SELECT room_number, COUNT(*) AS total_seats
     FROM seat
     GROUP BY room_number) s ON cr.room_number = s.room_number
GROUP BY 
    cr.room_number, cr.names, total_seats
ORDER BY 
    occupancy_rate DESC;



--Find the total revenue generated from ticket sales per movie category on specific dates, ordered by revenue
SELECT  
    m.categorie AS category,
    SUM(t.price) AS total_revenue
FROM 
    movie m
JOIN 
    ticket t ON m.film_code = t.film_code
JOIN 
    projector_employee pe ON m.projector_code = pe.projector_code
WHERE 
    pe.dates BETWEEN to_date('01-01-2023 20:30:37', 'dd-mm-yyyy hh24:mi:ss') AND to_date('01-01-2024 20:30:37', 'dd-mm-yyyy hh24:mi:ss')
GROUP BY 
     m.categorie 
ORDER BY 
    total_revenue DESC;



--receipt price according to movie duration
SELECT 
    m.duration AS movie_duration,
    SUM(f.price) AS total_receipt_price
FROM 
    food f
JOIN 
    ticket t ON f.identifying_number = t.identifying_number
JOIN 
    movie m ON t.film_code = m.film_code
GROUP BY 
    m.duration
ORDER BY 
    m.duration;



--number of projections that happened between 2023 and 2024 in each room
SELECT 
    COUNT(pe.projector_code) AS number_of_projections,
    pe.room_numbeer AS room_number
FROM 
    projector_employee pe
WHERE 
    pe.dates BETWEEN to_date('01-01-2023 20:30:37', 'dd-mm-yyyy hh24:mi:ss') AND to_date('01-01-2024 20:30:37', 'dd-mm-yyyy hh24:mi:ss')
GROUP BY 
    pe.room_numbeer
ORDER BY 
    number_of_projections DESC;




--Delete All Tickets for a Specific Movie Category
DELETE FROM ticket
WHERE film_code IN (
    SELECT film_code
    FROM movie
    WHERE categorie = 'Action'
);

--Delete specific type of food
DELETE FROM food
WHERE food_items LIKE '%coke%';


--Update and Replace specific type of food
UPDATE food
SET food_items = REPLACE(food_items, 'coke', 'soda')
WHERE food_items LIKE '%coke%';


-- Update cinema room number
UPDATE projector_employee
SET room_numbeer = 5
WHERE room_numbeer = 1;

