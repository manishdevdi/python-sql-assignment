-- ========================================
-- SQL Script: Identify Missing Hourly Readings
-- Objective: Find any missing hourly readings in the past 24 hours for each sensor
-- Author: Manish Devdi
-- ========================================

-- ------------------------
-- 🔹 STEP 1: CREATE DATABASE & TABLES
-- ------------------------

CREATE DATABASE IF NOT EXISTS sensor_data_db;
USE sensor_data_db;

CREATE TABLE IF NOT EXISTS sensor_logs (
    sensor_id VARCHAR(10),
    timestamp DATETIME,
    reading DECIMAL(5,2),
    PRIMARY KEY (sensor_id, timestamp)
);

-- Clear old data (optional if re-running)
DELETE FROM sensor_logs;

-- Insert sample data
INSERT INTO sensor_logs (sensor_id, timestamp, reading) VALUES
('S001', '2025-04-11 00:00:00', 22.5),
('S001', '2025-04-11 01:00:00', 23.0),
('S001', '2025-04-11 03:00:00', 21.5),
('S002', '2025-04-11 00:00:00', 30.0),
('S002', '2025-04-11 02:00:00', 29.5),
('S003', '2025-04-11 01:00:00', 15.5),
('S003', '2025-04-11 03:00:00', 16.0);

-- ------------------------
-- 🔹 STEP 2: IDENTIFY MISSING HOURLY READINGS
-- ------------------------

-- 2.1: Initialize row number variable
SET @rownum := -1;

-- 2.2: Query to find missing hourly readings
WITH all_hours AS (
    SELECT 
        DATE_FORMAT(DATE_SUB(NOW(), INTERVAL x HOUR), '%Y-%m-%d %H:00:00') AS expected_timestamp
    FROM (
        SELECT @rownum := @rownum + 1 AS x
        FROM (
            SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION
            SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION
            SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15 UNION
            SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20 UNION
            SELECT 21 UNION SELECT 22 UNION SELECT 23
        ) AS hours
    ) AS seq
),
missing_readings AS (
    SELECT 
        s.sensor_id,
        a.expected_timestamp
    FROM all_hours a
    CROSS JOIN (SELECT DISTINCT sensor_id FROM sensor_logs) s
    LEFT JOIN sensor_logs sl
        ON sl.sensor_id = s.sensor_id
        AND DATE_FORMAT(sl.timestamp, '%Y-%m-%d %H:00:00') = a.expected_timestamp
    WHERE sl.timestamp IS NULL
)

SELECT * FROM missing_readings
ORDER BY sensor_id, expected_timestamp;
