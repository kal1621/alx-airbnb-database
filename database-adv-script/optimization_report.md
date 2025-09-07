# Query Optimization Report

## Overview
This document outlines the optimization process for a complex query that retrieves all bookings along with user details, property details, and payment details.

## Initial Query
```sql
SELECT
    bookings.id AS booking_id,
    users.id AS user_id,
    users.username,
    properties.id AS property_id,
    properties.title,
    properties.location,
    payments.id AS payment_id,
    payments.amount,
    payments.payment_date
FROM
    bookings
JOIN
    users ON bookings.user_id = users.id
JOIN
    properties ON bookings.property_id = properties.id
JOIN
    payments ON bookings.id = payments.booking_id;
