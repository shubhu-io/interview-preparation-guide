---
layout: default
title: Statistics
parent: Data & Analytics
---

# Statistics

## Introduction

Statistics is the mathematical foundation of data science, machine learning, and analytics. It provides the tools for collecting, analyzing, interpreting, and presenting data. A strong statistics foundation enables you to make rigorous inferences, design experiments, validate results, and communicate findings with confidence.

Statistics interviews test both conceptual understanding and practical application. You need to know when to apply which test, interpret results correctly, and understand assumptions and limitations.

---

## Key Concepts

| Concept | Description |
|---------|-------------|
| p-value | Probability of observing results assuming H0 is true |
| Confidence Interval | Range likely containing true parameter |
| Effect Size | Magnitude of difference/relationship |
| Statistical Power | Probability of detecting true effect |
| Central Limit Theorem | Sample means are approximately normal |
| Bayes Theorem | P(A|B) = P(B|A)*P(A)/P(B) |
| Normal Distribution | Symmetric bell curve, 68-95-99.7 rule |
| Regression | Modeling relationship between variables |
| Type I Error | False positive (rejecting true H0) |
| Type II Error | False negative (failing to reject false H0) |
| Standard Error | Standard deviation of sampling distribution |
| Parametric Test | Assumes specific distribution (usually normal) |
| Non-Parametric Test | No distributional assumptions |

---

## FAQ

### Q1: What is the difference between parameter and statistic?
**A:** A parameter describes a population (true mean). A statistic describes a sample (sample mean). We use statistics to estimate parameters.

### Q2: What is the Central Limit Theorem?
**A:** Sample means are approximately normally distributed regardless of population shape, given sufficient sample size (n >= 30). Enables hypothesis testing and confidence intervals for any distribution.

### Q3: When do you use a t-test vs z-test?
**A:** Z-test when population variance is known or n > 30. t-test when population variance is unknown and n < 30. t-distribution has heavier tails, accounting for additional uncertainty.

### Q4: What is the difference between Type I and Type II errors?
**A:** Type I (alpha): False positive - rejecting a true null hypothesis. Type II (beta): False negative - failing to reject a false null hypothesis. Trade-off controlled by alpha level and sample size.

### Q5: What is statistical power?
**A:** Probability of correctly rejecting a false null hypothesis (1 - beta). Higher power = better chance of detecting real effects. Typically want power >= 0.80. Increases with larger sample size, larger effect, and lower alpha.

### Q6: When do you use chi-square vs t-test?
**A:** Chi-square tests independence of categorical variables. t-test compares means of continuous variables. Chi-square for associations between categorical variables; t-test for comparing group means.

### Q7: What is ANOVA?
**A:** Analysis of Variance. Compares means across 3+ groups. Tests if any group mean differs from others. F-statistic = between-group variance / within-group variance. Follow-up tests (Tukey) identify which groups differ.

### Q8: What is a p-value?
**A:** Probability of observing results at least as extreme as obtained, assuming the null hypothesis is true. Small p-value (< 0.05) suggests observed effect is unlikely due to chance alone. Not the probability that H0 is true.

### Q9: What is the difference between correlation and causation?
**A:** Correlation measures association strength (-1 to 1). Causation means one variable causes changes in another. Confounding variables, reverse causation, and coincidence can create correlation without causation.

### Q10: What is R-squared?
**A:** Proportion of variance in dependent variable explained by independent variables. Range 0-1. Higher means more variance explained. Adjusted R-squared penalizes for additional variables.

---

## Common Mistakes

1. Confusing statistical and practical significance
2. Not checking assumptions before applying tests
3. Ignoring effect size (only reporting p-values)
4. Multiple comparisons without correction
5. Concluding causation from correlation
6. Not calculating confidence intervals
7. Using wrong test for data type
8. Ignoring sample size requirements
9. Cherry-picking statistically significant results
10. Not considering confounding variables

---

## Best Practices

1. Always check assumptions before hypothesis testing
2. Report effect sizes and confidence intervals, not just p-values
3. Use appropriate statistical tests for data type
4. Correct for multiple comparisons
5. Design experiments with adequate power
6. Distinguish correlation from causation
7. Consider practical significance alongside statistical significance
8. Visualize data before running statistical tests
9. Document analysis decisions and assumptions
10. Report confidence intervals alongside point estimates

---

## Quick Reference

### Test Selection Guide

| Question Type | Test | Data |
|--------------|------|------|
| Compare 2 means | t-test | Continuous, 2 groups |
| Compare 3+ means | ANOVA | Continuous, 3+ groups |
| Test independence | Chi-square | Categorical |
| Correlation | Pearson/Spearman | Continuous/ordinal |
| Predict outcome | Regression | Continuous dependent |
| Non-normal data | Mann-Whitney/Kruskal | Ordinal/non-normal |

### Critical Values

| Confidence | Z-score | t (n=30) |
|-----------|---------|----------|
| 90% | 1.645 | 1.697 |
| 95% | 1.960 | 2.042 |
| 99% | 2.576 | 2.750 |

### Effect Size Benchmarks

| Measure | Small | Medium | Large |
|---------|-------|--------|-------|
| Cohen's d | 0.2 | 0.5 | 0.8 |
| r (correlation) | 0.1 | 0.3 | 0.5 |
| R-squared | 0.02 | 0.13 | 0.26 |

### Formulas Reference

| Metric | Formula |
|--------|---------|
| Mean | Sum(x) / n |
| Variance | Sum((x - mean)^2) / (n-1) |
| Std Dev | sqrt(Variance) |
| SE | Std Dev / sqrt(n) |
| CI | mean +/- z * SE |
| Cohen's d | (mean1 - mean2) / pooled_std |

---

## Learning Roadmap

### Phase 1: Descriptive Statistics (Week 1-2)
- Central tendency (mean, median, mode)
- Dispersion (variance, standard deviation, IQR)
- Distribution shapes (skewness, kurtosis)

### Phase 2: Probability (Week 3-4)
- Probability rules
- Conditional probability, Bayes theorem
- Common distributions (normal, binomial, Poisson)
- Central Limit Theorem

### Phase 3: Inferential Statistics (Week 5-7)
- Confidence intervals
- Hypothesis testing (t-test, chi-square, ANOVA)
- Type I and Type II errors
- Power analysis

### Phase 4: Regression (Week 8-9)
- Simple linear regression
- Multiple regression
- Assumptions and diagnostics
- Logistic regression basics

### Phase 5: Advanced Topics (Week 10-12)
- Bayesian statistics
- Non-parametric tests
- Experimental design
