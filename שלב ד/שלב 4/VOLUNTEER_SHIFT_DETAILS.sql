CREATE OR REPLACE VIEW VOLUNTEER_SHIFT_DETAILS AS
SELECT 
    v.volunteer_id,
    v.name AS volunteer_name,
    v.phone_number,
    s.shift_id,
    s.start_date_time,
    s.end_date_time,
    b.base_id,
    b.location AS base_location,
    b.description AS base_description
FROM 
    VOLUNTEERS v
JOIN 
    SIGNED_UP su ON v.volunteer_id = su.volunteer_id
JOIN 
    SHIFTS s ON su.shift_id = s.shift_id
JOIN 
    BASE b ON s.base_id = b.base_id;
