-- Count Volunteers per Base
SELECT 
    base_location,
    COUNT(DISTINCT volunteer_id) AS volunteer_count
FROM 
    VOLUNTEER_SHIFT_DETAILS
GROUP BY 
    base_location
ORDER BY 
    volunteer_count DESC;
