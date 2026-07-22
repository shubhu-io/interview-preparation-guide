---
layout: default
title: Power BI
parent: Data & Analytics
---

# Power BI

## Introduction

Power BI is Microsoft's business intelligence platform for creating interactive data visualizations and reports. It enables users to connect to diverse data sources, transform data, build data models, create reports, and share dashboards. Power BI is widely used across enterprises for data-driven decision making.

Power BI encompasses several components: Power BI Desktop (report authoring), Power BI Service (cloud sharing), Power BI Mobile (mobile access), and Power Query (data transformation). Proficiency in DAX (Data Analysis Expressions) for calculations is essential.

---

## Key Concepts

| Concept | Description |
|---------|-------------|
| DAX | Formula language for calculations in Power BI |
| Star Schema | Data model with fact and dimension tables |
| Filter Context | Set of filters affecting a calculation |
| CALCULATE | Modifies filter context for complex calculations |
| Measure | Aggregate calculation evaluated dynamically |
| Calculated Column | Row-by-row calculation stored in table |
| Time Intelligence | Date-based calculations (YTD, comparisons) |
| RLS | Row-level security restricting data access |
| Power Query | ETL tool for data transformation |
| Gateway | Bridge between on-premises data and cloud |
| Aggregation Table | Pre-aggregated data for performance |
| Calculation Group | Reusable DAX calculation patterns |

---

## FAQ

### Q1: What is the difference between a measure and a calculated column?
**A:** Measures are dynamic calculations evaluated at query time based on filter context. Calculated columns are computed row-by-row during data refresh and stored. Use measures for aggregations; columns for row-level calculations.

### Q2: What is filter context?
**A:** The set of filters affecting a DAX calculation: visual filters, page filters, report filters, slicer selections, and row/column context. CALCULATE can modify this context.

### Q3: What is a star schema?
**A:** Data model design with a central fact table (measures) surrounded by dimension tables (attributes). Best practice for Power BI: improves performance, simplifies DAX, and follows dimensional modeling principles.

### Q4: What is CALCULATE?
**A:** The most important DAX function. Evaluates an expression with modified filter context. Can add, remove, or replace filters. Example: CALCULATE(SUM(Sales[Amount]), Product[Category] = "Electronics")

### Q5: What is time intelligence in DAX?
**A:** Functions for date-based calculations: YTD, QTD, MTD, period comparisons, rolling averages. Requires a properly formatted date table with continuous dates.

### Q6: What is Power Query?
**A:** Excel/Power BI's ETL tool for connecting, cleaning, and transforming data. Records transformation steps that replay on refresh. Uses M language. Handles data prep before modeling.

### Q7: What is row-level security (RLS)?
**A:** Restricts data access based on user roles. Users see only data they're authorized for. Implemented in Power BI Desktop, configured in Power BI Service.

### Q8: How do you optimize Power BI performance?
**A:** Use star schema, minimize calculated columns, use SUMMARIZE instead of ADDCOLUMNS for aggregations, reduce cardinality, use import mode over DirectQuery where possible, and optimize DAX measures.

### Q9: What is the difference between Import, DirectQuery, and Live Connection?
**A:** Import: data stored in Power BI (fastest). DirectQuery: queries source in real-time (no storage limit). Live Connection: connects to existing model (Analysis Services). Choose based on data volume and refresh needs.

### Q10: What is the difference between SUM and SUMX?
**A:** SUM sums a column. SUMX iterates over a table row-by-row, evaluating an expression for each row, then sums results. Use SUMX for row-level calculations like quantity * price.

---

## Common Mistakes

1. Using calculated columns instead of measures
2. Not using star schema design
3. Ignoring DAX performance optimization
4. Over-nesting DAX formulas without variables
5. Not setting up proper data refresh schedules
6. Ignoring RLS for sensitive data
7. Creating too many visuals on one page
8. Not using bookmarks for navigation
9. Ignoring mobile layout design
10. Not documenting data model and DAX logic

---

## Best Practices

1. Always use star schema data model
2. Prefer measures over calculated columns
3. Use variables (VAR) for readability and performance
4. Document DAX measures with descriptions
5. Use meaningful names for tables and columns
6. Test with different user roles (RLS)
7. Optimize for performance (reduce cardinality)
8. Design for mobile viewing
9. Use consistent formatting and themes
10. Implement proper governance and access controls

---

## Quick Reference

### DAX Quick Reference

| Function | Use |
|----------|-----|
| SUM, AVERAGE | Basic aggregation |
| CALCULATE | Modify filter context |
| FILTER | Return filtered table |
| ALL | Remove filters |
| SUMX | Row-by-row sum |
| DIVIDE | Safe division |
| TOTALYTD | Year-to-date |
| SAMEPERIODLASTYEAR | Year-over-year |
| RANKX | Rank items |
| SELECTEDVALUE | Get single selected value |
| RELATED | Fetch from related table |
| TOPN | Return top N rows |

### Power BI Visuals Guide

| Visual | Best For |
|--------|----------|
| Bar/Column | Comparisons |
| Line | Trends over time |
| Pie/Donut | Composition |
| Map | Geographic data |
| Card | Single KPI |
| Table/Matrix | Detailed data |
| Slicer | Interactive filtering |
| Scatter | Correlation |
| Gauge | Progress to goal |
| Waterfall | Variance analysis |

### DAX Pattern Reference

| Pattern | Example |
|---------|---------|
| Running Total | SUMX(FILTER(ALL(Table), Table[Date]<=MAX(Table[Date])), Table[Value]) |
| Percent of Total | DIVIDE([Measure], CALCULATE([Measure], ALL(Table))) |
| YoY Growth | DIVIDE([Measure] - CALCULATE([Measure], SAMEPERIODLASTYEAR('Date'[Date])), CALCULATE([Measure], SAMEPERIODLASTYEAR('Date'[Date]))) |
| Rolling Average | AVERAGEX(DATESINPERIOD('Date'[Date], MAX('Date'[Date]), -N, DAY), [Measure]) |
| Dynamic Ranking | RANKX(ALL(Table[Column]), [Measure], , DESC, DENSE) |

---

## Learning Roadmap

### Phase 1: Basics (Week 1-2)
- Power BI Desktop interface
- Connecting to data sources
- Basic visualizations

### Phase 2: Data Modeling (Week 3-4)
- Star schema design
- Relationships between tables
- Basic DAX (SUM, AVERAGE, CALCULATE)

### Phase 3: DAX Formulas (Week 5-7)
- Filter context
- Time intelligence functions
- Iterator functions (SUMX, AVERAGEX)
- Variables (VAR)

### Phase 4: Advanced (Week 8-10)
- Row-level security (RLS)
- Performance optimization
- Power BI Service features

### Phase 5: Production (Week 11-12)
- Dashboard design best practices
- Deployment pipelines
- Governance and security
