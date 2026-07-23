---
layout: default
title: Natural Language Processing
parent: AI & Machine Learning
---

# Natural Language Processing
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

- TOC
{:toc}

---

## Introduction

NLP is a branch of AI enabling computers to understand, interpret, and generate human language. It powers search engines, translation services, chatbots, sentiment analysis, and large language models like GPT and BERT.

Modern NLP has evolved from rule-based systems through statistical methods to deep learning. The transformer architecture has revolutionized the field, enabling models that understand context and generate coherent text.

---

## Key Concepts

### Text Preprocessing
- **Tokenization**: Splitting text into tokens (words, subwords, characters)
- **Stemming**: Rule-based crude stemming (fast, may produce non-dictionary words)
- **Lemmatization**: Linguistic analysis for dictionary forms (more accurate, slower)
- **BPE/WordPiece**: Subword tokenization for handling rare/OOV words

### Representations
| Method | Description |
|--------|-------------|
| Bag of Words | Word frequency vectors, ignores order |
| TF-IDF | Term frequency × inverse document frequency |
| Word2Vec | Dense vectors via CBOW or Skip-gram |
| GloVe | Global co-occurrence matrix factorization |
| Contextual | BERT/GPT embeddings that change with context |

### Transformer Architecture
Attention(Q,K,V) = softmax(QK^T / √d_k) × V

- **Multi-head attention**: Parallel attention operations on different subspaces
- **Positional encoding**: Injects sequence order (sinusoidal or learned)
- **Self-attention**: Each token attends to all other tokens

### Model Comparison
| Model | Type | Training | Best For |
|-------|------|----------|----------|
| BERT | Encoder-only | Masked LM | Understanding tasks |
| GPT | Decoder-only | Causal LM | Generation tasks |
| T5 | Encoder-decoder | Span corruption | Seq2seq tasks |

---

## FAQ

### Q1: What is the difference between stemming and lemmatization?
Stemming uses crude heuristics to chop endings (fast, may produce non-dictionary words). Lemmatization uses linguistic analysis to return valid dictionary forms.

### Q2: What is TF-IDF?
Term Frequency-Inverse Document Frequency. Measures word importance by combining frequency in a document with rarity across all documents.

### Q3: BERT vs GPT?
BERT is encoder-only, bidirectional, trained with masked LM — excels at understanding. GPT is decoder-only, autoregressive — excels at generation.

### Q4: Why is subword tokenization important?
Handles rare/OOV words by splitting into known subunits, reduces vocabulary size, standard in modern models.

### Q5: How do transformers handle word order?
Through positional encoding (sinusoidal or learned embeddings) added to input embeddings, since self-attention is permutation-invariant.

### Q6: What is the attention mechanism?
Computes weighted sums of values based on query-key compatibility. Self-attention lets each token attend to all others. Core of transformer architecture.

### Q7: Extractive vs abstractive summarization?
Extractive selects important sentences from source. Abstractive generates new sentences. Extractive is more faithful; abstractive more natural.

### Q8: How is text generated?
Autoregressive models generate one token at a time conditioning on all previous tokens. Temperature controls randomness; top-k/top-p control diversity.

### Q9: How do you evaluate NLP models?
Classification: F1, accuracy. Generation: BLEU, ROUGE. Language modeling: perplexity. Understanding: GLUE/SuperGLUE benchmarks.

### Q10: What are contextual embeddings?
Word representations that change based on surrounding context. "bank" near "river" differs from "bank" near "money". BERT/GPT produce contextual embeddings.

---

## Common Mistakes

1. Removing stop words for tasks where negation matters (sentiment analysis)
2. Using BoW when word order is important
3. Not normalizing text (case, punctuation)
4. Training embeddings from scratch instead of using pre-trained
5. Ignoring domain-specific tokenization needs
6. Not handling class imbalance in text classification
7. Using accuracy alone for imbalanced datasets
8. Overfitting on small text datasets

---

## Best Practices

1. Preprocess text consistently across train/test
2. Use pre-trained embeddings or models when possible
3. Start with simple baselines (TF-IDF + Logistic Regression)
4. Consider domain-specific tokenization
5. Use stratified splits for text classification
6. Evaluate with multiple metrics
7. Do error analysis on misclassified examples
8. Use data augmentation for small datasets

---

## Quick Reference

| Task | Traditional | Modern |
|------|------------|--------|
| Classification | BoW/TF-IDF + SVM | BERT, RoBERTa |
| NER | CRF | BiLSTM-CRF, BERT |
| Summarization | TextRank | BART, T5, GPT |
| Translation | Statistical MT | Transformer, mBART |
| QA | TF-IDF retrieval | BERT, GPT + RAG |
| Similarity | Cosine on TF-IDF | Sentence-BERT |

### Key Formulas
- **TF-IDF**: TF(t,d) × log(N/df(t))
- **Attention**: softmax(QK^T/√d_k) × V
- **BLEU**: BP × exp(Σw_n × log(p_n))
- **Perplexity**: 2^(-1/N × Σlog₂(p(w_i)))

---

## Resources

- "Speech and Language Processing" (Jurafsky)
- Stanford CS224n, Hugging Face NLP Course
- Hugging Face Transformers, spaCy, NLTK
- GLUE, SuperGLUE, SQuAD benchmarks
