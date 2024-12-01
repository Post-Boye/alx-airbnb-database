SELECT 
    user_id, 
    COUNT(booking_id) AS total_bookings
FROM 
    Booking
GROUP BY 
    user_id;

WITH PropertyBookingCounts AS (
    SELECT
        property_id,
        COUNT(booking_id) AS total_bookings
    FROM
        Booking
    GROUP BY
        property_id
)
SELECT
    property_id,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS rank
FROM
    PropertyBookingCounts;

