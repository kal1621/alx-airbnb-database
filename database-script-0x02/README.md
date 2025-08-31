# Seed Data for AirBnB Database

## Overview

This document outlines the SQL script used to populate the AirBnB database with sample data. The data reflects realistic scenarios and relationships between users, properties, bookings, payments, reviews, and messages.

## Purpose

The seed data is intended for testing and demonstration purposes, allowing developers and testers to interact with the database and explore its functionalities.

## SQL Script

The SQL script for seeding the database is located in the `seed_data.sql` file. This script includes:

- Insertion of sample users with different roles (guest, host, admin).
- Creation of properties listed by hosts.
- Booking records associated with users and properties.
- Payment transactions linked to bookings.
- Reviews written by users for properties.
- Messages exchanged between users.

## How to Execute

To populate the database with sample data, execute the `seed_data.sql` script in your SQL environment. Here’s how to do it:

1. **Open your SQL client** (e.g., psql for PostgreSQL).
2. **Run the following command**:

   ```sql
   -- Example command to execute the SQL file
   psql -U username -d database_name -f seed_data.sql
