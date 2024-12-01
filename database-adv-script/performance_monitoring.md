EXPLAIN ANALYZE
SELECT * 
FROM Booking 
WHERE property_id = 'some-uuid';

EXPLAIN ANALYZE
SELECT p.property_id, p.name, COUNT(b.booking_id) AS total_bookings
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id;

EXPLAIN ANALYZE
SELECT u.user_id, u.first_name, u.last_name, b.start_date, b.end_date
FROM User u
JOIN Booking b ON u.user_id = b.user_id
WHERE b.status = 'confirmed';
-- Adding an index on property_id in the Booking table
CREATE INDEX idx_property_id ON Booking (property_id);

-- Adding a composite index on user_id and status for faster user-based booking queries
CREATE INDEX idx_user_status ON Booking (user_id, status);

-- Adding an index on booking_id in the Payment table
CREATE INDEX idx_booking_id ON Payment (booking_id);

