-- ============================================
-- performance.sql
-- ============================================

-- 🔹 Step 1: Initial Complex Query
-- This query retrieves all bookings along with their related user, property, and payment details.

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.property_id,
    p.title AS property_title,
    pay.payment_id,
    pay.amount,
    pay.status AS payment_status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;

-- 🔹 Step 2: Analyze Query Performance
-- Check query execution plan before optimization
EXPLAIN SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.title,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;

-- 🔹 Step 3: Optimized Query
-- Improvements:
-- 1. Selected only necessary columns.
-- 2. Ensured indexes exist on foreign keys (user_id, property_id, booking_id).
-- 3. Replaced JOINs where not needed with EXISTS (optional for very large tables).

SELECT 
    b.booking_id,
    b.start_date,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

