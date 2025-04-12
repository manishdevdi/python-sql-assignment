-- ========================================
-- Project: Retail Analytics - VIP Customer Identification
-- Task Title: Identify VIP Customers Based on Purchase Behavior & Membership
-- Objective:
--     1. Find customers who made total purchases over $250.
--     2. Among those, return only Gold members.
-- Data Sources:
--     🔹 purchases.csv (or purchases table)
--     🔹 members.csv (or members table)
-- Final Output:
--     🔸 customer_id
--     🔸 total_spent
--     🔸 membership_level
-- Methodology:
--     1. Performed an INNER JOIN on customer_id.
--     2. Aggregated total purchase amount using GROUP BY (or groupby in pandas).
--     3. Filtered customers with:
--          - total_spent > 250
--          - membership_level = 'Gold'
-- Tools Used:
--     ✔ SQL (for relational DB query)
--     ✔ Python with Pandas (for CSV-based processing)
-- Author: Manish Devdi
-- Date: April 2025
-- ========================================


-- ------------------------
-- 🔹 STEP 1: CREATE DATABASE & TABLES
-- ------------------------

-- 1.1: Create a new database for this task
CREATE DATABASE vip_customers_db;

-- 1.2: Use the newly created database
USE vip_customers_db;

-- 1.3: Create the 'purchases' table
CREATE TABLE purchases (
    transaction_id VARCHAR(10),       -- Unique transaction ID
    customer_id VARCHAR(10),          -- Customer identifier
    amount DECIMAL(10,2),             -- Purchase amount
    transaction_date DATE             -- Date of transaction
);

-- 1.4: Create the 'members' table
CREATE TABLE members (
    customer_id VARCHAR(10),          -- Customer ID
    member_since DATE,                -- Membership start date
    membership_level VARCHAR(20)      -- Membership level (e.g., Gold, Silver)
);

-- ------------------------
-- 🔹 STEP 2: INSERT SAMPLE DATA
-- ------------------------

-- 2.1: Insert data into purchases table
INSERT INTO purchases (transaction_id, customer_id, amount, transaction_date) VALUES
('T1001', 'C001', 120.50, '2024-03-15'),
('T1002', 'C002', 200.00, '2024-03-15'),
('T1003', 'C001', 300.00, '2024-03-16'),
('T1004', 'C003', 50.00,  '2024-03-17');

-- 2.2: Insert data into members table
INSERT INTO members (customer_id, member_since, membership_level) VALUES
('C001', '2023-05-01', 'Gold'),
('C002', '2023-11-15', 'Silver'),
('C004', '2024-01-10', 'Gold');

-- ------------------------
-- 🔹 STEP 3: FINAL QUERY TO FIND VIP CUSTOMERS
-- ------------------------

-- 3.1: Join tables, aggregate, and filter
SELECT 
    m.customer_id,                         -- Customer ID
    SUM(p.amount) AS total_spent,          -- Total purchase amount
    m.membership_level                     -- Membership level
FROM 
    purchases p
INNER JOIN 
    members m ON p.customer_id = m.customer_id
WHERE 
    m.membership_level = 'Gold'            -- Only Gold members
GROUP BY 
    m.customer_id, m.membership_level
HAVING 
    SUM(p.amount) > 250;                   -- Filter customers who spent more than $250
