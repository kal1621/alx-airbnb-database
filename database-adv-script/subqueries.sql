-- Non-Correlated Subquery: Find all properties where the average rating is greater than 4.0
SELECT
    properties.id AS property_id,
    properties.title,
    properties.location
FROM
    properties
WHERE
    (SELECT AVG(rating) 
     FROM reviews 
     WHERE reviews.property_id = properties.id) > 4.0;

-- Correlated Subquery: Find users who have made more than 3 bookings
SELECT
    users.id AS user_id,
    users.username
FROM
    users
WHERE
    (SELECT COUNT(*) 
     FROM bookings 
     WHERE bookings.user_id = users.id) > 3;
