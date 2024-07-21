CREATE OR REPLACE FUNCTION get_random_base_id RETURN INTEGER IS
  random_base_id INTEGER;
BEGIN
  SELECT base_id
  INTO random_base_id
  FROM (
    SELECT base_id
    FROM BASE
    ORDER BY DBMS_RANDOM.VALUE
  )
  WHERE ROWNUM = 1;

  RETURN random_base_id;
END;

BEGIN
  FOR rec IN (SELECT room_number FROM CINEMA_ROOM) LOOP
    UPDATE CINEMA_ROOM
    SET base_id = get_random_base_id()
    WHERE room_number = rec.room_number;
  END LOOP;
  COMMIT;
END;
/
