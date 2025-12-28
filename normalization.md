# Database Normalization (3NF)

## Objective
The purpose of this document is to explain how the Airbnb database schema was reviewed and normalized to comply with the Third Normal Form (3NF).

---

## First Normal Form (1NF)

The database satisfies 1NF by:
- Using primary keys for all tables
- Ensuring all columns contain atomic values
- Removing repeating groups and multi-valued attributes

Example:
Amenities are stored in a separate table instead of a single comma-separated column.

---

## Second Normal Form (2NF)

The database satisfies 2NF by:
- Already being in 1NF
- Ensuring all non-key attributes depend on the full primary key
- Removing partial dependencies from tables with composite keys

Example:
Property details are stored in the `properties` table and not duplicated in the `bookings` table.

---

## Third Normal Form (3NF)

The database satisfies 3NF by:
- Already being in 2NF
- Removing transitive dependencies
- Ensuring non-key attributes depend only on the primary key

Example:
Location data such as city and country are stored in a separate `locations` table and referenced using foreign keys instead of being duplicated in multiple tables.

---

## Result

After applying normalization rules:
- Data redundancy has been eliminated
- Update, insert, and delete anomalies are prevented
- The database schema fully complies with Third Normal Form (3NF)

---

## Conclusion

The database schema has been reviewed and adjusted where necessary to ensure compliance with 3NF. All tables now store data that depends solely on their primary keys, resulting in a clean, scalable, and maintainable database design.

