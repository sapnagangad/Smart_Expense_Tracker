# Smart_Expense_Tracker

A **Smart Expense Tracker** built using SQL to manage and analyze personal spending data.  
This project demonstrates how relational databases can store, organize, and analyze expense transactions for multiple users.

The system includes tables for **Users, Categories, and Expenses** and performs analytical queries to understand spending behavior, category usage, and budgeting patterns.

---

## Project Objective

The goal of this project is to practice **SQL database design and analytical querying** by building a simple expense management system.

This project demonstrates:

- Database schema design
- Table relationships using **Primary Keys and Foreign Keys**
- Data insertion and management
- Writing analytical SQL queries
- Generating insights from transaction data

---

## Database Schema

The project contains **three main tables**.

### 1. Users

Stores information about users who track their expenses.

| Column | Description |
|------|-------------|
| user_id | Unique ID for each user |
| name | User name |
| email | Unique email address |

---

### 2. Categories

Stores expense categories such as food, rent, and shopping.

| Column | Description |
|------|-------------|
| category_id | Unique category identifier |
| category_name | Name of expense category |

Example categories:

- Food  
- Rent  
- Transport  
- Shopping  
- Entertainment  

---

### 3. Expenses

Stores all expense transactions.

| Column | Description |
|------|-------------|
| expense_id | Unique expense ID |
| user_id | Reference to Users table |
| category_id | Reference to Categories table |
| amount | Expense amount |
| expense_date | Date of transaction |

Relationships:

```
Users (1) ---- (Many) Expenses
Categories (1) ---- (Many) Expenses
```

---

## Key SQL Concepts Used

This project demonstrates practical usage of:

- Database creation
- Table creation
- Primary Keys
- Foreign Keys
- Data insertion
- JOIN operations
- GROUP BY
- Aggregation functions
- HAVING clause
- Sorting results

---

## Example Analytical Queries

### Total Spending Per User

```sql
SELECT u.user_id, u.name, SUM(e.amount) AS total_spent
FROM Users u
JOIN Expenses e ON u.user_id = e.user_id
GROUP BY u.user_id, u.name;
```

---

### Budget Check (Users Spending More Than 500)

```sql
SELECT u.name, SUM(e.amount) AS total_spent
FROM Users u
JOIN Expenses e ON u.user_id = e.user_id
GROUP BY u.name
HAVING SUM(e.amount) > 500;
```

---

### Most Used Expense Category

```sql
SELECT c.category_name, COUNT(e.expense_id) AS usage_count
FROM Categories c
JOIN Expenses e ON c.category_id = e.category_id
GROUP BY c.category_name
ORDER BY usage_count DESC
LIMIT 1;
```

---

### Monthly Expense View

```sql
SELECT u.name, c.category_name, e.amount, e.expense_date
FROM Expenses e
JOIN Users u ON e.user_id = u.user_id
JOIN Categories c ON e.category_id = c.category_id
ORDER BY e.expense_date DESC;
```

---

## Skills Demonstrated

- SQL Database Design
- Relational Data Modeling
- Data Analysis using SQL
- Aggregation and Filtering
- Writing Analytical Queries

---

## Tools Used

- MySQL
- SQL Workbench / MySQL CLI
- GitHub for project documentation

---

## Future Improvements

Possible enhancements for this project:

- Add **monthly budgets**
- Create **stored procedures**
- Build **Power BI dashboard**
- Generate **monthly expense reports**
- Integrate with **Python for data analysis**

---

## Author

**Sapna Gangad**

Aspiring Data Analyst  
Skills: SQL | Excel | Python | Power BI
