---
layout: default
title: Tableau
parent: Data & Analytics
---

# Tableau

## Introduction

Tableau is a leading data visualization and business intelligence platform. It enables users to create interactive, shareable dashboards from various data sources. Tableau's drag-and-drop interface makes it accessible to business users while offering advanced analytical capabilities through calculated fields, LOD expressions, and table calculations.

Tableau Desktop is for creating visualizations, Tableau Server/Online for sharing and collaboration, and Tableau Prep for data preparation. Mastery of Tableau demonstrates strong data visualization and analytical skills valued across industries.

---

## Key Concepts

| Concept | Description |
|---------|-------------|
| LOD Expression | Level of Detail expression overriding visual granularity |
| Table Calculation | Computation on marks in the visual |
| Measure | Quantitative numeric field |
| Dimension | Categorical field defining level of detail |
| Shelf | Area for placing fields (Columns, Rows, Filters) |
| Mark | Individual data point in a visualization |
| Extract | Local cached copy of data for performance |
| Data Blend | Combining data from multiple sources |
| Story Point | Sequential narrative with multiple visualizations |
| Action | Interactive behavior linking sheets/dashboards |
| Hierarchy | Drill-down path for dimensions |
| Dual Axis | Two measures on same chart with separate axes |

---

## FAQ

### Q1: What is the difference between FIXED, INCLUDE, and EXCLUDE LOD expressions?
**A:** FIXED computes at specified dimensions regardless of visual. INCLUDE adds dimensions to the calculation. EXCLUDE removes dimensions. FIXED is most common and fastest.

### Q2: What is the difference between a filter and a context filter?
**A:** Regular filters apply after data is loaded. Context filters create a temporary table first, and other filters apply on the result. Use context filters when you need other filters to work on a reduced dataset.

### Q3: What is the difference between extract and live connection?
**A:** Extract creates a local cached copy (faster, works offline, smaller dataset possible). Live queries the source directly (always current, no cache management). Use extracts for performance; live for real-time data.

### Q4: What is data blending?
**A:** Combining data from multiple data sources in one worksheet. One source is primary; others are secondary. Secondary data is aggregated to the primary source's level of detail. Limited compared to joins.

### Q5: What is the difference between a calculated field and a table calculation?
**A:** Calculated fields operate on underlying data rows. Table calculations operate on the marks in the visual. Table calculations depend on what's in the view.

### Q6: How do you handle large datasets in Tableau?
**A:** Use extracts with aggregation, apply filters early, limit quick filter options, avoid row-level calculations on large data, use data source filters, and optimize LOD expressions.

### Q7: What is the difference between a dimension and a measure?
**A:** Dimensions are categorical (product name, region). Measures are numeric (sales, quantity). Dimensions define the level of detail; measures provide the values. Blue fields are dimensions; green are measures.

### Q8: What is a parameter?
**A:** A dynamic value that users can change. Used to control calculations, filters, and reference lines. Enables what-if analysis and user-driven exploration.

### Q9: What are dashboard actions?
**A:** Interactive behaviors: Filter (clicking one sheet filters another), Highlight, URL (navigate to web), Change Parameter, Go to Sheet. Create dynamic, interconnected dashboards.

### Q10: What is the difference between discrete and continuous fields?
**A:** Discrete (blue) create headers and separate values. Continuous (green) create axes and ranges. Discrete dimensions; continuous measures. Can be changed by right-clicking the field.

---

## Common Mistakes

1. Using table calculations when LOD expressions are needed
2. Not considering dashboard performance
3. Overloading dashboards with too many visuals
4. Ignoring mobile layout design
5. Not using extract for performance
6. Hardcoding values instead of using parameters
7. Inconsistent formatting across dashboards
8. Not testing with different screen sizes
9. Ignoring color accessibility
10. Not documenting calculations and data sources

---

## Best Practices

1. Plan dashboard layout before building
2. Use consistent formatting and color schemes
3. Optimize for performance (extracts, filters)
4. Design for target audience (executives vs analysts)
5. Use parameters for dynamic analysis
6. Test interactivity thoroughly
7. Document calculations and data sources
8. Consider mobile viewing experience
9. Use story points for narratives
10. Leverage LOD expressions appropriately

---

## Quick Reference

### LOD Expression Reference

| Type | Purpose | Example |
|------|---------|---------|
| FIXED | Fixed granularity | `{FIXED [Region] : SUM([Sales])}` |
| INCLUDE | Add detail | `{INCLUDE [Product] : AVG([Rating])}` |
| EXCLUDE | Remove detail | `{EXCLUDE [Date] : SUM([Sales])}` |

### Chart Selection Guide

| Data Type | Recommended Chart |
|-----------|------------------|
| Category comparison | Bar chart |
| Trend over time | Line chart |
| Part of whole | Pie/Donut |
| Distribution | Histogram/Box plot |
| Relationship | Scatter plot |
| Geographic | Map |
| Hierarchy | Tree map |
| Performance vs target | Bullet chart |
| Composition over time | Stacked area |
| Ranking | Horizontal bar |

### Quick Table Calculations

| Calculation | Use |
|-------------|-----|
| Running Total | Cumulative sum |
| Percent of Total | Share of whole |
| Rank | Position in list |
| Moving Average | Smoothed trend |
| Difference | Change from prior |
| Percent Difference | Growth rate |

### Filter Order

```
Extract Filter -> Data Source Filter -> Context Filter -> Dimension Filter -> Measure Filter -> Table Calc Filter
```

---

## Learning Roadmap

### Phase 1: Basics (Week 1-2)
- Tableau interface and workspace
- Basic chart types (bar, line, scatter, map)
- Filters, marks, and shelves

### Phase 2: Intermediate (Week 3-4)
- Calculated fields
- Parameters
- Table calculations

### Phase 3: Advanced (Week 5-7)
- LOD expressions (FIXED, INCLUDE, EXCLUDE)
- Dashboard design
- Story points

### Phase 4: Expert (Week 8-10)
- Performance optimization
- Tableau Server/Online
- Advanced analytics

### Phase 5: Production (Week 11-12)
- Enterprise deployment
- Data governance
- Embedded analytics
