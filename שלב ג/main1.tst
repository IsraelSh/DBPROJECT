PL/SQL Developer Test script 3.0
19
--Main Program 1
--Calls the calculate_total_seats function and the update_food_prices procedure.


BEGIN
  DECLARE
    room_id INTEGER := 1;
    total_seats INTEGER;
  BEGIN
    total_seats := calculate_total_seats(room_id);
    DBMS_OUTPUT.PUT_LINE('Total seats in room ' || room_id || ': ' || total_seats);

    update_food_prices(10);
    DBMS_OUTPUT.PUT_LINE('Food prices updated by 10%.');
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred in the main program.');
  END;
END;
0
0
