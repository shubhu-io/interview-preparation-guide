---
layout: default
title: DBMS
parent: Core CS Fundamentals
---

# DBMS

A Database Management System (DBMS) is software that interacts with users, applications, and the database itself to capture and analyze data. It provides interfaces for CRUD operations on structured data.

## Key Concepts

| Concept | Description |
|---------|-------------|
| Primary Key | Unique, non-null identifier for each row |
| Foreign Key | References primary key of another table; enforces referential integrity |
| Normalization | Process of organizing data to minimize redundancy (1NF → BCNF) |
| ACID | Atomicity, Consistency, Isolation, Durability — transaction properties |
| B+ Tree | Balanced tree with all data in linked leaf nodes; O(log n) operations |
| MVCC | Multi-Version Concurrency Control — readers don't block writers |
| 2PL | Two-Phase Locking — growing (acquire) and shrinking (release) phases |

## Normalization Forms

| Form | Rule |
|------|------|
| 1NF | Atomic values, no repeating groups |
| 2NF | 1NF + no partial dependencies |
| 3NF | 2NF + no transitive dependencies |
| BCNF | Every determinant is a candidate key |
| 4NF | No multi-valued dependencies |

## SQL Sub-languages

| Category | Commands |
|----------|----------|
| DDL | CREATE, ALTER, DROP, TRUNCATE |
| DML | SELECT, INSERT, UPDATE, DELETE |
| DCL | GRANT, REVOKE |
| TCL | COMMIT, ROLLBACK, SAVEPOINT |

## FAQ (Top 10)

**Q1: What is the difference between DELETE, TRUNCATE, and DROP?**
DELETE is DML (with WHERE, rollback possible, fires triggers). TRUNCATE is DDL (removes all rows, faster). DROP is DDL (removes entire table).

**Q2: What is the difference between WHERE and HAVING?**
WHERE filters rows before grouping/aggregation. HAVING filters groups after aggregation.

**Q3: What is a covering index?**
An index that includes all columns needed by a query, so the database answers entirely from the index without table lookup.

**Q4: What is the N+1 query problem?**
Loading N items then making 1 additional query per item for related data. Solution: JOINs or eager loading.

**Q5: Explain ACID properties.**
Atomicity (all or nothing), Consistency (valid state transitions), Isolation (concurrent transactions independent), Durability (committed data survives failures).

**Q6: What is the difference between INNER JOIN and LEFT JOIN?**
INNER JOIN returns only matching rows. LEFT JOIN returns all rows from left table plus matching from right (NULL if no match).

**Q7: What is MVCC?**
Multi-Version Concurrency Control creates multiple versions of data items. Readers see a consistent snapshot; writers create new versions. No read-write blocking.

**Q8: Explain B+ Tree indexing.**
Balanced tree with all data in linked leaf nodes. Internal nodes hold routing keys. O(log n) height. Efficient for range and equality queries.

**Q9: What is the CAP theorem?**
A distributed system can guarantee at most 2 of 3: Consistency, Availability, Partition tolerance. Partition tolerance is required in practice.

**Q10: What is 2PL (Two-Phase Locking)?**
Ensures serializable schedules. Growing phase: acquire locks. Shrinking phase: release locks. Guarantees conflict-serializability.

## Common Mistakes

1. Not using indexes on JOIN columns
2. SELECT * in production queries
3. Ignoring N+1 query problems
4. Not using EXPLAIN to analyze slow queries
5. Over-normalization leading to excessive JOINs
6. Ignoring NULL behavior (NULL = NULL is NULL, not TRUE)
7. Missing foreign key constraints

## Best Practices

1. Always define primary keys on every table
2. Index columns used in WHERE, JOIN, ORDER BY
3. Normalize to at least 3NF unless performance requires denormalization
4. Use parameterized queries to prevent SQL injection
5. Use EXPLAIN before optimizing slow queries
6. Keep transactions short
7. Use connection pooling

## Quick Reference

```sql
-- Find duplicate emails
SELECT email, COUNT(*) FROM Employee GROUP BY email HAVING COUNT(*) > 1;

-- Rank employees by salary within department
SELECT name, salary, RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rank
FROM Employee;

-- Running total
SELECT SUM(amount) OVER (ORDER BY date) AS running_total FROM transactions;
```
