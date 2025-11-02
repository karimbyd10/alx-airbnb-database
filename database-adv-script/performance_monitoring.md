# Database Performance Monitoring

## 1. Queries Monitored

- Fetch bookings by user
- Get properties with average rating
- List upcoming bookings for a property

## 2. Initial Performance Analysis

- Query 1: Sequential scan on Booking table, 120ms
- Query 2: Join on Property and Review, 250ms
- Query 3: Sequential scan on Booking for future dates, 200ms

## 3. Bottlenecks Identified

- Missing indexes on `Booking.user_id` and `Booking.start_date`
- Missing index on `Review.property_id`

## 4. Schema Adjustments Implemented

```sql
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id_start_date ON Booking(property_id, start_date);
CREATE INDEX idx_review_property_id ON Review(property_id);

