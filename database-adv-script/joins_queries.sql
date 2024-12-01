SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM 
    Booking
INNER JOIN 
    User 
ON 
    Booking.user_id = User.user_id;


SELECT
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Review.review_id,
    Review.rating,
    Review.comment
FROM
    Property
LEFT JOIN
    Review
ON
    Property.property_id = Review.property_id;


SELECT
    User.user_id AS user_id,
    User.first_name AS user_name,
    Booking.booking_id AS booking_id,
    Booking.start_date,
    Booking.end_date
FROM
    User
FULL OUTER JOIN
    Booking
ON
    User.user_id = Booking.user_id;

SELECT
    User.user_id AS user_id,
    User.first_name AS user_name,
    Booking.booking_id AS booking_id,
    Booking.start_date,
    Booking.end_date
FROM
    User
LEFT JOIN
    Booking
ON
    User.user_id = Booking.user_id
UNION
SELECT
    User.user_id AS user_id,
    User.first_name AS user_name,
    Booking.booking_id AS booking_id,
    Booking.start_date,
    Booking.end_date
FROM
    Booking
LEFT JOIN
    User
ON
    Booking.user_id = User.user_id;

