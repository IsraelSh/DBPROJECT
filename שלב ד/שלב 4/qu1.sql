--movie for a room number
SELECT 
    movie_name,
    show_time,
    ticket_price
FROM 
    MOVIE_TICKET_OVERVIEW
WHERE 
    room_number = 1
ORDER BY 
    show_time;
