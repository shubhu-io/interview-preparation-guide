---
layout: default
title: Data Engineering
parent: Specialized Domains
---

# Data Engineering

## Introduction

Data engineers build the pipelines that move, clean, store, and serve data for analytics and ML. Roles: Data Engineer, Big Data Engineer, ETL Developer, Data Platform Engineer.

## What the Role Does

- Design batch and streaming pipelines (Spark, Airflow, Kafka, Flink).
- Build data warehouses/lakehouses (Snowflake, BigQuery, Redshift, Databricks).
- Model data: star schemas, dimension modeling, medallion architecture.
- Implement schemas, quality checks, and orchestration.
- Serve data to analysts, BI tools, and ML teams.

## Hiring Companies

Data-heavy companies: Google, Meta, Amazon, Netflix, Airbnb, Databricks, Snowflake, and India: Flipkart, Swiggy, Zomato, PhonePe, Razorpay, Fractal, Tiger Analytics.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| SQL & Modeling | Advanced SQL, dimensional modeling, dbt ([26-SQL](../../26-SQL/), [41-Databases](../../41-Databases/)) |
| Programming | Python (+ pandas/polars), Spark/PySpark ([27-Python](../../27-Python/)) |
| Orchestration | Airflow, Prefect, Dagster — DAGs, scheduling, retries |
| Streaming | Kafka, Flink, Spark Structured Streaming, CDC |
| Warehouse/Lake | Snowflake, BigQuery, Redshift, Iceberg/Delta/Parquet |
| ETL/ELT | Extraction, transformation, idempotency, backfills |
| Data Quality | Expectations, profiling, monitoring, reconciliation |
| Cloud | GCP/AWS/Azure data services |
| ML-ready data | Feature stores, data lineage, versioning |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Advanced SQL + Python/data libraries
Weeks 3-4:   Data modeling: star schema, dbt project
Weeks 5-6:   Airflow: build and schedule a pipeline
Weeks 7-8:   Batch processing with Spark/PySpark
Weeks 9-10:  Streaming with Kafka + warehouse patterns
Weeks 11-12: Data-quality monitoring + a complete pipeline project
```

## Sample Interview Questions

- Design a data pipeline that ingests app events and computes daily aggregates.
- Star schema vs snowflake schema — when do you use each?
- How do you make an ETL job idempotent and deal with failures/backfills?
- What is the difference between batch and streaming? Give examples.
- How do you ensure data quality in a pipeline?
- Explain the medallion architecture (bronze/silver/gold).
- How would you handle late or duplicate events in Kafka?

## Projects for Portfolio

- End-to-end pipeline: Kafka/API → Airflow → Spark → warehouse → dashboards.
- A dbt project with tests and documentation on real data.
- Streaming pipeline processing live events with checkpointing.
- A scheduling + monitoring setup with retries, alerts, and lineage.

## Tools to Learn

- Orchestration: Airflow, Prefect
- Processing: Spark, PySpark, Spark SQL
- Streaming: Kafka, Flink, Debezium (CDC)
- Warehouse: Snowflake, BigQuery, DuckDB (local), ClickHouse
- Transformation: dbt
- Cloud: AWS (S3, Glue, EMR), GCP (BigQuery, Dataflow, Pub/Sub)

## Key Links

- Databases: [41-Databases](../../41-Databases/), [26-SQL](../../26-SQL/)
- SQL: [26-SQL](../../26-SQL/)
- Python: [27-Python](../../27-Python/)
- Data Analytics/BI: [70-Data-Analytics](../../70-Data-Analytics/), [72-Power-BI](../../72-Power-BI/), [73-Tableau](../../73-Tableau/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Notebook-only Python with no production pipeline experience.
2. Ignoring orchestration and scheduling — a core part of the role.
3. Weak SQL — the #1 data engineering interview topic.
4. Not thinking about failure modes: retries, backfills, idempotency.
5. No data-quality or monitoring story.