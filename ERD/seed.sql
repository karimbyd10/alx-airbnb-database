-- ==========================================
-- Seed Users
-- ==========================================
INSERT INTO Users (first_name, last_name, email, password_hash, phone_number)
VALUES
('Alice', 'Smith', 'alice.smith@example.com', 'hashedpassword1', '555-1234'),
('Bob', 'Johnson', 'bob.johnson@example.com', 'hashedpassword2', '555-5678'),
('Charlie', 'Brown', 'charlie.brown@example.com', 'hashedpassword3', '555-9012'),
('Diana', 'Prince', 'diana.prince@example.com', 'hashedpassword4', '555-3456');

-- ==========================================
-- Seed Properties
-- ==========================================
INSERT INTO Properties (host_id, title, description, address, city, state, country, postal_code, price_per_night, max_guests)
VALUES
(1, 'Cozy Apartment Downtown', 'A beautiful 2-bedroom apartment in the city center.', '123 Main St', 'Casablanca', 'Casablanca-Settat', 'Morocco', '20000', 50.00, 4),
(2, 'Beachfront Villa', 'Luxury villa with ocean view.', '456 Beach Rd', 'Agadir', 'Souss-Massa', 'Morocco', '80000', 120.00, 8),
(1, 'Mountain Cabin', 'Secluded cabin in the Atlas mountains.', '789 Mountain Trail', 'Marrakech', 'Marrakech-Safi', 'Morocco', '40000', 80.00, 6);

-- ==========================================
-- Seed Bookings
-- ==========================================
INSERT INTO Bookings (property_id, user_id, start_date, end_date, total_price, status)
VALUES
(1, 2, '2025-11-10', '2025-11-15', 250.00, 'confirmed'),
(2, 3, '2025-12-01', '2025-12-07', 840.00, 'pending'),
(3, 4, '2025-11-20', '2025-11-25', 400.00, 'confirmed');

-- ==========================================
-- Seed Payments
-- ==========================================
INSERT INTO Payments (booking_id, amount, payment_method, status)
VALUES
(1, 250.00, 'credit_card', 'completed'),
(2, 840.00, 'paypal', 'pending'),
(3, 400.00, 'bank_transfer', 'completed');

-- ==========================================
-- Seed Reviews
-- ==========================================
INSERT INTO Reviews (property_id, user_id, rating, comment)
VALUES
(1, 2, 5, 'Excellent stay! Very clean and central.'),
(2, 3, 4, 'Beautiful villa, but a bit far from town.'),
(3, 4, 5, 'Amazing mountain views and cozy cabin.');

-- ==========================================
-- Seed Property_Amenities
-- ==========================================
INSERT INTO Property_Amenities (property_id, amenity)
VALUES
(1, 'WiFi'),
(1, 'Air Conditioning'),
(1, 'Kitchen'),
(2, 'Pool'),
(2, 'WiFi'),
(2, 'Parking'),
(3, 'Fireplace'),
(3, 'WiFi'),
(3, 'Kitchen');

