---
layout: default
title: Excel
parent: Data & Analytics
---

# Excel

## Introduction

Microsoft Excel is the most widely used spreadsheet application in business. Proficiency in Excel is essential for data analysis, financial modeling, reporting, and countless business operations. Many interview processes include Excel tests to evaluate candidates' ability to work with data efficiently.

Excel skills range from basic cell operations to advanced formulas, pivot tables, macros, and data visualization. Modern Excel with dynamic arrays, Power Query, and Power Pivot can handle complex analytics that previously required programming languages.

---

## Key Concepts

| Concept | Description |
|---------|-------------|
| Absolute Reference | $A$1 - cell reference that doesn't change when copied |
| Relative Reference | A1 - cell reference that adjusts when copied |
| VLOOKUP | Vertical lookup in leftmost column |
| INDEX-MATCH | Flexible lookup returning from any column |
| Pivot Table | Dynamic data summary and analysis tool |
| Power Query | ETL tool for data transformation |
| Conditional Formatting | Format cells based on rules |
| Data Validation | Restrict cell input to specific values |
| Dynamic Array | Functions that spill results into multiple cells |
| Named Range | Reference cells by meaningful names |

---

## FAQ

### Q1: What is the difference between VLOOKUP and INDEX-MATCH?
**A:** VLOOKUP searches the leftmost column and returns from a specified column number. INDEX-MATCH is more flexible: MATCH finds the row, INDEX returns from any column. INDEX-MATCH can look left, handles duplicate first columns, and is generally faster.

### Q2: What is the difference between absolute and relative references?
**A:** Relative (A1) changes when copied to other cells. Absolute ($A$1) stays fixed. Mixed ($A1 or A$1) locks either column or row. Use absolute for constants (tax rate, lookup tables).

### Q3: When would you use a pivot table?
**A:** Summarizing large datasets, creating cross-tabulations, analyzing trends by category, exploring data interactively, and creating summary reports without complex formulas.

### Q4: What is Power Query?
**A:** Excel's ETL (Extract, Transform, Load) tool for cleaning, reshaping, and combining data. Records transformation steps that replay on refresh. Handles CSV, databases, APIs, and web data.

### Q5: What does SUMIFS do?
**A:** Sums values meeting multiple criteria. Example: =SUMIFS(D:D, B:B, "Sales", C:C, ">1000") sums column D where B is "Sales" and C is greater than 1000.

### Q6: What is conditional formatting?
**A:** Automatically formats cells based on rules: color scales, data bars, icon sets, or custom formulas. Useful for highlighting trends, outliers, and status indicators.

### Q7: How do you handle large datasets in Excel?
**A:** Use Power Query for transformation, pivot tables for summarization, avoid volatile formulas (INDIRECT, OFFSET), use structured tables, and consider Power Pivot for data modeling.

### Q8: What is an array formula?
**A:** A formula that performs multiple calculations on one or more arrays. Enter with Ctrl+Shift+Enter (legacy) or use dynamic array functions (FILTER, SORT, UNIQUE) in Excel 365.

### Q9: What is the difference between COUNT, COUNTA, and COUNTBLANK?
**A:** COUNT counts numeric cells. COUNTA counts non-empty cells (any type). COUNTBLANK counts empty cells.

### Q10: What is XLOOKUP?
**A:** Modern replacement for VLOOKUP/HLOOKUP. =XLOOKUP(lookup, lookup_array, return_array, [if_not_found], [match_mode], [search_mode]). Supports bidirectional lookup, default values, and binary search.

---

## Common Mistakes

1. Using VLOOKUP when INDEX-MATCH or XLOOKUP is better
2. Not using absolute references for constants
3. Hardcoding values instead of cell references
4. Over-nesting IF functions (use IFS or SWITCH)
5. Not using tables (Ctrl+T) for structured data
6. Ignoring error handling (IFERROR, IFNA)
7. Using volatile functions unnecessarily
8. Not validating input data
9. Creating charts without proper labels
10. Not protecting important formulas/sheets

---

## Best Practices

1. Always use tables for structured data
2. Use named ranges for readability
3. Handle errors with IFERROR/IFNA
4. Use conditional formatting for visual insights
5. Document assumptions and formulas
6. Avoid hardcoding in formulas
7. Use data validation for input control
8. Keep formulas simple and readable
9. Regular backup important workbooks
10. Learn keyboard shortcuts for efficiency

---

## Quick Reference

### Essential Shortcuts

| Shortcut | Action |
|----------|--------|
| Ctrl+T | Create table |
| Ctrl+; | Insert today's date |
| Ctrl+Shift+L | Toggle filters |
| Alt+= | AutoSum |
| F4 | Toggle absolute reference |
| Ctrl+` | Show formulas |
| Ctrl+D | Fill down |
| Ctrl+E | Flash Fill |
| F2 | Edit cell |
| Ctrl+Home | Go to cell A1 |

### Formula Reference

| Function | Syntax | Use |
|----------|--------|-----|
| VLOOKUP | =VLOOKUP(val,range,col,FALSE) | Vertical lookup |
| INDEX-MATCH | =INDEX(col,MATCH(val,range,0)) | Flexible lookup |
| SUMIFS | =SUMIFS(sum,criteria_range,criteria) | Conditional sum |
| COUNTIFS | =COUNTIFS(range,criteria) | Conditional count |
| IF | =IF(cond,true,false) | Conditional logic |
| IFERROR | =IFERROR(formula,alternative) | Error handling |
| XLOOKUP | =XLOOKUP(val,lookup,return,missing) | Modern lookup |
| FILTER | =FILTER(range,condition) | Filter data |
| SORT | =SORT(range,col,order) | Sort data |

### Key Functions by Category

| Category | Functions |
|----------|-----------|
| Lookup | VLOOKUP, INDEX-MATCH, XLOOKUP, HLOOKUP |
| Conditional | SUMIFS, COUNTIFS, AVERAGEIFS, MAXIFS, MINIFS |
| Logical | IF, IFS, AND, OR, NOT, SWITCH |
| Text | LEFT, RIGHT, MID, LEN, TRIM, SUBSTITUTE, TEXT |
| Date | TODAY, NOW, YEAR, MONTH, DAY, DATE, DATEDIF |
| Statistical | AVERAGE, MEDIAN, MODE, STDEV, VAR, PERCENTILE |

---

## Learning Roadmap

### Phase 1: Basics (Week 1)
- Navigation, formatting, cell references
- Basic formulas (SUM, AVERAGE, COUNT)
- Absolute vs relative references

### Phase 2: Intermediate (Week 2-3)
- VLOOKUP, HLOOKUP, INDEX-MATCH
- SUMIFS, COUNTIFS, AVERAGEIFS
- Conditional formatting, data validation

### Phase 3: Advanced (Week 4-5)
- Pivot tables and pivot charts
- Array formulas, dynamic arrays
- IF, nested IF, IFS, SWITCH

### Phase 4: Expert (Week 6-8)
- Power Query (data transformation)
- Power Pivot (data modeling)
- Macros/VBA basics
- Dashboard creation

### Phase 5: Specialized (Week 9-12)
- Financial functions (NPV, IRR, PMT)
- Statistical functions
- Solver and Goal Seek
