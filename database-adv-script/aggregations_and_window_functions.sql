-- Aggregations and Window Functions for Airbnb Database

-- Total Number of Bookings by Each User
SELECT
    users.id AS user_id,
    users.username,
    COUNT(bookings.id) AS total_bookings
FROM
    users
LEFT JOIN
    bookings ON users.id = bookings.user_id
GROUP BY
    users.id, users.username;

-- Rank Properties Based on Total Bookings
SELECT
    properties.id AS property_id,
    properties.title,
    COUNT(bookings.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS booking_rank
FROM
    properties
LEFT JOIN
    bookings ON properties.id = bookings.property_id
GROUP BY
    properties.id, properties.title
ORDER BY
    booking_rank;  -- Order by booking rank for clarity
