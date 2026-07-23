---
layout: default
title: Deep Learning
parent: AI & Machine Learning
---

# Deep Learning
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

- TOC
{:toc}

---

## Introduction

Deep Learning is a subfield of ML based on artificial neural networks with multiple layers. These networks learn hierarchical representations of data, automatically discovering patterns at multiple abstraction levels. Deep learning has revolutionized computer vision, NLP, speech recognition, and game playing.

Unlike traditional ML where feature engineering is manual, deep learning models learn features directly from raw data.

---

## Key Concepts

### Activation Functions
| Function | Range | Use Case |
|----------|-------|----------|
| ReLU | [0, ∞) | Hidden layers (default) |
| Sigmoid | (0, 1) | Binary output |
| Softmax | (0, 1), sums to 1 | Multi-class output |
| Tanh | (-1, 1) | RNN hidden layers |
| Leaky ReLU | (-∞, ∞) | Prevents dying ReLU |
| GELU | (-0.17, ∞) | Transformer hidden layers |

### Architecture Selection
| Data Type | Recommended Architecture |
|-----------|------------------------|
| Images | CNN (ResNet, EfficientNet) |
| Text/Sequences | Transformer (BERT, GPT) |
| Time Series | LSTM, Transformer, TCN |
| Tabular | MLP, TabNet, Gradient Boosting |

### Optimizers
| Optimizer | Key Feature |
|-----------|------------|
| SGD | Simple, good generalization |
| SGD+Momentum | Accelerates convergence |
| Adam | Momentum + RMSProp (default) |
| AdamW | Decoupled weight decay (transformers) |

### Regularization
- **Dropout**: Randomly zeros neurons during training (0.2-0.5)
- **Batch Normalization**: Normalizes layer inputs, stabilizes training
- **L2 Regularization (Weight Decay)**: Penalty for large weights
- **Data Augmentation**: Artificially increases training data
- **Early Stopping**: Stops when validation loss stops improving

### Transfer Learning
1. **Feature extraction**: Freeze pre-trained layers, train new classifier
2. **Fine-tuning**: Unfreeze some/all layers with small learning rate
3. **Domain adaptation**: Adapt pre-trained model to new domain

---

## FAQ

### Q1: What is the vanishing gradient problem?
Gradients shrink exponentially through layers, making early layers learn slowly. Solved by ReLU, BatchNorm, residual connections, LSTMs.

### Q2: Why is ReLU preferred over sigmoid?
ReLU doesn't saturate for positive values (no vanishing gradient), is computationally cheap, and produces sparse activations.

### Q3: What is dropout and why does it work?
Randomly zeros neurons during training. Acts as ensemble training of sub-networks, prevents co-adaptation, serves as regularization. Not used during inference.

### Q4: What is the difference between CNN and RNN?
CNNs process grid-like data (images) with convolution operations. RNNs process sequential data (text, time series) with hidden states for temporal dependencies.

### Q5: How does the attention mechanism work?
Computes weighted sum of values based on query-key compatibility (dot product). Self-attention lets each token attend to all others within a sequence.

### Q6: What are the advantages of transformers over RNNs?
Parallel processing (faster training), direct long-range dependency capture, better scalability. RNNs process sequentially and struggle with long sequences.

### Q7: What is batch normalization?
Normalizes layer inputs to zero mean and unit variance per mini-batch. Speeds training, allows higher learning rates, mild regularization.

### Q8: What is residual learning (skip connections)?
Adds input directly to output: y = F(x) + x. Enables gradient flow through identity mappings, training 100+ layer networks. Key in ResNet.

### Q9: What is the softmax temperature?
Scales logits before softmax. Lower T → more peaked (confident). Higher T → more uniform (uncertain). T=1 is standard.

### Q10: What is mixed precision training?
Using FP16 for forward/backward passes, FP32 for weight updates. Faster training on GPUs with tensor cores, reduced memory. Requires loss scaling.

---

## Common Mistakes

1. Not normalizing input data — neural networks are sensitive to input scale
2. Using wrong loss function — cross-entropy for classification, MSE for regression
3. Too high learning rate — training diverges; too low takes forever
4. Not using batch normalization — slower training, more sensitive to initialization
5. Forgetting train/eval mode — dropout and BatchNorm behave differently
6. Not using GPU when available — dramatic training time increase on CPU
7. Overfitting on small datasets — not using regularization or transfer learning
8. Not monitoring gradients — vanishing/exploding gradients go unnoticed

---

## Best Practices

1. Start with a simple baseline before complex architectures
2. Use pre-trained models whenever possible (transfer learning)
3. Monitor both training and validation metrics
4. Apply gradient clipping for RNNs and transformers
5. Use mixed precision training for faster GPU training
6. Save model checkpoints during training
7. Use learning rate warmup for transformers
8. Test with a small batch first to catch bugs early

---

## Quick Reference

### Loss Functions
| Task | Loss Function |
|------|--------------|
| Binary Classification | BCELoss |
| Multi-class | CrossEntropyLoss |
| Regression | MSELoss, HuberLoss |
| Similarity | TripletLoss |

### Hyperparameter Defaults
| Parameter | Typical Range |
|-----------|--------------|
| Learning Rate | 1e-4 to 1e-2 |
| Batch Size | 32, 64, 128, 256 |
| Dropout | 0.1 to 0.5 |
| Weight Decay | 1e-5 to 1e-2 |

---

## Resources

- "Deep Learning" by Goodfellow, Bengio, Courville
- "Deep Learning with Python" by Francois Chollet
- Fast.ai Practical Deep Learning
- Stanford CS231n (Computer Vision), CS224n (NLP)
- PyTorch, TensorFlow/Keras
