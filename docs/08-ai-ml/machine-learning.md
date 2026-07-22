---
layout: default
title: Machine Learning
parent: AI & Machine Learning
---

# Machine Learning
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

- TOC
{:toc}

---

## Introduction

Machine Learning (ML) is a subset of AI enabling systems to learn from data without explicit programming. ML powers recommendation systems, fraud detection, autonomous vehicles, and NLP. The field draws from statistics, linear algebra, calculus, and computer science.

Three main types: **Supervised** (labeled data), **Unsupervised** (unlabeled patterns), **Reinforcement** (trial and error with rewards).

---

## Key Concepts

### Algorithms by Type
| Type | Algorithms |
|------|-----------|
| Supervised (Regression) | Linear Regression, Ridge/Lasso, SVR |
| Supervised (Classification) | Logistic Regression, SVM, Decision Trees, Random Forest, XGBoost |
| Unsupervised (Clustering) | K-Means, DBSCAN, Hierarchical, GMM |
| Unsupervised (Dim. Reduction) | PCA, t-SNE, UMAP |

### Bias-Variance Tradeoff
- **Bias**: Error from overly simplistic assumptions (underfitting)
- **Variance**: Error from sensitivity to training fluctuations (overfitting)
- **Total Error** = Bias² + Variance + Irreducible Error

### Regularization
- **L1 (Lasso)**: Absolute value penalty → sparse models (feature selection)
- **L2 (Ridge)**: Squared penalty → prevents large weights
- **Elastic Net**: Combines L1 and L2

### Cross-Validation
- **k-Fold**: Train on k-1 folds, test on 1, repeat k times
- **Stratified k-Fold**: Preserves class distribution
- **Time Series Split**: Respects temporal ordering

### Ensemble Methods
- **Bagging**: Parallel training on bootstrap samples (Random Forest)
- **Boosting**: Sequential training focusing on errors (XGBoost, LightGBM)
- **Stacking**: Combining predictions via meta-learner

---

## FAQ

### Q1: What is the difference between supervised and unsupervised learning?
Supervised uses labeled data for classification/regression. Unsupervised finds patterns in unlabeled data via clustering and dimensionality reduction.

### Q2: What is the curse of dimensionality?
As features increase, data becomes sparse, distances lose meaning, and exponential data is needed for generalization.

### Q3: How do you handle missing data?
Deletion, imputation (mean/median/KNN), indicator variables, or algorithm-specific handling (XGBoost natively).

### Q4: What is the difference between bagging and boosting?
Bagging trains models in parallel on bootstrap samples (reduces variance). Boosting trains sequentially, each correcting previous errors (reduces bias and variance).

### Q5: When would you use L1 vs L2 regularization?
L1 for feature selection and sparse models. L2 when preventing any single feature from dominating without eliminating features.

### Q6: How do you evaluate a classification model?
Accuracy, precision, recall, F1-score, AUC-ROC, and confusion matrix. Use F1 for imbalanced classes.

### Q7: How does SVM handle non-linear data?
Kernel trick maps data to higher-dimensional space where it becomes linearly separable. Common kernels: polynomial, RBF, sigmoid.

### Q8: What is the elbow method in K-Means?
Plot within-cluster sum of squares vs number of clusters. The "elbow" point indicates optimal k.

### Q9: What is the difference between PCA and t-SNE?
PCA is linear, preserves global structure, deterministic. t-SNE is non-linear, preserves local structure, stochastic, for visualization.

### Q10: How do you handle imbalanced datasets?
SMOTE oversampling, undersampling, class weights, ensemble methods (Balanced RF), threshold adjustment, and focal loss.

---

## Common Mistakes

1. Not splitting data before feature engineering — causes data leakage
2. Fitting scaler on entire dataset — fit on training set only
3. Ignoring class imbalance — accuracy is misleading for imbalanced problems
4. Overfitting to validation set — repeated tuning on same validation set
5. Not handling missing values properly — imputing before splitting causes leakage
6. Not using cross-validation — single split gives unreliable estimates
7. Ignoring feature scaling — SVM, KNN, gradient methods require scaled features
8. Not setting random seeds — non-reproducible results

---

## Best Practices

1. Always establish a baseline (majority class, linear regression)
2. Use reproducible experiments (fix random seeds, version data/code)
3. Track experiments (MLflow, W&B)
4. Start simple before trying complex models
5. Understand your data through EDA before modeling
6. Use stratified splits for classification
7. Monitor for data drift in production
8. Document model decisions with model cards

---

## Quick Reference

### Algorithm Selection Guide
| Problem | Data Size | Recommended |
|---------|-----------|-------------|
| Classification (small) | <10K | Logistic Regression, SVM |
| Classification (medium) | 10K-1M | Random Forest, XGBoost |
| Classification (large) | >1M | LightGBM, Neural Networks |
| Clustering | <10K | K-Means, Hierarchical |
| Clustering | >10K | K-Means, DBSCAN |

### Key Formulas
- **MSE**: (1/n) Σ(yᵢ - ŷᵢ)²
- **Precision**: TP / (TP + FP)
- **Recall**: TP / (TP + FN)
- **F1**: 2 × (Precision × Recall) / (Precision + Recall)
- **Gini**: 1 - Σ(pᵢ²)

---

## Resources

- "Hands-On Machine Learning" by Aurélien Géron
- Andrew Ng's ML Specialization (Coursera)
- Stanford CS229 (YouTube)
- Kaggle competitions and datasets
