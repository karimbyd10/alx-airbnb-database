# Airbnb Database Schema

## Objective
This directory contains SQL scripts that define the database schema for an Airbnb-like application. The schema is designed following relational database best practices, including normalization, constraints, and indexing for performance.

---

## Tables Overview

### locations
Stores city and country information to avoid duplication across users and properties.

### users
Stores user account information.
- Each user belongs to a location
- Email is unique

### properties
Represents rental properties.
- Linked to a host (user)
- Linked to a location

### bookings
Stores booking records.
- Enforces valid date ranges
- Tracks booking status

### reviews
Stores user reviews for properties.
- One review per user per property
- Rating constrained between 1 and 5

### amenities
Stores available amenities (e.g., WiFi, Parking)

### property_amenities
Join table for the many-to-many relationship between properties and amenities

---

## Constraints Used

- Primary keys for entity integrity
- Foreign keys for referential integrity
- UNIQUE constraints to prevent duplication
- CHECK constraints for data validation
- ENUM for controlled booking status values

---

## Indexes

Indexes were added to frequently queried columns such as:
- User email
- Foreign keys in properties, bookings, and reviews

These indexes improve query performance and scalability.

---

## Conclusion

The schema is fully normalized (3NF compliant), enforces data integrity through constraints, and is optimized for performance using indexes. It provides a solid foundation for an Airbnb-style application.

