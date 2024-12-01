INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    ('uuid-guest-1', 'Alice', 'Johnson', 'alice@example.com', 'hash123', '1234567890', 'guest', NOW()),
    ('uuid-host-1', 'Bob', 'Smith', 'bob@example.com', 'hash456', '0987654321', 'host', NOW()),
    ('uuid-admin-1', 'Charlie', 'Brown', 'charlie@example.com', 'hash789', NULL, 'admin', NOW());


INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
    ('uuid-property-1', 'uuid-host-1', 'Cozy Cabin', 'A small cozy cabin in the woods.', 'Woodland, USA', 120.00, NOW(), NOW()),
    ('uuid-property-2', 'uuid-host-1', 'Beachside Bungalow', 'A bungalow with a stunning beach view.', 'Malibu, USA', 250.00, NOW(), NOW());
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status, created_at)
VALUES
    ('uuid-booking-1', 'uuid-property-1', 'uuid-guest-1', '2024-12-10', '2024-12-15', 'confirmed', NOW()),
    ('uuid-booking-2', 'uuid-property-2', 'uuid-guest-1', '2024-12-20', '2024-12-25', 'pending', NOW());

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('uuid-payment-1', 'uuid-booking-1', 600.00, NOW(), 'credit_card');

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('uuid-review-1', 'uuid-property-1', 'uuid-guest-1', 5, 'Absolutely loved the cabin! Will visit again.', NOW()),
    ('uuid-review-2', 'uuid-property-2', 'uuid-guest-1', 4, 'The view was amazing, but the place needed better cleaning.', NOW());

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('uuid-message-1', 'uuid-guest-1', 'uuid-host-1', 'Hi, is the beachside bungalow available on the 20th?', NOW()),
    ('uuid-message-2', 'uuid-host-1', 'uuid-guest-1', 'Yes, it is available. Let me know if you want to book.', NOW());

