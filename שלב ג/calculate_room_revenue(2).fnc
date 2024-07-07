--This function calculates the total revenue from ticket sales for a specific room. It uses an explicit cursor and handles exceptions.

CREATE OR REPLACE FUNCTION calculate_room_revenue(room_id IN INTEGER) RETURN NUMBER IS
  total_revenue NUMBER := 0;
  CURSOR ticket_cursor IS
    SELECT t.price
    FROM TICKET t
    JOIN MOVIE m ON t.film_code = m.film_code
    WHERE m.room_number = room_id;
  ticket_price TICKET.price%TYPE;
BEGIN
  OPEN ticket_cursor;
  LOOP
    FETCH ticket_cursor INTO ticket_price;
    EXIT WHEN ticket_cursor%NOTFOUND;
    total_revenue := total_revenue + ticket_price;
  END LOOP;
  CLOSE ticket_cursor;
  RETURN total_revenue;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
  WHEN OTHERS THEN
    RETURN -1;
END calculate_room_revenue;
/
