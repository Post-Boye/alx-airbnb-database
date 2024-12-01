-- Step 1: Create a new partitioned Booking table
CREATE TABLE Booking_Partitioned (
    booking_id UUID NOT NULL,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- Step 2: Define partitions for the table based on start_date
CREATE TABLE Booking_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_Older PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('1900-01-01') TO ('2023-01-01');


	-- Step 3: Insert data into the partitioned table
INSERT INTO Booking_Partitioned (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
SELECT booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
FROM Booking;

-- Query on the original table
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

-- Query on the partitioned table
EXPLAIN ANALYZE
SELECT *
FROM Booking_Partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

