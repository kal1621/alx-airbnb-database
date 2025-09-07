# Index Performance Optimization for Airbnb Database

## Overview
This document outlines the implementation of indexes on high-usage columns within the User, Booking, and Property tables to improve query performance.

## Identified Columns for Indexing
- **User Table**:
  - `email`
  
- **Booking Table**:
  - `user_id`
  - `property_id`
  - `start_date`
  
- **Property Table**:
  - `location`
  - `title`

## SQL Commands to Create Indexes

```sql
-- Create Indexes for Optimization

-- User Table
CREATE INDEX idx_user_email ON users(email);

-- Booking Table
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_start_date ON bookings(start_date);

-- Property Table
CREATE INDEX idx_property_location ON properties(location);
CREATE INDEX idx_property_title ON properties(title);
