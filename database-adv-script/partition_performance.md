# Partitioning Performance Report

## Objective
Optimize queries on the large `Booking` table by implementing **table partitioning** based on the `start_date` column.

---

## Implementation
We partitioned the `Booking` table by **year ranges**:

```sql
CREATE TABLE Booking (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    status VARCHAR(50)
) PARTITION BY RANGE (start_date);

