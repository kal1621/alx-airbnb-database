-- Initial Query: Retrieve all bookings with user, property, and payment details
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
