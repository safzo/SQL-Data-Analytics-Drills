<div align="center">

# 📊 SQL Data Analytics Drills

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC292B?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![LeetCode](https://img.shields.io/badge/LeetCode-FFA116?style=for-the-badge&logo=leetcode&logoColor=black)

**Production-ready T-SQL queries, window functions, and data auditing drills.**

</div>

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
<summary><b>Click to expand: Deduplication via Window Functions</b></summary>

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
