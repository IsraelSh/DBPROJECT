--This procedure updates the duration of a movie and logs a message. It uses DML commands, loops, and exception handling.

CREATE OR REPLACE PROCEDURE update_movie_duration(
  p_film_code IN INTEGER,
  p_new_duration IN INTEGER
) IS
  old_duration MOVIE.duration%TYPE;
BEGIN
  SELECT duration INTO old_duration FROM MOVIE WHERE film_code = p_film_code;
  
  UPDATE MOVIE
  SET duration = p_new_duration
  WHERE film_code = p_film_code;
  
  DBMS_OUTPUT.PUT_LINE('Updated movie duration from ' || old_duration || ' to ' || p_new_duration);
  COMMIT;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Movie with this code does not exist.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred.');
    ROLLBACK;
END update_movie_duration;
/
