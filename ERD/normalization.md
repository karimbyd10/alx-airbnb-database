# Database Normalization to 3NF

## Objective
Apply normalization principles to ensure the Airbnb-style database is in Third Normal Form (3NF).

## Step 1: Review Schema
Initial schema:
- Users(user_id, name, email, phone)
- Properties(property_id, owner_id, address, city, price_per_night)
- Bookings(booking_id, user_id, property_id, start_date, end_date, total_price)
- Payments(payment_id, booking_id, payment_method, payment_status)

### Observed Issues
1. **Bookings.total_price** is dependent on other table data (property price and booking duration), causing a transitive dependency.
2. Address in `Properties` may contain multiple data points (street, city) in one column — violates atomicity.

## Step 2: Apply 3NF Principles
- Remove derived data from tables (`Bookings.total_price`).
- Split `Properties.address` into atomic fields: street, city, state, country.
- Maintain foreign key relationships to ensure referential integrity.

## Step 3: Revised Schema
```sql
Users(user_id PK, name, email, phone)
Properties(property_id PK, owner_id FK, street, city, state, country, price_per_night)
Bookings(booking_id PK, user_id FK, property_id FK, start_date, end_date)
Payments(payment_id PK, booking_id FK, payment_method, payment_status)

