--1
DECLARE
  v_start_date DATE := TO_DATE('01-01-2023 20:30:37', 'dd-mm-yyyy hh24:mi:ss');
  v_end_date DATE := TO_DATE('01-01-2024 20:30:37', 'dd-mm-yyyy hh24:mi:ss');
BEGIN
  FOR rec IN (
    SELECT 
      COUNT(pe.projector_code) AS number_of_projections,
      pe.room_numbeer AS room_number
    FROM 
      projector_employee pe
    WHERE 
      pe.dates BETWEEN v_start_date AND v_end_date
    GROUP BY 
      pe.room_numbeer
    ORDER BY 
      number_of_projections DESC
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Room Number: ' || rec.room_number || ', Number of Projections: ' || rec.number_of_projections);
  END LOOP;
END;


--2
DECLARE
  v_start_date DATE := TO_DATE('01-01-2023 20:30:37', 'dd-mm-yyyy hh24:mi:ss');
  v_end_date DATE := TO_DATE('01-01-2024 20:30:37', 'dd-mm-yyyy hh24:mi:ss');
BEGIN
  FOR rec IN (
    SELECT  
      m.categorie AS category,
      SUM(t.price) AS total_revenue
    FROM 
      movie m
    JOIN 
      ticket t ON m.film_code = t.film_code
    JOIN 
      projector_employee pe ON m.film_code = pe.projector_code
    WHERE 
      pe.dates BETWEEN v_start_date AND v_end_date
    GROUP BY 
      m.categorie 
    ORDER BY 
      total_revenue DESC
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Category: ' || rec.category || ', Total Revenue: ' || rec.total_revenue);
  END LOOP;
END;

--3
DECLARE
BEGIN
  FOR rec IN (
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
      m.duration
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Movie Duration: ' || rec.movie_duration || ', Total Receipt Price: ' || rec.total_receipt_price);
  END LOOP;
END;

--4
DECLARE
  v_start_date DATE := TO_DATE('01-01-2023 20:30:37', 'dd-mm-yyyy hh24:mi:ss');
  v_end_date DATE := TO_DATE('01-01-2024 20:30:37', 'dd-mm-yyyy hh24:mi:ss');
BEGIN
  FOR rec IN (
    SELECT 
      COUNT(pe.projector_code) AS number_of_projections,
      pe.room_numbeer AS room_number
    FROM 
      projector_employee pe
    WHERE 
      pe.dates BETWEEN v_start_date AND v_end_date
    GROUP BY 
      pe.room_numbeer
    ORDER BY 
      number_of_projections DESC
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Room Number: ' || rec.room_number || ', Number of Projections: ' || rec.number_of_projections);
  END LOOP;
END;
