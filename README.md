# 🐍 Python & SQL Mini Project Assignment

This repository contains the completed tasks from a Python & SQL assignment, showcasing data engineering, cleaning, and querying skills using Python (Pandas) and SQL.

## 📁 Project Structure

python-sql-assignment/
│
├── etl_pipeline/
│   ├── etl_pipeline.ipynb
│   ├── cleaned_reviews_output.xls
│   └── cleaned_reviews_output.json
│
├── data_deduplication/
│   ├── data_deduplication.ipynb
│   └── deduplicated_users.xls
│
├── sql_queries/
│   ├── data_joins_filtering.sql
│   └── identify_missing_hourly_readings.sql
│
├── vip_customers_analysis/
│   ├── purchases.csv
│   ├── members.csv
│   ├── vip_customers_query.sql
│   └── vip_customers_analysis.ipynb
│
└── README.md


---

## 🔄 Task 1: ETL Pipeline Simulation

**Objective**: Build a basic ETL pipeline for product reviews.

- **Extract**: Load reviews from a CSV.
- **Transform**:
  - Remove rows with null ratings or reviews.
  - Ensure ratings are integers within the 1–5 range.
  - Extract simple sentiment: mark as "Negative" if "bad" is in the review text, else "Positive".
- **Load**: Save the cleaned and enriched dataset to a CSV or JSON(Optional) file.

🔧 Implemented in: [`etl_pipeline/etl_pipeline.ipynb`](https://github.com/manishdevdi/python-sql-assignment/blob/main/etl_pipeline/etl_pipeline.ipynb
)

---

## 🔍 Task 2: Data Deduplication

**Objective**: Remove duplicate user records based on email while keeping the latest entry.

- Use `last_updated` to retain the most recent record.

🔧 Implemented in: [`data_deduplication/data_deduplication.ipynb`](https://github.com/manishdevdi/python-sql-assignment/blob/main/data_deduplication/data_deduplication.ipynb)

---

## 🧾 Task 3: SQL - Data Joins and Filtering

**Objective**: Retrieve users with more than 3 orders in the last 90 days and calculate their total spend.

🗃️ SQL logic used:
- `INNER JOIN`
- `GROUP BY`
- `HAVING`

📄 See: [`sql_queries/data_joins_filtering.sql`](https://github.com/manishdevdi/python-sql-assignment/blob/main/sql_queries/data_joins_filtering.sql)

---

## ⏱️ Task 4: SQL - Identify Data Gaps

**Objective**: Identify missing hourly sensor readings over the past 24 hours for each sensor.

📄 See: [`sql_queries/identify_missing_hourly_readings.sql`](https://github.com/manishdevdi/python-sql-assignment/blob/main/sql_queries/identify_missing_hourly_readings.sql)

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

📁 Python: [`vip_customers_analysis/vip_customers_analysis.ipynb`](https://github.com/manishdevdi/python-sql-assignment/blob/main/vip_customers_analysis/vip_customers_analysis.ipynb)   
📄 SQL: [`vip_customers_analysis/vip_customers_query.sql`](https://github.com/manishdevdi/python-sql-assignment/blob/main/vip_customers_analysis/vip_customers_query.sql)

---

## ✅ Tools & Libraries

- Python 3.x
- Pandas
- SQL (MySQL / PostgreSQL dialect)

---

## 📬 Contact

Made with ❤️ by **Manish Devdi**  
📧 [manishdevdi778@gmail.com](mailto:manishdevdi778@gmail.com)  
🌐 [LinkedIn – Manish Devdi](https://www.linkedin.com/in/manish-devdi/)

---

## 📌 License

This project is open-source and available under the [MIT License](https://github.com/manishdevdi/python-sql-assignment/blob/main/License).
