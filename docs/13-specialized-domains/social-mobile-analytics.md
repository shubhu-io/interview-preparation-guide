---
layout: default
title: Social & Mobile Analytics
parent: Specialized Domains
---

# Social & Mobile Analytics

## Introduction

Social and mobile analytics turns product events into decisions. Analysts and analytics engineers measure user behavior, build funnels, compute retention, run experiments, and size the impact of product changes. Roles: Data Analyst, Growth Analyst, Product Analyst, Mobile Analytics Engineer, Data Scientist (analytics).

## What the Role Does

- Instrument apps and websites (SDK/event tracking) and own data quality.
- Build dashboards and reports for product and growth teams.
- Answer questions like: why did retention drop? which cohort converts best?
- Run A/B experiments and analyze statistical significance.
- Build attribution models to understand where users come from.
- Work with data engineers to define the event schema and pipelines.

## Hiring Companies

Meta, Google, TikTok, Snap, Spotify, Amazon, and India: ShareChat, Glance, InMobi, Hotstar (Disney+ Hotstar), PhonePe, CRED, Meesho, Swiggy, Zomato, and every consumer app.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| SQL | Joins, window functions, CTEs, group-by, dates ([26-SQL](../../26-SQL/)) |
| Statistics | A/B testing, p-values, confidence intervals, power ([74-Statistics](../../74-Statistics/)) |
| Product Metrics | DAU/WAU/MAU, retention, churn, CAC, LTV, stickiness |
| Funnel & Cohort | Funnel analysis, cohort retention tables, engagement curves |
| Analytics Tools | Google Analytics 4, Firebase, Mixpanel, Amplitude, CleverTap, Segment |
| Attribution | Last-click, multi-touch, media mix models, UTM tagging |
| Data Visualization | Looker, Tableau, Power BI, Metabase ([72-Power-BI](../../72-Power-BI/), [73-Tableau](../../73-Tableau/)) |
| Experimentation | A/B/n tests, guardrail metrics, experiment platforms |
| Python | pandas, exploratory analysis, notebooks ([27-Python](../../27-Python/)) |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   SQL mastery (window functions, complex joins)
Weeks 3-4:   Statistics for A/B testing + product metrics
Weeks 5-6:   Funnel/cohort/retention analysis concepts + case studies
Weeks 7-8:   Analytics tools (GA4, Mixpanel, Firebase) hands-on
Weeks 9-10:  Experimentation + attribution modeling
Weeks 11-12: Mock product-analytics case interviews + portfolio
```

## Sample Interview Questions

- Write a SQL query for day-7 retention of new users.
- DAU dropped 10% week-over-week. How would you investigate?
- Design an A/B test to increase push-notification opt-in. What are your guardrails?
- How do you measure the impact of a new onboarding flow?
- Explain last-touch vs multi-touch attribution. When would you use each?
- What metrics would you track for a social feed feature?

## Projects for Portfolio

- Build a cohort-retention dashboard for a public dataset (Google Analytics Sample, retail datasets).
- Instrument a small app with an event tracker (Firebase/Mixpanel) and analyze user flow.
- Run a SQL deep-dive on a large dataset and publish insights.
- Design an A/B test plan for a real product feature with power analysis.

## Tools to Learn

- SQL: BigQuery, Postgres, MySQL
- Python: pandas, matplotlib, scipy, statsmodels
- Analytics: GA4, Firebase Analytics, Mixpanel/Amplitude/CleverTap, Segment
- Viz: Looker, Tableau, Power BI, Metabase

## Key Links

- SQL: [26-SQL](../../26-SQL/)
- Statistics: [74-Statistics](../../74-Statistics/)
- Data Analytics: [70-Data-Analytics](../../70-Data-Analytics/)
- Excel/Power BI/Tableau: [71-Excel](../../71-Excel/), [72-Power-BI](../../72-Power-BI/), [73-Tableau](../../73-Tableau/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Giving answers without SQL or a concrete analysis framework.
2. Ignoring data-quality caveats (funnels are only as good as the instrumentation).
3. Not defining metrics before proposing analysis.
4. Forgetting statistical significance when discussing A/B results.
5. Not tying analysis to a business decision — every answer should end with a recommendation.
