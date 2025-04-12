-- ========================================
-- SQL Script: Data Joins and Filtering
-- Objective: Select users with more than 3 orders in the last 90 days
-- Author: Manish Devdi
-- ========================================

-- ------------------------
-- 🔹 STEP 1: CREATE DATABASE & TABLES
-- ------------------------

-- 1.1: Create a new database for this assignment
CREATE DATABASE assignment_db;

-- 1.2: Use the newly created database
USE assignment_db;

-- 1.3: Create 'users' table to store user information
CREATE TABLE users (
    user_id VARCHAR(10) PRIMARY KEY,    -- User ID (Primary Key)
    name VARCHAR(50),                    -- User's Name
    signup_date DATE                     -- User's Signup Date
);

-- 1.4: Create 'orders' table to store orders information
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,    -- Order ID (Primary Key)
    user_id VARCHAR(10),                 -- Foreign Key to users table
    amount DECIMAL(10, 2),               -- Order amount
    order_date DATE,                     -- Date the order was placed
    FOREIGN KEY (user_id) REFERENCES users(user_id) -- Enforces referential integrity
);

-- ------------------------
-- 🔹 STEP 2: INSERT SAMPLE DATA
-- ------------------------

-- 2.1: Insert sample users data into 'users' table
INSERT INTO users (user_id, name, signup_date) VALUES
('U001', 'Alice', '2024-01-01'),
('U002', 'Bob', '2024-01-15'),
('U003', 'Charlie', '2024-02-01'),
('U004', 'David', '2024-03-01');

-- 2.2: Insert sample orders data into 'orders' table
INSERT INTO orders (order_id, user_id, amount, order_date) VALUES
('O001', 'U001', 100.00, '2024-02-01'),
('O002', 'U001', 150.00, '2024-02-15'),
('O003', 'U001', 200.00, '2024-03-01'),
('O004', 'U001', 50.00,  '2024-03-10'),
('O005', 'U002', 300.00, '2024-03-05'),
('O006', 'U002', 150.00, '2024-03-15'),
('O007', 'U003', 250.00, '2024-02-20'),
('O008', 'U001', 120.00, '2025-01-20'),
('O009', 'U002', 80.00,  '2025-02-15'),
('O010', 'U003', 90.00,  '2025-03-10'),
('O011', 'U001', 100.00, '2025-04-05'),
('O012', 'U001', 110.00, '2025-02-05'),
('O013', 'U001', 320.00, '2025-03-15'),
('O014', 'U003', 110.00, '2024-12-05'),
('O015', 'U002', 115.00, '2024-04-05');

-- View the inserted data from the users table
SELECT * FROM users;

-- View the inserted data from the orders table
SELECT * FROM orders;

-- ------------------------
-- 🔹 STEP 3: MAIN QUERY
-- ------------------------

-- 3.1: Main Query: 
-- This query selects all users who have placed more than 3 orders
-- in the last 90 days and calculates their total spend

SELECT
    u.user_id,                                    -- Select user_id from users table
    u.name,                                       -- Select user name from users table
    COUNT(o.order_id) AS total_orders,            -- Count the number of orders placed by each user
    SUM(o.amount) AS total_spent                  -- Calculate the total amount spent by each user
FROM
    users u                                       -- From the users table
INNER JOIN
    orders o ON u.user_id = o.user_id             -- Join with orders table based on user_id
WHERE
    o.order_date >= CURRENT_DATE - INTERVAL 90 DAY -- Filter for orders made in the last 90 days
GROUP BY
    u.user_id, u.name                            -- Group results by user_id and name
HAVING
    COUNT(o.order_id) > 3;                        -- Only show users who placed more than 3 orders
