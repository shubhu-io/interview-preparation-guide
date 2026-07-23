---
layout: default
title: Databases
parent: Core CS Fundamentals
---

# Databases

Databases are organized collections of structured data stored electronically, providing efficient storage, retrieval, and manipulation through query languages like SQL. Essential for all backend and data engineering roles.

## Key Concepts

| Concept | Description |
|---------|-------------|
| Normalization | Organizing data to minimize redundancy (1NF → BCNF) |
| Indexing | B-Tree, Hash, Composite indexes for fast data retrieval |
| ACID | Atomicity, Consistency, Isolation, Durability |
| Isolation Levels | Read Uncommitted → Read Committed → Repeatable Read → Serializable |
| Query Optimization | Using EXPLAIN, indexes, JOINs, and CTEs for performance |
| CAP Theorem | Distributed systems guarantee at most 2 of 3: C, A, P |
| N+1 Problem | Loading N items then 1 query per item; solve with JOINs or eager loading |

## Normalization Forms

| Form | Rule | Fix |
|------|------|-----|
| 1NF | Atomic values, no repeating groups | Flatten into rows |
| 2NF | No partial dependencies | Split composite key tables |
| 3NF | No transitive dependencies | Extract dependent tables |
| BCNF | Every determinant is a candidate key | Decompose further |

## SQL Quick Reference

| Operation | SQL |
|-----------|-----|
| Join | `SELECT * FROM a JOIN b ON a.id = b.a_id;` |
| Group by | `SELECT dept, COUNT(*) FROM emp GROUP BY dept;` |
| Window function | `ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC)` |
| CTE | `WITH cte AS (SELECT ...) SELECT * FROM cte;` |
| Subquery | `WHERE id IN (SELECT id FROM t2)` |

## Transaction Isolation Levels

| Level | Dirty Read | Non-Repeatable Read | Phantom Read |
|-------|------------|---------------------|--------------|
| Read Uncommitted | Yes | Yes | Yes |
| Read Committed | No | Yes | Yes |
| Repeatable Read | No | No | Yes |
| Serializable | No | No | No |

## Index Types

| Type | Description | Best For |
|------|-------------|----------|
| B-Tree | Balanced tree, default | Range queries, general purpose |
| Hash | Hash table, O(1) | Exact match only |
| Composite | Multiple columns | Queries filtering on multiple columns |
| Covering | Includes all query columns | Eliminates table lookup |

## FAQ (Top 10)

**Q1: What is the difference between WHERE and HAVING?**
WHERE filters rows before GROUP BY. HAVING filters groups after aggregation. WHERE cannot use aggregate functions; HAVING can.

**Q2: What is a covering index?**
An index containing all columns needed by a query, so the database answers entirely from the index without table lookup. Use EXPLAIN to verify ("Using index").

**Q3: What is the N+1 query problem?**
Loading N items then making 1 additional query per item for related data. Solutions: JOINs, IN clause, eager loading (ORM preloading), batch loading.

**Q4: What is the difference between clustered and non-clustered index?**
Clustered: determines physical row order, one per table. Non-clustered: separate structure with pointers, multiple per table.

**Q5: What is a CTE?**
Common Table Expression: named temporary result set using WITH clause. Improves readability, can be referenced multiple times, supports recursion.

**Q6: What is the CAP theorem?**
Distributed systems guarantee at most 2 of: Consistency, Availability, Partition tolerance. Partition tolerance is required, so choose CP or AP.

**Q7: How do you optimize a slow SQL query?**
Run EXPLAIN → add indexes → select specific columns → filter early → avoid functions on indexed columns → use CTEs → update statistics.

**Q8: What is denormalization and when to use it?**
Intentionally introducing redundancy for read performance. Use for read-heavy workloads, reporting, analytics. Trade-off: slower writes, data duplication.

**Q9: What is the difference between DELETE, TRUNCATE, and DROP?**
DELETE: DML, with WHERE, rollback possible, fires triggers. TRUNCATE: DDL, removes all rows, faster. DROP: DDL, removes entire table.

**Q10: What is connection pooling?**
Reusing database connections instead of creating new ones per request. Benefits: reduced overhead, bounded resources, improved performance. Tools: PgBouncer, HikariCP.

## Common Mistakes

| Mistake | Solution |
|---------|----------|
| SELECT * in production | Select only needed columns |
| Missing indexes on JOIN columns | Index all foreign keys |
| N+1 queries | Use JOINs or eager loading |
| Not using EXPLAIN | Always analyze slow queries |
| Over-normalization | Denormalize for read-heavy patterns |

## Best Practices

1. Index strategically — not every column needs an index
2. Use parameterized queries to prevent SQL injection
3. Batch operations — bulk inserts/updates instead of row-by-row
4. Monitor slow queries with slow query log
5. Keep transactions short
6. Use connection pooling
7. Design schema to match access patterns
8. Backup regularly and test restores

## Quick Reference

```
SQL Joins: INNER, LEFT, RIGHT, FULL, CROSS, SELF
Aggregates: COUNT(), SUM(), AVG(), MIN(), MAX()
Window: ROW_NUMBER(), RANK(), LAG(), LEAD()
ACID: Atomicity, Consistency, Isolation, Durability
Index: B-Tree (ranges), Hash (equality), Composite (multi-column)
Denormalize for reads; Normalize for writes
```
