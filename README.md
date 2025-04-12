# 🐍 Python & SQL Mini Project Assignment

This repository contains the completed tasks from a Python & SQL assignment, showcasing data engineering, cleaning, and querying skills using Python (Pandas) and SQL.

## 📁 Project Structure

- `etl_pipeline/` – Simulated ETL pipeline on product review data.
- `data_deduplication/` – Script to clean duplicate user records.
- `sql_queries/` – SQL queries for joins, filtering, and data analysis.
- `vip_customers_analysis/` – Analyze customer purchases and membership data using both Python and SQL.

---

## 🔄 Task 1: ETL Pipeline Simulation

**Objective**: Build a basic ETL pipeline for product reviews.

- **Extract**: Load reviews from a CSV.
- **Transform**:
  - Remove rows with null ratings or reviews.
  - Ensure ratings are integers within the 1–5 range.
  - Extract simple sentiment: mark as "Negative" if "bad" is in the review text, else "Positive".
- **Load**: Save the cleaned and enriched dataset to a CSV.

🔧 Implemented in: [`etl_pipeline/etl_pipeline.py`](etl_pipeline/etl_pipeline.py)

---

## 🔍 Task 2: Data Deduplication

**Objective**: Remove duplicate user records based on email while keeping the latest entry.

- Use `last_updated` to retain the most recent record.

🔧 Implemented in: [`data_deduplication/deduplication.py`](data_deduplication/deduplication.py)

---

## 🧾 Task 3: SQL - Data Joins and Filtering

**Objective**: Retrieve users with more than 3 orders in the last 90 days and calculate their total spend.

🗃️ SQL logic used:
- `INNER JOIN`
- `GROUP BY`
- `HAVING`

📄 See: [`sql_queries/data_joins_and_filtering.sql`](sql_queries/data_joins_and_filtering.sql)

---

## ⏱️ Task 4: SQL - Identify Data Gaps

**Objective**: Identify missing hourly sensor readings over the past 24 hours for each sensor.

📄 See: [`sql_queries/data_gaps.sql`](sql_queries/data_gaps.sql)

---

## 🌟 Bonus Task: VIP Customer Identification

### Objective:
Find Gold members who have spent over $250 across all transactions.

### Approach:

- **SQL**: Join `purchases` and `members`, group by customer, and filter.
- **Python**: Merge two CSVs with Pandas, group by customer, and apply filters.

🧠 Logic:
- `INNER JOIN`, `SUM(amount)`, `GROUP BY`, and `HAVING` in SQL.
- `pandas.merge()`, `groupby()`, and filtering in Python.

📁 Python: [`vip_customers_analysis/vip_customers.py`](vip_customers_analysis/vip_customers.py)  
📄 SQL: [`sql_queries/vip_customers.sql`](sql_queries/vip_customers.sql)

---

## ✅ Tools & Libraries

- Python 3.x
- Pandas
- SQL (MySQL / PostgreSQL dialect)

---

## 📬 Contact

Made with ❤️ by [Your Name]  
📧 [YourEmail@example.com]  
🌐 [LinkedIn / Portfolio link]

---

## 📌 License

This project is open-source and available under the [MIT License](LICENSE).
