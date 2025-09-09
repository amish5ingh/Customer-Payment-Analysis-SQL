# 📊 Customer-Payment-Analysis-SQL

This project is a complete hands-on SQL practice set covering foundational to advanced queries using two relational tables: `customer` and `payment`. It demonstrates real-world database operations such as filtering, joining, aggregating, and working with timestamps.

---

## 🧾 Tables Used

### 1. `customer`
Stores basic customer information.

| Column Name   | Data Type     |
|---------------|---------------|
| customer_id   | INT           |
| first_name    | VARCHAR(20)   |
| last_name     | VARCHAR(20)   |
| address       | VARCHAR(20)   |

### 2. `payment`
Stores payment transaction details.

| Column Name   | Data Type     |
|---------------|---------------|
| customer_id   | INT           |
| amount        | BIGINT        |
| mode          | VARCHAR(20)   |
| payment_date  | DATE          |

---

## 🔍 SQL Concepts Covered

### ✅ Basic Queries
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Aliasing with `AS`

### 🔗 Joins
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`

### 📐 String Functions
- `UPPER()`, `LENGTH()`, `SUBSTRING()`

### 📊 Aggregate Functions
- `SUM()`, `AVG()`, `COUNT()`, `MIN()`, `MAX()`, `ROUND()`

### 📁 Grouping & Filtering
- `GROUP BY`, `HAVING`, `ORDER BY`

### 🕒 Timestamp Functions
- `NOW()`, `CURRENT_DATE`, `CURRENT_TIME`, `TIMEOFDAY()`

---

## 📌 Sample Queries

```sql
-- Get first two customers alphabetically
SELECT first_name FROM customer ORDER BY first_name ASC LIMIT 2;

-- Total amount by payment mode
SELECT mode, SUM(amount) AS Total FROM payment GROUP BY mode ORDER BY Total DESC;

-- Inner Join to fetch customer names with payment details
SELECT first_name, mode, amount FROM customer AS c
INNER JOIN payment AS p ON c.customer_id = p.customer_id;
