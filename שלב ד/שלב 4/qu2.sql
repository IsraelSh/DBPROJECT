--movie category revenue 
SELECT 
    category,
    SUM(ticket_price) AS total_revenue
FROM 
    MOVIE_TICKET_OVERVIEW
GROUP BY 
    category
ORDER BY 
    total_revenue DESC;
