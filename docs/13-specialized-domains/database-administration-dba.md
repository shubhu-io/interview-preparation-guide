---
layout: default
title: Database Administration (DBA)
parent: Specialized Domains
---

# Database Administration (DBA)

## Introduction

DBAs own databases — availability, performance, backups, and security. Roles: Database Administrator, Database Engineer, DBA (Oracle/MySQL/Postgres/MongoDB/Cassandra), Data Platform Engineer.

## What the Role Does

- Install, configure, and upgrade database servers.
- Design schemas, indexes, partitions; optimize slow queries.
- Manage backups, recovery, replication, and high availability.
- Handle user access, roles, privileges, and encryption.
- Monitor performance (locks, slow queries, resource usage).
- Capacity planning and migration (on-prem ↔ cloud, RDS etc.).

## Hiring Companies

Banks, fintech (PhonePe, Razorpay, JPMorgan), e-commerce (Flipkart, Myntra), telecoms, healthcare, and tech with large databases. Strong DBA teams at Oracle, AWS, and IT services (TCS, Infosys, Wipro).

## Core Topics

| Topic | What to Know |
|-------|--------------|
| SQL Depth | Query optimization, execution plans, indexes ([26-SQL](../../26-SQL/)) |
| Relational DBs | PostgreSQL, MySQL, Oracle: architecture, storage engines ([33-DBMS](../../33-DBMS/)) |
| NoSQL | MongoDB, Cassandra, Redis basics ([41-Databases](../../41-Databases/)) |
| Backups & Recovery | Full/incremental, PITR, restore drills, RPO/RTO |
| High Availability | Replication, failover, clustering, read replicas |
| Performance Tuning | Slow query analysis, locks, waits, buffer pools |
| Security | Privileges, encryption at rest/in transit, auditing |
| Operations | Patching, monitoring, alerting, capacity planning |
| Cloud DB | RDS, Cloud SQL, Cosmos DB, managed services |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Deep SQL + execution plans + indexing theory
Weeks 3-4:   Install and administer Postgres: users, roles, config
Weeks 5-6:   Backups, recovery, replication and HA setups
Weeks 7-8:   Performance tuning: slow queries, locks, indexing labs
Weeks 9-10:  NoSQL intro + cloud-managed databases + migrations
Weeks 11-12: Mock DBA scenarios + a hardening/monitoring portfolio
```

## Sample Interview Questions

- A query is slow. How do you diagnose and fix it? (EXPLAIN plan, indexes, stats)
- How do you recover a lost table from backups?
- Explain primary vs secondary replication and failover.
- What is deadlock? How do you detect and prevent it?
- How do you plan backup strategy to meet RPO=1h and RTO=4h?
- When would you choose a NoSQL database over SQL?
- How do you handle schema migrations without downtime?

## Projects for Portfolio

- Admin a Postgres instance: config tuning, backup automation, restore drill.
- A query tuning case study (before/after execution plans).
- Replication + failover lab (primary/standby) with documentation.
- A monitoring dashboard for DB health (slow queries, locks, disk).

## Tools to Learn

- DBs: PostgreSQL, MySQL, Oracle (free XE), MongoDB, Redis
- Tools: pgAdmin, MySQL Workbench, pg_dump, mysqldump
- Monitoring: Prometheus + pg_exporter, pgbadger
- Cloud: AWS RDS, GCP Cloud SQL
- Automation: scripts for backup/alerting, Ansible basics

## Key Links

- DBMS: [33-DBMS](../../33-DBMS/), [41-Databases](../../41-Databases/)
- SQL: [26-SQL](../../26-SQL/)
- Linux: [40-Linux](../../40-Linux/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. SQL coding without understanding execution plans.
2. Ignoring backups/recovery — the core DBA responsibility.
3. No hands-on server administration practice.
4. Weak on HA/replication concepts.
5. Forgetting security (privileges, encryption, auditing).