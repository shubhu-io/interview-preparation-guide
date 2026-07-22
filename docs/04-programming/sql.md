---
layout: default
title: SQL
parent: Programming Languages
---

# SQL

Queries, optimization, and interview preparation for relational databases.

## Introduction

SQL (Structured Query Language) is the standard language for managing and querying relational databases. SQL proficiency is tested in virtually every technical interview at FAANG companies, regardless of role.

SQL interviews go beyond simple SELECT statements. Companies test your ability to write complex JOINs, use window functions, optimize queries, understand execution plans, and think about database design.

## Key Concepts

### SQL Execution Order

```
1. FROM       — Identify tables
2. JOIN       — Combine tables
3. WHERE      — Filter rows (before grouping)
4. GROUP BY   — Group rows
5. HAVING     — Filter groups (after grouping)
6. SELECT     — Choose columns
7. DISTINCT   — Remove duplicates
8. ORDER BY   — Sort results
9. LIMIT/OFFSET — Restrict result set
```

### JOIN Types

| JOIN Type | Description | Result |
|-----------|-------------|--------|
| INNER | Matching rows in both tables | Intersection |
| LEFT | All rows in left + matching in right | Left + matches |
| RIGHT | All rows in right + matching in left | Right + matches |
| FULL | All rows in both tables | Union |
| CROSS | Cartesian product of both tables | All combinations |
| SELF | Table joined with itself | Self-referencing |

### Window Functions

```sql
function_name OVER (
    [PARTITION BY column]
    [ORDER BY column]
    [ROWS/RANGE frame_clause]
)
```

| Function | Description | Example |
|----------|-------------|---------|
| ROW_NUMBER | Sequential number | 1, 2, 3, 4, 5 |
| RANK | Rank with gaps | 1, 2, 2, 4, 5 |
| DENSE_RANK | Rank without gaps | 1, 2, 2, 3, 4 |
| LAG | Previous row value | value from row-1 |
| LEAD | Next row value | value from row+1 |

```sql
-- Rank employees by salary within each department
SELECT 
    name, department, salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_num
FROM employees;

-- Running total
SELECT 
    order_date, amount,
    SUM(amount) OVER (ORDER BY order_date) AS running_total
FROM orders;
```

### Indexing Strategies

```sql
-- B-tree index (good for equality and range)
CREATE INDEX idx_emp_name ON employees(name);

-- Composite index (order matters!)
CREATE INDEX idx_emp_dept_salary ON employees(department_id, salary);

-- Covering index (includes all columns needed by query)
CREATE INDEX idx_emp_covering ON employees(department_id, salary, name);
```

**Index Selection Rules:**
- Put the most selective column first in composite indexes
- Match index order to WHERE clause column order
- Include SELECT columns for covering indexes
- Don't over-index — each index slows down writes

### Query Optimization

```sql
-- BAD: Using function on indexed column
SELECT * FROM orders WHERE YEAR(order_date) = 2024;

-- GOOD: Use range condition
SELECT * FROM orders 
WHERE order_date >= '2024-01-01' AND order_date < '2025-01-01';

-- BAD: NOT IN with subquery
SELECT * FROM employees WHERE dept_id NOT IN (SELECT id FROM inactive_depts);

-- GOOD: Use LEFT JOIN
SELECT e.* FROM employees e
LEFT JOIN inactive_depts d ON e.dept_id = d.id
WHERE d.id IS NULL;
```

## FAQ

**Q1: What is the difference between WHERE and HAVING?**
WHERE filters rows before grouping (before GROUP BY). HAVING filters groups after aggregation (after GROUP BY). You can't use aggregate functions in WHERE but you can in HAVING.

**Q2: What is the difference between DELETE, TRUNCATE, and DROP?**
DELETE removes rows with a WHERE clause (logged, can rollback). TRUNCATE removes all rows (minimal logging, faster, resets identity). DROP removes the entire table structure and data.

**Q3: What is the N+1 query problem?**
When code fetches N records and then makes N individual queries instead of using JOINs. Solution: use JOINs, subqueries, or ORMs with eager loading.

**Q4: What is the difference between UNION and UNION ALL?**
UNION removes duplicates (slower). UNION ALL keeps all rows including duplicates (faster). Use UNION ALL unless you specifically need deduplication.

**Q5: What is a covering index?**
An index that contains all the columns needed by a query, so the database can answer the query using only the index without accessing the table data.

**Q6: What is a correlated subquery?**
A subquery that references columns from the outer query and is executed once for each row of the outer query. Usually slower than JOINs.

**Q7: What is the difference between INNER JOIN and LEFT JOIN?**
INNER JOIN returns only rows with matches in both tables. LEFT JOIN returns all rows from the left table and matching rows from the right table (NULLs for non-matches).

**Q8: When should I use a CTE vs a subquery?**
Use CTEs for readability, reusability within the same query, and recursive queries. Subqueries are fine for simple one-time references.

**Q9: What is the difference between RANK and DENSE_RANK?**
RANK assigns the same rank to ties but skips subsequent ranks (1, 2, 2, 4). DENSE_RANK assigns the same rank to ties without skipping (1, 2, 2, 3).

**Q10: What are common SQL anti-patterns?**
SELECT *, missing WHERE clause on UPDATE/DELETE, using DISTINCT to fix duplicate results, not using indexes, and functions on indexed columns.

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Using SELECT * | Always select specific columns |
| Missing WHERE on UPDATE/DELETE | Always include WHERE clause |
| Not using indexes | Add indexes on WHERE, JOIN, ORDER BY columns |
| Functions on indexed columns | Use range conditions instead |
| NULL comparison errors | Use `IS NULL` not `= NULL` |
| Cartesian product | Always specify join conditions |
| N+1 query pattern | Use JOINs instead of multiple queries |

## Best Practices

1. Use meaningful aliases (e.g., `employees e` not `employees t1`)
2. Format SQL consistently (uppercase keywords, lowercase identifiers)
3. Use CTEs for complex queries (improves readability)
4. Avoid SELECT * in production
5. Use JOINs instead of subqueries when possible
6. Index columns used in WHERE, JOIN, and ORDER BY
7. Always use parameterized queries (prevent SQL injection)
8. Use EXPLAIN to verify query execution plans

## Quick Reference

```sql
-- Running total
SUM(col) OVER (ORDER BY date)

-- Moving average
AVG(col) OVER (ORDER BY date ROWS 6 PRECEDING)

-- Rank
DENSE_RANK() OVER (PARTITION BY grp ORDER BY val DESC)

-- Previous value
LAG(col) OVER (ORDER BY date)

-- Percent of total
col * 100.0 / SUM(col) OVER ()

-- Deduplicate
ROW_NUMBER() OVER (PARTITION BY cols ORDER BY id) = 1
```
