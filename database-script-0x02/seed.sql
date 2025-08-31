# Seed Data SQL Script

This SQL script populates the AirBnB database with sample data for testing and demonstration purposes. It includes entries for users, properties, bookings, payments, reviews, and messages.

## SQL Seed Data

```sql
-- seed_data.sql

-- Insert Sample Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
    (UUID_GENERATE_V4(), 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password_1', '1234567890', 'guest', CURRENT_TIMESTAMP),
    (UUID_GENERATE_V4(), 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password_2', '0987654321', 'host', CURRENT_TIMESTAMP),
    (UUID_GENERATE_V4(), 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashed_password_3', NULL, 'admin', CURRENT_TIMESTAMP),
    (UUID_GENERATE_V4(), 'David', 'Williams', 'david.williams@example.com', 'hashed_password_4', '5551234567', 'guest', CURRENT_TIMESTAMP),
    (UUID_GENERATE_V4(), 'Eve', 'Davis', 'eve.davis@example.com', 'hashed_password_5', '5559876543', 'host', CURRENT_TIMESTAMP);

-- Insert Sample Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
    (UUID_GENERATE_V4(), (SELECT user_id FROM User WHERE email = 'bob.johnson@example.com'), 'Cozy Cottage', 'A lovely cottage for a weekend getaway.', 'Mountain View', 100.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (UUID_GENERATE_V4(), (SELECT user_id FROM User WHERE email = 'eve.davis@example.com'), 'Beachfront Villa', 'Luxurious villa right on the beach.', 'Santa Monica', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (UUID_GENERATE_V4(), (SELECT user_id FROM User WHERE email = 'bob.johnson@example.com'), 'Modern Apartment', 'A stylish apartment in the city.', 'New York', 180.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Sample Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status, created_at) VALUES
    (UUID_GENERATE_V4(), (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM User WHERE email = 'alice.smith@example.com'), '2025-09-01', '2025-09-05', 'confirmed', CURRENT_TIMESTAMP),
    (UUID_GENERATE_V4(), (SELECT property_id FROM Property WHERE name = 'Beachfront Villa'), (SELECT user_id FROM User WHERE email = 'david.williams@example.com'), '2025-09-10', '2025-09-15', 'pending', CURRENT_TIMESTAMP),
    (UUID_GENERATE_V4(), (SELECT property_id FROM Property WHERE name = 'Modern Apartment'), (SELECT user_id FROM User WHERE email = 'alice.smith@example.com'), '2025-09-20', '2025-09-25', 'confirmed', CURRENT_TIMESTAMP);

-- Insert Sample Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
    (UUID_GENERATE_V4(), (SELECT booking_id FROM Booking WHERE status = 'confirmed' AND user_id = (SELECT user_id FROM User WHERE email = 'alice.smith@example.com')), 500.00, CURRENT_TIMESTAMP, 'credit_card'),
    (UUID_GENERATE_V4(), (SELECT booking_id FROM Booking WHERE status = 'pending' AND user_id = (SELECT user_id FROM User WHERE email = 'david.williams@example.com')), 1250.00, CURRENT_TIMESTAMP, 'paypal');

-- Insert Sample Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
    (UUID_GENERATE_V4(), (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM User WHERE email = 'alice.smith@example.com'), 5, 'Absolutely loved this place!', CURRENT_TIMESTAMP),
    (UUID_GENERATE_V4(), (SELECT property_id FROM Property WHERE name = 'Beachfront Villa'), (SELECT user_id FROM User WHERE email = 'david.williams@example.com'), 4, 'Great location, but a bit noisy.', CURRENT_TIMESTAMP);

-- Insert Sample Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
    (UUID_GENERATE_V4(), (SELECT user_id FROM User WHERE email = 'alice.smith@example.com'), (SELECT user_id FROM User WHERE email = 'bob.johnson@example.com'), 'Can I check in early?', CURRENT_TIMESTAMP),
    (UUID_GENERATE_V4(), (SELECT user_id FROM User WHERE email = 'bob.johnson@example.com'), (SELECT user_id FROM User WHERE email = 'alice.smith@example.com'), 'Sure! Just let me know your arrival time.', CURRENT_TIMESTAMP);
