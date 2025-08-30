# AirBnB Database Schema

## Overview

This repository contains the SQL DDL statements for the AirBnB database schema. The schema is designed to support a user-centric property rental application, allowing users to list properties, make bookings, process payments, leave reviews, and communicate through messages.

## Database Schema

The schema consists of the following tables:

- **User**: Stores information about users, including their roles (guest, host, admin).
- **Property**: Contains details about properties listed by users (hosts).
- **Booking**: Records bookings made by users for specific properties.
- **Payment**: Manages payment transactions for bookings.
- **Review**: Allows users to leave reviews for properties.
- **Message**: Facilitates messaging between users.

## SQL DDL Statements

The SQL statements for creating the tables, including primary keys, foreign keys, constraints, and indexes, are located in the `schema.sql` file.

## How to Execute

To set up the database, execute the SQL statements in your SQL environment. Here’s how you can do it:

1. **Open your SQL client** (e.g., psql for PostgreSQL).
2. **Run the following command**:

   ```sql
   -- Example command to execute the SQL file
   psql -U username -d database_name -f schema.sql
