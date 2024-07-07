PL/SQL Developer Test script 3.0
19
--This main program calls the calculate_room_revenue function and the update_movie_duration procedure. It handles exceptions and outputs results.

BEGIN
  DECLARE
    room_id INTEGER := 1;
    film_code INTEGER := 100;
    new_duration INTEGER := 150;
    total_revenue NUMBER;
  BEGIN
    total_revenue := calculate_room_revenue(room_id);
    DBMS_OUTPUT.PUT_LINE('Total revenue for room ' || room_id || ': ' || total_revenue);

    update_movie_duration(film_code, new_duration);
    DBMS_OUTPUT.PUT_LINE('Updated duration for film code ' || film_code || ' to ' || new_duration);
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred in the main program.');
  END;
END;
0
0
