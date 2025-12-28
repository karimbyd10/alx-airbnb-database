-- =========================
-- Users
-- =========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Karim', 'Byd', 'karim@example.com', 'hash_pass_1', '0612345678', 'host'),
('22222222-2222-2222-2222-222222222222', 'Amina', 'El Amrani', 'amina@example.com', 'hash_pass_2', '0623456789', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Youssef', 'Benali', 'youssef@example.com', 'hash_pass_3', NULL, 'guest');

-- =========================
-- Properties
-- =========================
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1',
 '11111111-1111-1111-1111-111111111111',
 'Modern Apartment Casablanca',
 'A fully furnished modern apartment in the city center.',
 'Casablanca, Morocco',
 80.00),

('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2',
 '11111111-1111-1111-1111-111111111111',
 'Traditional Riad Marrakech',
 'Authentic riad with traditional Moroccan decor.',
 'Marrakech, Morocco',
 150.00);

-- =========================
-- Bookings
-- =========================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1',
 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1',
 '22222222-2222-2222-2222-222222222222',
 '2025-03-01',
 '2025-03-05',
 320.00,
 'confirmed'),

('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2',
 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2',
 '33333333-3333-3333-3333-333333333333',
 '2025-04-10',
 '2025-04-13',
 450.00,
 'pending');

-- =========================
-- Payments
-- =========================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('ccccccc1-cccc-cccc-cccc-ccccccccccc1',
 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1',
 320.00,
 'credit_card');

-- =========================
-- Reviews
-- =========================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('ddddddd1-dddd-dddd-dddd-dddddddddddd1',
 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1',
 '22222222-2222-2222-2222-222222222222',
 5,
 'Excellent location and very clean apartment.');

-- =========================
-- Messages
-- =========================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1',
 '22222222-2222-2222-2222-222222222222',
 '11111111-1111-1111-1111-111111111111',
 'Hello, is early check-in possible?'),

('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2',
 '11111111-1111-1111-1111-111111111111',
 '22222222-2222-2222-2222-222222222222',
 'Yes, early check-in is available.');

