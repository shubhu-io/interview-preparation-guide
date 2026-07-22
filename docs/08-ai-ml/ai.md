---
layout: default
title: Artificial Intelligence
parent: AI & Machine Learning
---

# Artificial Intelligence
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

- TOC
{:toc}

---

## Introduction

Artificial Intelligence (AI) is a field of computer science focused on creating systems capable of performing tasks that typically require human intelligence: learning, reasoning, problem-solving, perception, and language understanding. It encompasses subfields including machine learning, deep learning, NLP, computer vision, and robotics.

---

## Key Concepts

### Types of AI
1. **Narrow AI (Weak AI)**: Designed for specific tasks (Siri, chess programs)
2. **General AI (Strong AI)**: Human-level intelligence across all domains (hypothetical)
3. **Super AI**: Exceeds human intelligence (theoretical)

### AI Subfields
- **Machine Learning**: Learning from data
- **Deep Learning**: Neural networks with many layers
- **NLP**: Understanding human language
- **Computer Vision**: Interpreting visual information
- **Robotics**: Physical agents interacting with environment
- **Expert Systems**: Rule-based decision making

### Search Algorithms
- **BFS**: Explores all neighbors at current depth; complete and optimal
- **DFS**: Explores as far as possible along each branch; memory efficient
- **A* Search**: Uses heuristic to guide search; optimal if heuristic is admissible
- **Minimax**: Game tree search for two-player games with adversarial search

### Neural Network Basics
- **Perceptron**: Single neuron computing weighted sum + activation
- **Activation Functions**: ReLU, sigmoid, tanh (introduce non-linearity)
- **Backpropagation**: Algorithm computing gradients via chain rule
- **Gradient Descent**: Optimization algorithm for minimizing loss

---

## FAQ

### Q1: What is the difference between AI, ML, and Deep Learning?
AI is the broad field of creating intelligent systems. ML is a subset where systems learn from data. Deep Learning is a subset of ML using neural networks with many layers.

### Q2: What is supervised vs unsupervised learning?
Supervised: learning from labeled data (input-output pairs). Unsupervised: finding patterns in unlabeled data (clustering, dimensionality reduction).

### Q3: What is overfitting?
Model performs well on training data but poorly on new data. Caused by excessive complexity or training too long. Prevented by regularization, cross-validation, more data.

### Q4: What is backpropagation?
Algorithm for training neural networks. Computes gradients of loss w.r.t. each weight using chain rule, then updates weights to minimize loss.

### Q5: What is a CNN?
Convolutional Neural Network for processing grid-like data (images). Uses convolutional layers to automatically learn spatial feature hierarchies.

### Q6: What is an RNN?
Recurrent Neural Network for sequential data. Has directed cyclic connections allowing hidden state across time steps.

### Q7: What is the attention mechanism?
Mechanism allowing models to focus on relevant input parts. Key component of Transformers, enabling better long-sequence handling.

### Q8: What is a Transformer?
Neural network architecture using self-attention instead of recurrence. Basis for BERT, GPT, and other large language models.

### Q9: What is transfer learning?
Using a pre-trained model as starting point for a new task. Reduces training time and data requirements significantly.

### Q10: What is gradient descent?
Optimization algorithm iteratively adjusting parameters to minimize loss. Variants: batch, stochastic, mini-batch.

---

## Common Mistakes

1. Ignoring data quality — poor data leads to poor model performance
2. Overfitting — model memorizes training data instead of learning patterns
3. Not validating models — deploying without proper evaluation metrics
4. Ignoring bias — models perpetuating biases in training data
5. Poor feature engineering — not creating relevant features from raw data
6. Not monitoring models — deploying without monitoring for drift or degradation
7. Using wrong metrics — optimizing for wrong objective (accuracy vs F1)
8. Ignoring scalability — models that don't scale to production
9. Not considering ethics — deploying AI without ethical implications review
10. Ignoring edge cases — not handling unusual inputs or scenarios

---

## Best Practices

### Data
- Ensure data quality and completeness
- Handle missing values appropriately
- Balance datasets for classification
- Use data augmentation when needed
- Maintain proper train/validation/test splits

### Model Development
- Start with simple baselines
- Use cross-validation for evaluation
- Regularize to prevent overfitting
- Tune hyperparameters systematically
- Document model decisions

### Deployment
- Package models for reproducibility
- Implement monitoring for drift
- Plan for model updates
- Consider latency requirements
- Implement fallback strategies

---

## Quick Reference

### Search Algorithm Complexity
| Algorithm | Time | Space | Optimal? |
|-----------|------|-------|----------|
| BFS | O(b^d) | O(b^d) | Yes (unweighted) |
| DFS | O(b^m) | O(bm) | No |
| A* | O(b^d) | O(b^d) | Yes (admissible h) |

### Evaluation Metrics
```python
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score

accuracy = accuracy_score(y_true, y_pred)
precision = precision_score(y_true, y_pred, average='weighted')
recall = recall_score(y_true, y_pred, average='weighted')
f1 = f1_score(y_true, y_pred, average='weighted')
```

---

## Resources

- [TensorFlow](https://www.tensorflow.org/docs)
- [PyTorch](https://pytorch.org/docs/)
- [Scikit-learn](https://scikit-learn.org/stable/documentation.html)
- "Artificial Intelligence: A Modern Approach" by Russell & Norvig
- "Deep Learning" by Goodfellow, Bengio, Courville
