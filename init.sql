-- Instructions
-- Create a table called person that records a person's id, name, age, height 
-- ( in cm ), city, favorite_color.

CREATE TABLE person ( 
  person_id SERIAL PRIMARY KEY, 
  name VARCHAR(50), 
  age INT, 
  height INT, 
  city VARCHAR(50), 
  favorite_color VARCHAR(50) 
);

-- id should be an auto-incrementing id/primary key - Use type: SERIAL

-- Add 5 different people into the person database.
INSERT INTO person 
(name, age, height, city, favorite_color) 
VALUES 
('Chris Dorn', 40, 195, 'Phoenix', 'Blue'),
('Ricky Vaughn', 29, 182, 'Fresno', 'Black'),
('Willie Hayes', 27, 185, 'Oakland', 'Red'),
('Pedro Serrano', 33, 193, 'Santiago', 'White'),
('Jake Tucker', 37, 188, 'Chicago', 'Green');
-- Remember to not include the person_id because it should auto-increment.

-- List all the people in the person table by height from tallest to shortest.
SELECT * FROM person
ORDER BY height DESC;

-- List all the people in the person table by height from shortest to tallest.
SELECT * FROM person
ORDER BY height ASC;

-- List all the people in the person table by age from oldest to youngest.
SELECT * FROM person
ORDER BY age DESC;

-- List all the people in the person table older than age 20.
SELECT * FROM person
WHERE age > 20;

-- List all the people in the person table that are exactly 18.
SELECT * FROM person
WHERE age = 18;

-- List all the people in the person table that are less than 20 and older than 30.
SELECT * FROM person
WHERE age < 20 OR age > 30;

-- List all the people in the person table that are not 27 (Use not equals).
SELECT * FROM person
WHERE age !=27;

-- List all the people in the person table where their favorite color is not red.
SELECT * FROM person
WHERE favorite_color != 'red';

-- List all the people in the person table where their favorite color is not red and is not blue.
SELECT * FROM person
WHERE favorite_color != 'red'
AND favorite_color != 'blue';

-- List all the people in the person table where their favorite color is orange or green.
SELECT * FROM person
WHERE favorite_color = 'orange'
OR favorite_color = 'green';

-- List all the people in the person table where their favorite color is orange, green or blue (use IN).
SELECT * FROM person
WHERE favorite_color
IN ('orange', 'green', 'blue');

-- List all the people in the person table where their favorite color is yellow or purple (use IN).
SELECT * FROM person
WHERE favorite_color 
IN ('yellow', 'purple');

-- Create a table called orders that records: order_id, person_id, product_name, product_price, quantity.

CREATE TABLE orders (order_id SERIAL PRIMARY KEY, 
person_id INTEGER, 
product_name VARCHAR(75), 
product_price NUMERIC, 
quantity INTEGER );

-- Add 5 orders to the orders table.
INSERT INTO orders 
( person_id, product_name, product_price, quantity ) 
VALUES 
(1, 'Ninja Blender', 199.99, 7)
(2, 'Airfryer 3000', 99.95, 20)
(3, 'Magic Bullet', 59.99, 35)
(4, 'Spotless Shine', 39.99, 100)
(5, 'Putty Wizard', 29.95, 75);

-- Make orders for at least two different people.
-- person_id should be different for different people.
INSERT INTO orders
(6, 'Oxyclean', 19.99, 75)
(7, 'Dyson', 399.99, 50);

-- Select all the records from the orders table.
SELECT * FROM orders;

-- Calculate the total number of products ordered.
SELECT SUM (quantity) FROM orders;

-- Calculate the total order price.
SELECT SUM(product_price * quantity) FROM orders;

-- Calculate the total order price by a single person_id.
SELECT SUM(product_price * quantity) FROM orders WHERE person_id = 4;

-- Instructions
-- Add 3 new artists to the artist table. ( It's already created )
INSERT INTO artist
(name)
VALUES
('Snoop Dogg'),
('Kenny Rogers'),
('Neko Case');


-- Select 10 artists in reverse alphabetical order.
SELECT * FROM artist ORDER BY name DESC LIMIT 10;

-- Select 5 artists in alphabetical order.
SELECT * FROM artist 
ORDER BY name ASC LIMIT 5;

-- Select all artists that start with the word 'Black'.
SELECT * FROM artist 
WHERE name LIKE 'Black%';

-- Select all artists that contain the word 'Black'.
SELECT * FROM artist 
WHERE name LIKE '%Black%';

-- Instructions
-- List all employee first and last names only that live in Calgary.
SELECT first_name, last_name FROM employee
WHERE city = 'Calgary';

-- Find the birthdate for the youngest employee.
SELECT MAX(birth_date) FROM employee;

-- Find the birthdate for the oldest employee.
SELECT MIN(birt_date) FROM employee;

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
-- You will need to query the employee table to find the Id for Nancy Edwards
SELECT first_name, last_name FROM employee
WHERE name = 'Nancy Edwards'

SELECT * FROM employee
WHERE reports_to =2;

-- Count how many people live in Lethbridge.
SELECT COUNT(*) FROM employee 
WHERE city = 'Lethbridge';

-- Instructions
-- Count how many orders were made from the USA.
SELECT COUNT (*) FROM invoice
WHERE billing_country = 'USA';

-- Find the largest order total amount.
SELECT MAX(total) FROM invoice;

-- Find the smallest order total amount.

SELECT MIN(total) FROM invoice;

-- Find all orders bigger than $5.
SELECT * FROM invoice
WHERE total > 5;

-- Count how many orders were smaller than $5.
SELECT COUNT(*) FROM invoice
WHERE total < 5;

-- Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(*) FROM invoice
WHERE billing_state in ('CA', 'TX', 'AZ');

-- Get the average total of the orders.
SELECT AVG(total) FROM invoice;

-- Get the total sum of the orders.
SELECT SUM(total) FROM invoice;