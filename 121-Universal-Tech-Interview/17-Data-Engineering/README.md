# 17 - Data Engineering

> Building the pipelines, warehouses, and platforms that move and store data at scale.

## What It Covers

- **Core**: ETL/ELT, Data Pipelines, Batch vs Streaming, Data Modeling (Star/Snowflake)
- **Warehouses**: Snowflake, BigQuery, Redshift, Databricks, Lakehouse
- **Pipeline Tools**: Airflow, dbt, Spark, Kafka, Flink
- **Quality**: Data Quality, Idempotency, Backfills, Lineage, Data Governance

## Sample Interview Questions

1. Design a pipeline that ingests user events and aggregates daily.
2. Batch vs streaming — when do you use each?
3. Explain the medallion architecture (bronze/silver/gold).
4. How do you make a pipeline idempotent and handle retries?
5. Star schema vs snowflake schema?
6. How do you handle late or duplicate data in Kafka?
7. How do you ensure data quality in a warehouse?

## Prep Tips

- Know the ETL vs ELT difference and modern lakehouse trends.
- Be able to design a pipeline: sources → ingestion → processing → warehouse → BI.
- Practice SQL heavily — it's the core of data engineering interviews.

## Related Repo Folders

- [70-Data-Analytics](../../70-Data-Analytics/)
- [41-Databases](../../41-Databases/)
- [26-SQL](../../26-SQL/)
- [27-Python](../../27-Python/)
- [42-System-Design](../../42-System-Design/)
