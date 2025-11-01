-- =========================================
-- ALX Airbnb Database - Complex Joins
-- File: joins_queries.sql
-- =========================================

-- 1. INNER JOIN: Retrieve all bookings and the users who made them
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.name AS user_name,
    u.email
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.user_id;

-- =========================================

-- 2. LEFT JOIN: Retrieve all properties and their reviews,
-- including properties with no reviews
SELECT 
    p.property_id,
    p.title AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM 
    properties p
LEFT JOIN 
    reviews r ON p.property_id = r.property_id;

-- =========================================

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings
-- including users without bookings and bookings without linked users
-- MySQL workaround using UNION of LEFT JOIN and RIGHT JOIN

SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM 
    users u
LEFT JOIN 
    bookings b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM 
    users u
RIGHT JOIN 
    bookings b ON u.user_id = b.user_id;

