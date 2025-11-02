# ALX Airbnb Database - Database Script 0x01

This directory contains the SQL schema for the **Airbnb-style database**. It defines all tables, relationships, constraints, and indexes for optimal performance.

## Tables Overview

### 1. Users
Stores information about users (guests and hosts).

- **Columns:**
  - `user_id` (PK)
  - `first_name`, `last_name`, `email` (unique)
  - `password_hash`, `phone_number`
  - `created_at`, `updated_at`
- **Indexes:** `idx_users_email` for faster email lookups.

---

### 2. Properties
Stores details about properties listed by hosts.

- **Columns:**
  - `property_id` (PK)
  - `host_id` (FK → Users.user_id)
  - `title`, `description`, `address`, `city`, `state`, `country`, `postal_code`
  - `price_per_night`, `max_guests`
  - `created_at`, `updated_at`
- **Indexes:** `idx_properties_city_price` for faster searches by city and price.

---

### 3. Bookings
Tracks all bookings made by users.

- **Columns:**
  - `booking_id` (PK)
  - `property_id` (FK → Properties.property_id)
  - `user_id` (FK → Users.user_id)
  - `start_date`, `end_date`, `total_price`
  - `status` (ENUM: 'pending', 'confirmed', 'cancelled')
  - `created_at`, `updated_at`
- **Constraints:** `CHECK (start_date < end_date)`
- **Indexes:** `idx_bookings_user_dates` for quick lookup by user and booking dates.

---

### 4. Payments
Stores payment information for bookings.

- **Columns:**
  - `payment_id` (PK)
  - `booking_id` (FK → Bookings.booking_id)
  - `amount`, `payment_method` (ENUM: 'credit_card', 'paypal', 'bank_transfer')
  - `payment_date`, `status` (ENUM: 'pending', 'completed', 'failed')
- **Indexes:** `idx_payments_booking` for faster lookup by booking.

---

### 5. Reviews
Stores user reviews for properties.

- **Columns:**
  - `review_id` (PK)
  - `property_id` (FK → Properties.property_id)
  - `user_id` (FK → Users.user_id)
  - `rating` (1–5), `comment`
  - `created_at`
- **Indexes:** `idx_reviews_property` for fast property review queries.

---

### 6. Property_Amenities
Lists amenities available for each property.

- **Columns:**
  - `property_id` (FK → Properties.property_id)
  - `amenity`
- **Primary Key:** Composite key (`property_id`, `amenity`)
- **Indexes:** `idx_amenities_amenity` for searching properties by amenity.

---

## Relationships

- **Users → Properties:** One-to-many (a host can have multiple properties)
- **Users → Bookings:** One-to-many (a user can have multiple bookings)
- **Properties → Bookings:** One-to-many (a property can have multiple bookings)
- **Bookings → Payments:** One-to-one (each booking has one payment)
- **Properties → Reviews:** One-to-many (a property can have multiple reviews)
- **Users → Reviews:** One-to-many (a user can write multiple reviews)
- **Properties → Property_Amenities:** One-to-many (a property can have multiple amenities)

---

## Indexes for Performance

- **Users:** `email` for fast authentication and searches.
- **Properties:** `(city, price_per_night)` for property filtering.
- **Bookings:** `(user_id, start_date, end_date)` for user booking queries.
- **Payments:** `booking_id` to quickly check payment status.
- **Reviews:** `property_id` for review aggregation.
- **Property_Amenities:** `amenity` to filter properties by amenities.

---

This schema is designed following **3NF (Third Normal Form)** to eliminate redundancy and ensure data integrity.

