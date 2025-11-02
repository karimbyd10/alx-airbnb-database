# Airbnb Database - Query Optimization Report

## 🎯 Objective
To refactor a complex SQL query retrieving bookings with user, property, and payment details to improve performance and reduce execution time.

---

## ⚙️ Step 1: Initial Query
The initial query joined four large tables (`bookings`, `users`, `properties`, `payments`) without filtering or column optimization.

### Issues Identified
- Full table scans observed in `EXPLAIN` output.
- All columns were being selected (`SELECT *`).
- No filtering conditions caused unnecessary data load.
- Missing indexes on `user_id`, `property_id`, and `booking_id` slowed joins.

---

## 🧠 Step 2: Optimization Actions
1. **Created Indexes** on foreign key columns:
   ```sql
   CREATE INDEX idx_bookings_user_id ON bookings(user_id);
   CREATE INDEX idx_bookings_property_id ON bookings(property_id);
   CREATE INDEX idx_payments_booking_id ON payments(booking_id);

