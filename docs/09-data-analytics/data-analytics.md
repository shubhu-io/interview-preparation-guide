---
layout: default
title: Data Analytics
parent: Data & Analytics
---

# Data Analytics

## Introduction

Data Analytics is the process of examining datasets to draw conclusions, identify patterns, and support decision-making. It encompasses exploratory data analysis, statistical testing, visualization, and communicating insights to stakeholders. Data analysts bridge raw data and business decisions, transforming numbers into actionable insights.

Interview questions typically test SQL proficiency, statistical knowledge, analytical thinking, and ability to communicate findings clearly.

---

## Key Concepts

| Concept | Description |
|---------|-------------|
| EDA | Systematic exploration of data before modeling |
| p-value | Probability of observing results assuming null hypothesis is true |
| Confidence Interval | Range likely containing true parameter value |
| Statistical Significance | Result unlikely due to random chance |
| Effect Size | Magnitude of difference between groups |
| Selection Bias | Non-random sampling affecting results |
| Simpson's Paradox | Trend appearing in groups but reversing in aggregate |
| Correlation vs Causation | Association doesn't imply causation |
| Cohort Analysis | Tracking user groups by shared characteristic over time |
| Funnel Analysis | Tracking user progression through sequential steps |
| AARRR | Acquisition, Activation, Retention, Revenue, Referral |
| North Star Metric | Single metric capturing core product value |

---

## FAQ

### Q1: What is the difference between exploratory and confirmatory analysis?
**A:** EDA discovers patterns and generates hypotheses from data. Confirmatory analysis tests specific hypotheses using statistical methods. EDA is open-ended; confirmatory follows pre-specified procedures.

### Q2: When do you use mean vs median?
**A:** Use mean for symmetric distributions without outliers. Use median for skewed distributions or data with outliers, as it's robust to extreme values.

### Q3: What is a p-value?
**A:** The probability of observing results at least as extreme as the data, assuming the null hypothesis is true. A small p-value (< 0.05) suggests the observed effect is unlikely due to chance alone.

### Q4: What is the difference between correlation and causation?
**A:** Correlation measures association between variables. Causation means one variable causes changes in another. Correlation can arise from confounding variables, reverse causation, or coincidence. A/B testing establishes causation.

### Q5: How do you handle missing data?
**A:** Options: deletion (listwise, pairwise), imputation (mean, median, mode, KNN, regression), indicator variables, or using algorithms that handle missing data natively. Choice depends on missingness mechanism (MCAR, MAR, MNAR).

### Q6: What is Simpson's Paradox?
**A:** A trend that appears in separate groups but reverses when groups are combined. Caused by confounding variables. Example: Treatment appears worse overall but better within each subgroup.

### Q7: How do you calculate sample size for A/B testing?
**A:** Depends on: minimum detectable effect, significance level (alpha), power (1-beta), and baseline conversion rate. Use power analysis formulas or calculators (typically 1000+ per variant).

### Q8: What is the difference between Type I and Type II errors?
**A:** Type I (false positive): rejecting a true null hypothesis. Type II (false negative): failing to reject a false null hypothesis. Trade-off controlled by significance level and sample size.

### Q9: What is statistical power?
**A:** Probability of correctly rejecting a false null hypothesis (detecting a real effect). Higher power = lower chance of Type II error. Typically want power >= 0.80.

### Q10: What is the multiple comparisons problem?
**A:** Testing many hypotheses increases chance of false positives. Correction methods: Bonferroni (conservative), Benjamini-Hochberg (FDR control), or pre-registering primary analysis.

---

## Common Mistakes

1. Confusing correlation with causation
2. Not checking data quality before analysis
3. Using wrong statistical test
4. Ignoring sample size requirements
5. Cherry-picking data to support conclusions
6. Not accounting for seasonality in time series
7. Drawing conclusions from too-small samples
8. Ignoring confounding variables
9. Over-complicating visualizations
10. Not validating assumptions of statistical tests

---

## Best Practices

1. Always check data quality first
2. Visualize before calculating
3. State assumptions explicitly
4. Use appropriate statistical tests
5. Report confidence intervals, not just point estimates
6. Consider practical significance, not just statistical
7. Document analysis decisions
8. Communicate clearly to non-technical stakeholders
9. Validate findings with multiple approaches
10. Be transparent about limitations

---

## Quick Reference

### Statistical Tests Guide

| Test | Use Case | Data Type |
|------|----------|-----------|
| t-test | Compare 2 means | Continuous |
| Chi-square | Test independence | Categorical |
| ANOVA | Compare 3+ means | Continuous |
| Mann-Whitney | Compare 2 groups (non-parametric) | Ordinal/continuous |
| Fisher's exact | Small sample categorical | Categorical |
| Wilcoxon signed-rank | Paired non-parametric | Ordinal/continuous |
| Kruskal-Wallis | Compare 3+ groups (non-parametric) | Ordinal/continuous |

### SQL Key Functions

```
Window: ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, SUM OVER
Aggregation: COUNT, SUM, AVG, MIN, MAX, GROUP BY
Filtering: WHERE, HAVING
Joining: INNER, LEFT, RIGHT, FULL, CROSS
CTEs: WITH ... AS (SELECT ...)
Pivoting: CASE WHEN + GROUP BY
```

### Visualization Selection

| Data Type | Best Chart |
|-----------|-----------|
| Trend over time | Line chart |
| Comparison | Bar chart |
| Distribution | Histogram, box plot |
| Relationship | Scatter plot |
| Composition | Stacked bar, pie (small categories) |
| Ranking | Horizontal bar chart |

### Analysis Patterns

| Pattern | Description |
|---------|-------------|
| Period-over-period | Compare current vs previous period |
| Year-over-year | Compare same period last year |
| Rolling average | Smooth time series with moving window |
| Cumulative sum | Running total over time |
| Contribution analysis | What drives a metric change |

---

## Learning Roadmap

### Phase 1: Foundations (Week 1-2)
- SQL (queries, joins, window functions)
- Excel/Google Sheets mastery
- Basic statistics

### Phase 2: Analysis Techniques (Week 3-4)
- Exploratory Data Analysis (EDA)
- Descriptive statistics
- Data visualization principles

### Phase 3: Statistical Methods (Week 5-6)
- Hypothesis testing
- A/B testing
- Confidence intervals

### Phase 4: Business Analytics (Week 7-8)
- KPI definition and tracking
- Cohort and funnel analysis
- Metrics frameworks (AARRR, North Star)

### Phase 5: Advanced (Week 9-12)
- Advanced SQL (CTEs, pivots)
- Dashboard design
- Storytelling with data
