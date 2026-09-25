# FINAL_PROJECT_

# UNIVERSITY-DATABASE-MANAGEMENT

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white) ![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge) ![Queries](https://img.shields.io/badge/Queries-16-success?style=for-the-badge) ![Level](https://img.shields.io/badge/Level-Beginner-orange?style=for-the-badge)

---

## 📌 Project Overview

This project builds a small **university management database** with **Departments, Students, Courses, Instructors,** and **Enrollments** tables, then performs full CRUD operations and answers real academic questions with 16 SQL tasks.

It works as a practice sheet and a quick reference for **table design**, **joins**, **subqueries**, **aggregate functions**, **window functions**, and **CASE logic**.

---

## 🗂️ Database Schema

### 1️⃣ `Departments_FPP`

| Column | Type | Description |
|---|---|---|
| DepartmentID | INT (PK) | Unique ID for each department |
| DepartmentName | VARCHAR(100) | Name of the department |

### 2️⃣ `Students_FPP`

| Column | Type | Description |
|---|---|---|
| StudentID | INT (PK) | Unique ID for each student |
| FirstName | VARCHAR(50) | Student's first name |
| LastName | VARCHAR(50) | Student's last name |
| Email | VARCHAR(100) | Contact email |
| BirthDate | DATE | Date of birth |
| EnrollmentDate | DATE | Date the student enrolled |

### 3️⃣ `Courses_FPP`

| Column | Type | Description |
|---|---|---|
| CourseID | INT (PK) | Unique ID for each course |
| CourseName | VARCHAR(100) | Name of the course |
| DepartmentID | INT (FK) | References `Departments_FPP(DepartmentID)` |
| Credits | INT | Number of credits |

### 4️⃣ `Instructors_FPP`

| Column | Type | Description |
|---|---|---|
| InstructorID | INT (PK) | Unique ID for each instructor |
| FirstName | VARCHAR(50) | Instructor's first name |
| LastName | VARCHAR(50) | Instructor's last name |
| Email | VARCHAR(100) | Contact email |
| DepartmentID | INT (FK) | References `Departments_FPP(DepartmentID)` |

### 5️⃣ `Enrollments_FPP`

| Column | Type | Description |
|---|---|---|
| EnrollmentID | INT (PK) | Unique ID for each enrollment |
| StudentID | INT (FK) | References `Students_FPP(StudentID)` |
| CourseID | INT (FK) | References `Courses_FPP(CourseID)` |
| EnrollmentDate | DATE | Date of enrollment |

**Relationships**

```
Departments_FPP 1───N Courses_FPP
Departments_FPP 1───N Instructors_FPP
Students_FPP 1───N Enrollments_FPP
Courses_FPP 1───N Enrollments_FPP
```

---

## ⚙️ Features / Operations Covered

| **🔹 CRUD** <br> Create, Read, Update, Delete on all 5 tables | **🔹 Joins** <br> `INNER JOIN`: students with their courses <br> `LEFT JOIN`: all students and courses, if any |
|---|---|
| **🔹 Aggregates** <br> `COUNT`, `AVG`, `GROUP BY`, `HAVING` | **🔹 Subqueries** <br> Students enrolled in high-enrollment courses |
| **🔹 Date Functions** <br> `EXTRACT` year from enrollment date | **🔹 String Functions** <br> `CONCAT` for instructor full name |
| **🔹 Window Functions** <br> Running total of enrollments with `COUNT() OVER` | **🔹 CASE Statements** <br> Label students as Senior / Junior by enrollment year |

---

## 🔗 Query Index

| # | Task | Concept |
|---|---|---|
| 1 | CRUD on all 5 tables | Create / Read / Update / Delete |
| 2 | Students enrolled after 2022 | Filtering |
| 3 | Courses offered by Mathematics dept (limit 5) | Join + LIMIT |
| 4 | Students per course (more than 5) | GROUP BY + HAVING |
| 5 | Students enrolled in both SQL & Data Structures | Join + HAVING |
| 6 | Students enrolled in either course | Join + DISTINCT |
| 7 | Average credits across all courses | Aggregate |
| 8 | Max salary of CS instructors | *(not implemented — no Salary column)* |
| 9 | Students per department | LEFT JOIN + GROUP BY |
| 10 | Students with their courses | INNER JOIN |
| 11 | All students with courses, if any | LEFT JOIN |
| 12 | Students in courses with 10+ students | Subquery |
| 13 | Extract enrollment year | Date Function |
| 14 | Instructor full name | String Function (CONCAT) |
| 15 | Running total of enrollments | Window Function |
| 16 | Label students Senior / Junior | CASE Statement |

---

## 🛠️ Tech Stack

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=flat-square&logo=postgresql&logoColor=white) ![pgAdmin](https://img.shields.io/badge/pgAdmin-336791?style=flat-square&logo=postgresql&logoColor=white) ![MySQL](https://img.shields.io/badge/MySQL_compatible*-4479A1?style=flat-square&logo=mysql&logoColor=white)

> ⚠️ **Note:** `EXTRACT(...)` and `CURRENT_DATE - INTERVAL` are PostgreSQL syntax.
> MySQL uses `YEAR(...)` and `DATE_SUB(...)` for the same logic.

---

## ▶️ How to Run

```
1. Open your SQL client (pgAdmin / DBeaver / psql)
2. CREATE DATABASE university_db;
3. Run the .sql script (it creates the tables, inserts data
   and runs all CRUD operations + queries)
4. Check the results in your SQL client's output panel
```

<img width="1408" height="768" alt="image_f9cae87a jpg" src="https://github.com/user-attachments/assets/37108f3a-d544-42bc-9ed5-d00a988b8872" />

---

## 🧠 What You Will Learn

- 🔑 Designing tables with primary and foreign keys
- 🔀 Combining data from related tables with INNER and LEFT joins
- 🧩 Filtering data dynamically with subqueries
- 📅 Extracting date parts and using CASE-based logic
- 📈 Running totals with window functions
- 📊 Aggregating and grouping data with COUNT, AVG, HAVING

---

## 📁 File Structure

```
├── university_database.sql   # tables + sample data + CRUD + 16 queries
└── README.md                 # project documentation (this file)
```

---

## 🚀 Future Improvements

- [ ] Fix subquery in task 12 to reference `Enrollments_FPP` instead of `Enrollments`
- [ ] Add a `Salary` column to `Instructors_FPP` to implement task 8
- [ ] Add more sample data for richer results
- [ ] Add CTE (`WITH`) examples
- [ ] Add views and stored procedures
- [ ] Port date functions to MySQL / SQL Server syntax

---

### 👤 Author

**Bhavika Thadani* 
📍 Ahmedabad

Made with ❤️ to strengthen SQL fundamentals: joins, subqueries, and window functions.

⭐ **If you found this project useful, consider giving it a star!**
