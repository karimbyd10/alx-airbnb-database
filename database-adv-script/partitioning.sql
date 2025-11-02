-- partitioning.sql
-- Objective: Implement partitioning on the Booking table based on start_date

-- 1. Backup existing table (optional but recommended)
CREATE TABLE Booking_backup AS
SELECT * FROM Booking;

-- 2. Drop the old Booking table
DROP TABLE IF EXISTS Booking CASCADE;

-- 3. Create a new partitioned Booking table
CREATE TABLE Booking (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    status VARCHAR(50)
) PARTITION BY RANGE (start_date);

-- 4. Create partitions by year (you can adjust these as needed)
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 5. (Optional) Default partition for future data
CREATE TABLE Booking_default PARTITION OF Booking
    DEFAULT;

-- 6. Recreate foreign keys and indexes for better performance
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_start_date ON Booking (start_date);

-- 7. Insert back the data from backup
INSERT INTO Booking (id, user_id, property_id, start_date, end_date, total_amount, status)
SELECT id, user_id, property_id, start_date, end_date, total_amount, status
FROM Booking_backup;

-- 8. Verify partitions
SELECT tableoid::regclass AS partition, COUNT(*) 
FROM Booking
GROUP BY partition;

