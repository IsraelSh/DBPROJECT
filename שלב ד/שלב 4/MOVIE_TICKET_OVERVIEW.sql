/*
Cinema Manager
Use Case:

Revenue Tracking: The manager can use the view to track ticket sales revenue for each movie.
Movie Performance Analysis: By analyzing which movies generate the most revenue, the manager can make informed decisions about future screenings and movie selections.
Scheduling: The manager can ensure that popular movies are scheduled at optimal times to maximize attendance and revenue.
*/
CREATE OR REPLACE VIEW MOVIE_TICKET_OVERVIEW AS
SELECT 
    m.film_code,
    m.names AS movie_name,
    m.duration,
    m.categorie AS category,
    m.room_number,
    t.identifying_number AS ticket_id,
    t.hours AS show_time,
    t.seat AS seat_number,
    t.price AS ticket_price
FROM 
    MOVIE m
JOIN 
    TICKET t ON m.film_code = t.film_code;
