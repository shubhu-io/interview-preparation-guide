---
layout: default
title: AI & Data Science
parent: Specialized Domains
---

# AI & Data Science

## Introduction

AI & Data Science spans data science, machine learning engineering, deep learning, NLP, computer vision, and the new generation of GenAI/LLM roles. Roles: Data Scientist, ML Engineer, Data Analyst, Deep Learning Engineer, NLP/CV Engineer, MLOps Engineer, AI Engineer.

## What the Role Does

- Explore and prepare data; build features; train and evaluate models.
- Deploy and monitor ML models in production (MLOps).
- Run experiments and communicate results to stakeholders.
- Build GenAI systems: RAG pipelines, LLM fine-tuning, AI agents.
- Handle ML system design: data pipelines, feature stores, online vs batch.

## Hiring Companies

Google, Meta, Amazon, Microsoft, Apple, OpenAI, Anthropic, DeepMind, Hugging Face, Cohere, Databricks, Scale AI, and India: Fractal, Tiger Analytics, Quantiphi, Mu Sigma, Celebal, Crayon Data, plus every product company.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| Python | pandas, numpy, scikit-learn, notebooks ([27-Python](../../27-Python/)) |
| SQL | Data extraction and analysis ([26-SQL](../../26-SQL/)) |
| Statistics & Probability | Distributions, hypothesis testing, A/B, bias-variance ([74-Statistics](../../74-Statistics/)) |
| ML Algorithms | Regression, classification, trees, boosting, clustering, regularization ([60-Machine-Learning](../../60-Machine-Learning/)) |
| Deep Learning | NNs, CNNs, RNNs/Transformers, backprop, optimizers ([61-Deep-Learning](../../61-Deep-Learning/)) |
| NLP / CV | Tokenization, embeddings, transformers, image models ([62-NLP](../../62-NLP/), [63-Computer-Vision](../../63-Computer-Vision/)) |
| GenAI & LLMs | LLM architectures, fine-tuning, RAG, evaluation ([64-Generative-AI](../../64-Generative-AI/), [65-LLM](../../65-LLM/), [66-RAG](../../66-RAG/)) |
| AI Agents & Prompting | Prompt engineering, tool use, agent frameworks ([67-Prompt-Engineering](../../67-Prompt-Engineering/), [68-AI-Agents](../../68-AI-Agents/)) |
| MLOps | Model deployment, CI/CD, monitoring, drift ([69-MLOps](../../69-MLOps/)) |
| ML System Design | Feature stores, data pipelines, online/batch serving |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Python + SQL + statistics/probability refresher
Weeks 3-4:   ML algorithms + hands-on scikit-learn
Weeks 5-6:   Deep learning (PyTorch/TensorFlow) fundamentals
Weeks 7-8:   ML system design + case studies
Weeks 9-10:  GenAI: LLMs, RAG, fine-tuning, AI agents (role-specific)
Weeks 11-12: MLOps, mock interviews, Kaggle competition
```

## Sample Interview Questions

- Explain the bias-variance trade-off. How would you handle class imbalance?
- Write a SQL query for day-7 retention. Explain how you'd A/B test a new recommendation algorithm.
- Design an end-to-end ML system for real-time fraud detection.
- What is RAG and when would you choose it over fine-tuning?
- Explain the Transformer architecture and attention.
- How do you detect and handle data drift in production?
- What evaluation metrics would you use for an imbalanced churn-prediction model?

## Projects for Portfolio

- End-to-end ML project: data → features → model → deployment → monitoring dashboard.
- RAG chatbot over your own documents with eval harness.
- Kaggle competition with a documented top-10% solution.
- MLOps pipeline: CI/CD, Docker, model registry, A/B in production.

## Tools to Learn

- Python: pandas, numpy, scikit-learn, PyTorch, TensorFlow, Hugging Face
- SQL: BigQuery, Postgres, DuckDB
- MLOps: Docker, MLflow, Airflow, Kubernetes, FastAPI
- GenAI: LangChain/LlamaIndex, vector DBs (Chroma, FAISS), OpenAI/vLLM APIs
- Notebooks/IDE: Jupyter, VS Code

## Key Links

- AI/ML folders: [59-AI](../../59-AI/) → [69-MLOps](../../69-MLOps/) (all AI/ML topics)
- Python: [27-Python](../../27-Python/)
- SQL: [26-SQL](../../26-SQL/)
- Statistics: [74-Statistics](../../74-Statistics/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Knowing model names but not the math/assumptions underneath.
2. Skipping the statistics that back every interview answer.
3. Having no production experience story (deployment, monitoring, drift).
4. Writing SQL/model code without explaining reasoning aloud.
5. Not being able to translate model results into business impact.
