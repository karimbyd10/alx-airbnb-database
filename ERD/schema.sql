-- ========================================
-- Airbnb Database Schema - 3NF
-- ========================================

-- -------------------------
-- Users Table
-- -------------------------
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

-- Index for fast email lookup
CREATE INDEX idx_users_email ON Users(email);

-- -------------------------
-- Properties Table
-- -------------------------
CREATE TABLE IF NOT EXISTS Properties (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT NOT NULL,
    street VARCHAR(150) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    country VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Index for city-based searches
CREATE INDEX idx_properties_city ON Properties(city);

-- -------------------------
-- Bookings Table
-- -------------------------
CREATE TABLE IF NOT EXISTS Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT chk_booking_dates CHECK (end_date > start_date)
);

-- Index for searching bookings by user
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
-- Index for searching bookings by property
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- -------------------------
-- Payments Table
-- -------------------------
CREATE TABLE IF NOT EXISTS Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status ENUM('pending', 'completed', 'failed') NOT NULL DEFAULT 'pending',
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Index for searching payments by status
CREATE INDEX idx_payments_status ON Payments(payment_status);

