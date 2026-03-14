-- Creating a database (smart_expense_tracker)
-- CREATE DATABASE smart_expense_tracker;

-- Select the database so we can work inside it
-- USE smart_expense_tracker;

-- Create a table to store user information

-- CREATE TABLE Users (
-- 	user_id INT AUTO_INCREMENT PRIMARY KEY,
-- 	name VARCHAR(100) NOT NULL,
-- 	email VARCHAR(100) UNIQUE NOT NULL
-- );

-- Insert first user into Users table

-- INSERT INTO Users (name, email) 
-- VALUES 
-- ('Alice Johnson', 'alice@gmail.com'),
-- ('Bob Smith', 'bob@gmail.com'),
-- ('Charlie Brown', 'charlie@gmail.com'),
-- ('David Lee', 'david@gmail.com'),
-- ('Eva Green', 'eva@gmail.com');

-- Select * From Users;

-- Create a table to store expense categories like Food, Rent, et-- Create a table to store expense categories like Food, Rent, etc.

-- CREATE TABLE Categories (
-- 	category_id INT AUTO_INCREMENT PRIMARY KEY,
-- 	category_name VARCHAR(50) UNIQUE NOT NULL
-- );

-- INSERT INTO Categories (category_id, category_name) 
-- VALUES 
--   (1, 'Food'),
--   (2, 'Rent'),
--   (3, 'Transport'),
--   (4, 'Shopping'),
--   (5, 'Entertainment');

-- SELECT category_id + 0 AS test_id
-- FROM categories
-- order by test_id;


-- Insert Food category
-- INSERT INTO Categories (category_name) VALUES ('Food');

-- Insert Rent category
-- INSERT INTO Categories (category_name) VALUES ('Rent');

-- Insert Transport category
-- INSERT INTO Categories (category_name) VALUES ('Transport');

-- Insert Shopping category
-- INSERT INTO Categories (category_name) VALUES ('Shopping');

-- -- Insert Entertainment category
-- INSERT INTO Categories (category_name) VALUES ('Entertainment');


-- SELECT category_id FROM Categories
-- ORDER BY category_id ASC;

-- SELECT category_id, category_name 
-- FROM Categories;

-- UPDATE Categories SET category_id = 1 WHERE category_name = 'Food';
-- UPDATE Categories SET category_id = 2 WHERE category_name = 'Rent';
-- UPDATE Categories SET category_id = 3 WHERE category_name = 'Transport';
-- UPDATE Categories SET category_id = 4 WHERE category_name = 'Shopping';
-- UPDATE Categories SET category_id = 5 WHERE category_name = 'Entertainment';

Select * From Categories;

-- Create a table to store all expense transactions

-- CREATE TABLE Expenses (
--     expense_id INT AUTO_INCREMENT PRIMARY KEY,
--     user_id INT NOT NULL,
--     category_id INT NOT NULL,
--     amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
--     expense_date DATE NOT NULL,
-- 	   FOREIGN KEY (user_id) REFERENCES Users(user_id),
--     FOREIGN KEY (category_id) REFERENCES Categories(category_id)
-- );

-- INSERT INTO Expenses (user_id, category_id, amount, expense_date) VALUES
-- (1, 1, 120.50, '2025-01-02'),
-- (1, 2, 800.00, '2025-01-03'),
-- (2, 1, 75.00, '2025-01-05'),
-- (2, 3, 40.00, '2025-01-06'),
-- (3, 4, 200.00, '2025-01-07'),
-- (3, 1, 60.00, '2025-01-08'),
-- (4, 5, 150.00, '2025-01-09'),
-- (4, 3, 55.00, '2025-01-10'),
-- (5, 1, 95.00, '2025-01-11'),
-- (5, 2, 700.00, '2025-01-12'),
-- (1, 4, 220.00, '2025-01-13'),
-- (2, 5, 130.00, '2025-01-14'),
-- (3, 3, 45.00, '2025-01-15'),
-- (4, 1, 85.00, '2025-01-16'),
-- (5, 4, 300.00, '2025-01-17');

-- SELECT * FROM Expenses


-- SET FOREIGN_KEY_CHECKS = 0;

-- DROP TABLE IF EXISTS Expenses;
-- DROP TABLE IF EXISTS Categories;
-- DROP TABLE IF EXISTS Users;

-- SET FOREIGN_KEY_CHECKS = 1;

-- 1. Total Spend Per User
-- SELECT u.user_id, u.name, SUM(e.amount) AS total_spent
-- FROM Users u
-- JOIN Expenses e ON u.user_id = e.user_id
-- GROUP BY u.user_id, u.name;

-- 2. Budget Check (Users who spent more than $500)
-- SELECT u.name, SUM(e.amount) AS total_spent
-- FROM Users u
-- JOIN Expenses e ON u.user_id = e.user_id
-- GROUP BY u.name
-- HAVING SUM(e.amount) > 500;

-- 3. Most Used Category
-- SELECT c.category_name, COUNT(e.expense_id) AS usage_count
-- FROM Categories c
-- JOIN Expenses e ON c.category_id = e.category_id
-- GROUP BY c.category_name
-- ORDER BY usage_count DESC
-- LIMIT 1;

-- 4. Monthly View (Most Recent First)
-- SELECT u.name, c.category_name, e.amount, e.expense_date
-- FROM Expenses e
-- JOIN Users u ON e.user_id = u.user_id
-- JOIN Categories c ON e.category_id = c.category_id
-- ORDER BY e.expense_date DESC;

