# Partition Performance Report

## Overview
This document outlines the implementation of table partitioning on the Booking table based on the `start_date` column to optimize query performance.

## Implementation of Partitioning
The Booking table was partitioned by date range to improve performance for queries filtering by the `start_date`. The following partitions were created:

- **Bookings for 2023**: For values from '2023-01-01' to '2024-01-01'
- **Bookings for 2024**: For values from '2024-01-01' to '2025-01-01'
- **Bookings for 2025**: For values from '2025-01-01' to '2026-01-01'

## Performance Testing

### Initial Query Performance (Before Partitioning)
```sql
EXPLAIN SELECT * 
FROM bookings 
WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';
