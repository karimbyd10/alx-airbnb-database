# Airbnb Database - Index Performance

## Objective
Identify high-usage columns and create indexes to improve query performance on Users, Bookings, Properties, and Reviews tables.

## Steps Taken
1. Identified frequently queried columns used in JOINs, WHERE, and ORDER BY clauses.
2. Created single-column indexes on high-usage columns using CREATE INDEX.
3. Verified query performance improvements using EXPLAIN and ANALYZE.

## Indexes Created
- Users: `email`
- Bookings: `user_id`, `property_id`, `start_date`
- Properties: `title`
- Reviews: `property_id`

## Results
Queries that previously performed full table scans now utilize indexes, reducing query execution time and improving overall database efficiency.

