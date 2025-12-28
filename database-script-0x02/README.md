# Database Seed Script

## Objective
This directory contains SQL scripts used to populate the Airbnb database with sample data for testing and development.

---

## Included Sample Data

### Users
- Host and guest users
- Unique emails and roles

### Properties
- Multiple properties owned by a host
- Different locations and pricing

### Bookings
- Confirmed and pending bookings
- Valid booking date ranges

### Payments
- Payments linked to confirmed bookings

### Reviews
- User reviews with ratings between 1 and 5

### Messages
- Sample messages exchanged between users

---

## Design Notes

- UUIDs are used for all primary keys
- Foreign key relationships are respected
- ENUM values match schema definitions
- Data reflects real-world usage scenarios

---

## Usage

Run the script after creating the schema:

```bash
mysql -u username -p database_name < seed.sql

