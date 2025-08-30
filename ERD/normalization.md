To normalize your database design to the Third Normal Form (3NF), we need to ensure that it meets the following criteria:

It is in Second Normal Form (2NF): All non-key attributes must be fully functionally dependent on the primary key.
No transitive dependencies: Non-key attributes must not depend on other non-key attributes.
Normalization Steps
Step 1: Review the Existing Schema
Here's a brief overview of the original schema:

User: Contains user information.
Property: Contains property details linked to a user.
Booking: Contains booking details linked to properties and users.
Payment: Contains payment details linked to bookings.
Review: Contains reviews linked to properties and users.
Message: Contains messages exchanged between users.
Step 2: Identify Redundancies and Potential Violations
User Table:

The current design is fine. All attributes are dependent on user_id.
Property Table:

The host_id is a foreign key and correctly links to the User table. The other attributes are dependent on property_id.
Booking Table:

Attributes start_date, end_date, total_price, and status are correctly dependent on booking_id.
Ensure that total_price could potentially be derived from the Property table (price per night multiplied by the number of nights). However, having it in the Booking table avoids recalculating it multiple times.
Payment Table:

All attributes depend on payment_id. The foreign key booking_id is appropriately placed.
Review Table:

All attributes depend on review_id. The foreign keys are correctly positioned.
Message Table:

All attributes depend on message_id, and the foreign keys are valid.
Step 3: Adjust for 3NF
After reviewing, the schema appears to already be in 3NF, as:

All non-key attributes are fully functionally dependent on the primary key.
There are no transitive dependencies.
However, we can enhance the design by ensuring that derived attributes, such as total_price in the Booking table, are calculated on demand rather than stored. This can be achieved by removing total_price and calculating it during queries.

Proposed Changes
Remove total_price from the Booking Table:
Instead of storing total_price, calculate it as price_per_night * (end_date - start_date) during retrieval.
Normalized Database Design
Here's the revised schema reflecting the above changes:

User

user_id: Primary Key, UUID, Indexed
first_name: VARCHAR, NOT NULL
last_name: VARCHAR, NOT NULL
email: VARCHAR, UNIQUE, NOT NULL
password_hash: VARCHAR, NOT NULL
phone_number: VARCHAR, NULL
role: ENUM (guest, host, admin), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Property

property_id: Primary Key, UUID, Indexed
host_id: Foreign Key, references User(user_id)
name: VARCHAR, NOT NULL
description: TEXT, NOT NULL
location: VARCHAR, NOT NULL
price_per_night: DECIMAL, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
Booking

booking_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
start_date: DATE, NOT NULL
end_date: DATE, NOT NULL
status: ENUM (pending, confirmed, canceled), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Payment

payment_id: Primary Key, UUID, Indexed
booking_id: Foreign Key, references Booking(booking_id)
amount: DECIMAL, NOT NULL
payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
payment_method: ENUM (credit_card, paypal, stripe), NOT NULL
Review

review_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
comment: TEXT, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Message

message_id: Primary Key, UUID, Indexed
sender_id: Foreign Key, references User(user_id)
recipient_id: Foreign Key, references User(user_id)
message_body: TEXT, NOT NULL
sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Conclusion
The database design has been reviewed and normalized to 3NF by ensuring that all attributes are dependent on the primary key without transitive dependencies. The removal of derived attributes helps maintain data integrity and reduces redundancy.
