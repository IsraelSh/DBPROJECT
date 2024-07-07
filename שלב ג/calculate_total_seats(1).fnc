--Function 1
--This function calculates the total number of seats in a given room.

CREATE OR REPLACE FUNCTION calculate_total_seats(room_id IN INTEGER) RETURN INTEGER IS
  total_seats INTEGER := 0;
  CURSOR seat_cursor IS
    SELECT COUNT(*) AS seat_count
    FROM SEAT
    WHERE room_number = room_id;
BEGIN
  OPEN seat_cursor;
  FETCH seat_cursor INTO total_seats;
  CLOSE seat_cursor;
  RETURN total_seats;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
  WHEN OTHERS THEN
    RETURN -1;
END calculate_total_seats;
/
