-- performance.sql
-- Initial query before optimization

SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.total_amount,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.status AS payment_status
FROM Booking b
JOIN Users u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
JOIN Payment pay ON pay.booking_id = b.id;

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.total_amount,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM Booking b
JOIN Users u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
JOIN Payment pay ON pay.booking_id = b.id;

CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_payment_booking ON Payment(booking_id);

SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM Booking b
JOIN Users u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
JOIN Payment pay ON pay.booking_id = b.id
WHERE b.start_date >= '2025-01-01'
  AND b.start_date <= '2025-12-31';

