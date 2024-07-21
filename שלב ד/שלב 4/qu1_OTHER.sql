--List Volunteers and Their previous Shifts with Base Information

SELECT 
    volunteer_name,
    phone_number,
    start_date_time,
    end_date_time,
    base_location,
    base_description
FROM 
    VOLUNTEER_SHIFT_DETAILS
WHERE 
    start_date_time < SYSDATE
ORDER BY 
    start_date_time;
