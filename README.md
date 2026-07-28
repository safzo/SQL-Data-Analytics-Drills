<div align="center">

# 📊 SQL Data Analytics Drills

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC292B?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![LeetCode](https://img.shields.io/badge/LeetCode-FFA116?style=for-the-badge&logo=leetcode&logoColor=black)

**Production-ready T-SQL queries, window functions, and data auditing drills.**

</div>

---

## 📖 About This Repository

This repository serves as a dedicated hands-on sandbox for sharpening advanced **T-SQL query mechanics, database auditing patterns, and algorithmic problem-solving**. 

Rather than focusing solely on basic `SELECT` statements, this collection demonstrates production-ready SQL logic designed to clean messy data, reconcile operational records, and optimize database performance.

---

### 💡 Core Focus Areas

* **Algorithmic Problem Solving:** Structured, highly-commented solutions to standardized **LeetCode SQL** challenges covering multi-table joins, conditional aggregations, and subquery logic.
* **Real-World Operational Analytics:** Practical T-SQL scripts modeled after manufacturing ERP scenarios—including data deduplication, physical vs. ERP balance reconciliation, and transactional audit trails.
* **Advanced Query Patterns:** Extensive use of Common Table Expressions (**CTEs**), Window Functions (`ROW_NUMBER()`, `DENSE_RANK()`, `LEAD/LAG`), and dynamic data transformation (`CASE WHEN`, `CAST/CONVERT`).
* **Query Quality & Performance:** Focus on writing clean, readable T-SQL code structured to reduce query latency and ensure high data fidelity.

---

### 🛠️ Tech Stack & Tools

* **Database Engine:** Microsoft SQL Server (T-SQL)
* **Development Tools:** SQL Server Management Studio (SSMS), VS Code
* **Platforms:** LeetCode SQL 50, Local SQL Sandbox

---

## 🎯 Progress Checklist

- [x] **Phase 1:** Core `SELECT`, `WHERE`, and basic filtering drills
- [ ] **Phase 2:** Multi-table `JOIN` operations & conditional aggregations
- [ ] **Phase 3:** Advanced CTEs and Window Functions (`ROW_NUMBER`, `DENSE_RANK`)
- [ ] **Phase 4:** T-SQL query performance tuning & indexing strategies

---

## 🛠️ Topic Overview

| Module | Core Concepts | Status |
| :--- | :--- | :---: |
| **LeetCode SQL 50** | Basic filtering, Joins, Subqueries | 🟡 In Progress |
| **T-SQL Sandbox** | Data hygiene, Deduplication, Reconciliation | 🟢 Active |

---

## 📌 Featured Query Solution

<details>
<summary>Deduplication via Window Functions</summary>

```sql
WITH RankedEntries AS (
    SELECT 
        LogID,
        DepartmentID,
        Quantity,
        EntryTimestamp,
        ROW_NUMBER() OVER (
            PARTITION BY DepartmentID, Quantity, CAST(EntryTimestamp AS DATE) 
            ORDER BY EntryTimestamp DESC
        ) AS RowNum
    FROM OperationalLogs
)
SELECT LogID, DepartmentID, Quantity, EntryTimestamp
FROM RankedEntries
WHERE RowNum = 1;
