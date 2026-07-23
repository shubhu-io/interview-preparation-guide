---
layout: default
title: RAG
parent: AI & Machine Learning
nav_order: 8
---

# Retrieval-Augmented Generation (RAG)

RAG combines information retrieval with generative AI to provide accurate, grounded responses by retrieving relevant documents before generating answers.

## Introduction

RAG addresses the limitations of pure generative models by grounding responses in retrieved context. This reduces hallucinations and enables access to up-to-date, domain-specific knowledge.

### RAG vs Fine-Tuning vs Prompt Engineering

| Aspect | RAG | Fine-Tuning | Prompt Engineering |
|--------|-----|-------------|-------------------|
| Cost | Medium | High | Low |
| Freshness | Real-time | Static | Real-time |
| Accuracy | High | High | Medium |
| Implementation | Moderate | Complex | Simple |
| Domain Adaptation | Easy | Medium | Hard |

## Key Concepts

### 1. Basic RAG Pipeline

```python
# Simple RAG implementation
from langchain.vectorstores import FAISS
from langchain.embeddings import OpenAIEmbeddings
from langchain.chat_models import ChatOpenAI
from langchain.chains import RetrievalQA

# Create vector store
embeddings = OpenAIEmbeddings()
vectorstore = FAISS.from_documents(documents, embeddings)

# Create RAG chain
llm = ChatOpenAI(model="gpt-4", temperature=0)
qa_chain = RetrievalQA.from_chain_type(
    llm=llm,
    chain_type="stuff",
    retriever=vectorstore.as_retriever(search_kwargs={"k": 3}),
    return_source_documents=True
)

# Query
result = qa_chain({"query": "What is RAG?"})
print(result["result"])
```

### 2. Document Processing Pipeline

```python
# Document ingestion and chunking
from langchain.document_loaders import DirectoryLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter

def process_documents(doc_path):
    # Load documents
    loader = DirectoryLoader(doc_path, glob="**/*.md")
    documents = loader.load()
    
    # Split into chunks
    text_splitter = RecursiveCharacterTextSplitter(
        chunk_size=1000,
        chunk_overlap=200,
        length_function=len,
        separators=["\n\n", "\n", " ", ""]
    )
    
    chunks = text_splitter.split_documents(documents)
    return chunks

# Create embeddings and store
def create_index(chunks):
    embeddings = OpenAIEmbeddings()
    vectorstore = FAISS.from_documents(chunks, embeddings)
    vectorstore.save_local("faiss_index")
    return vectorstore
```

### 3. Advanced Retrieval Strategies

```python
# Multi-query retrieval
from langchain.retrievers.multi_query import MultiQueryRetriever

retriever = MultiQueryRetriever.from_llm(
    retriever=vectorstore.as_retriever(),
    llm=ChatOpenAI(model="gpt-4", temperature=0.3)
)

# Retrieves based on multiple query variations
docs = retriever.get_relevant_documents("How does RAG work?")
```

## FAQ

### Q1: When should I use RAG vs fine-tuning?

**Answer:** Use RAG when:
- Information changes frequently
- You need source attribution
- Domain is well-documented
- You want to reduce hallucinations

Use fine-tuning when:
- You need consistent style/tone
- Domain-specific formatting is crucial
- Knowledge is stable
- You need very specific behavior

### Q2: How do I choose chunk size?

**Answer:** Consider:
- **Small (256-512)**: Better for precise answers
- **Medium (512-1024)**: Balanced approach
- **Large (1024-2048)**: Better for context-heavy tasks

Test with your data and measure retrieval accuracy.

### Q3: What embedding model should I use?

**Answer:** Recommendations:
- **OpenAI ada-002**: General purpose, easy to use
- **BGE-large**: Strong performance, open source
- **E5**: Good for search tasks
- **Sentence-transformers**: Local deployment

### Q4: How do I handle multi-modal RAG?

**Answer:** For images/tables:
1. Use multi-modal embeddings (CLIP, etc.)
2. Store metadata with embeddings
3. Use hybrid retrieval (text + image similarity)
4. Consider models like GPT-4V for understanding

### Q5: How do I evaluate RAG performance?

**Answer:** Metrics:
- **Retrieval**: Recall@k, MRR, NDCG
- **Generation**: Faithfulness, relevance
- **End-to-end**: Human evaluation, A/B testing

### Q6: What is hybrid search?

**Answer:** Combining:
- **Keyword search** (BM25): Exact matches, traditional
- **Semantic search** (embeddings): Meaning-based
- Results from both are combined and reranked

```python
# Hybrid search example
from langchain.retrievers import EnsembleRetriever

bm25_retriever = BM25Retriever.from_documents(docs)
semantic_retriever = vectorstore.as_retriever()

ensemble = EnsembleRetriever(
    retrievers=[bm25_retriever, semantic_retriever],
    weights=[0.3, 0.7]  # Semantic gets more weight
)
```

### Q7: How do I reduce latency?

**Answer:** Optimization techniques:
- Cache frequent queries
- Use faster embeddings (smaller models)
- Reduce number of retrieved chunks
- Implement streaming responses
- Use vector DB optimizations (HNSW, IVF)

### Q8: What vector databases are recommended?

**Answer:** Options:
- **Pinecone**: Managed, easy to use
- **Weaviate**: GraphQL, modular
- **Chroma**: Lightweight, local
- **FAISS**: Fast, local, no server
- **Milvus**: Distributed, scalable

### Q9: How do I handle document updates?

**Answer:** Strategies:
- Incremental updates (add/remove chunks)
- Version control for embeddings
- Periodic re-indexing
- Metadata filtering by date

### Q10: What are common RAG failure modes?

**Answer:** Common issues:
- Poor chunk quality/relevance
- Missing context in retrieved docs
- Over-reliance on retrieved info
- Query-document mismatch
- Hallucination despite retrieval

## Common Mistakes

### 1. Poor Chunk Strategy

```python
# ❌ Wrong: Fixed-size chunking without overlap
def bad_chunk(text, size=500):
    return [text[i:i+size] for i in range(0, len(text), size)]

# ✅ Right: Recursive splitting with overlap
from langchain.text_splitter import RecursiveCharacterTextSplitter

splitter = RecursiveCharacterTextSplitter(
    chunk_size=500,
    chunk_overlap=50,
    separators=["\n\n", "\n", ". ", " "]
)
chunks = splitter.split_text(text)
```

### 2. Not Using Metadata

```python
# ❌ Wrong: No metadata filtering
results = vectorstore.similarity_search("query")

# ✅ Right: Filter by metadata
results = vectorstore.similarity_search(
    "query",
    filter={"source": "documentation", "date": "2024-01"}
)
```

### 3. Ignoring Re-ranking

```python
# ❌ Wrong: Top-k without re-ranking
docs = retriever.get_relevant_documents(query, k=5)

# ✅ Right: Re-rank for relevance
from langchain.retrievers import ContextualCompressionRetriever
from langchain.retrievers.document_compressors import CrossEncoderReranker

compressor = CrossEncoderReranker(model="cross-encoder/ms-marco-MiniLM-L-6-v2")
compression_retriever = ContextualCompressionRetriever(
    compressor=compressor,
    base_compressor=vectorstore.as_retriever()
)
docs = compression_retriever.get_relevant_documents(query)
```

## Best Practices

### 1. End-to-End RAG Pipeline

```python
# Production RAG pipeline
class RAGPipeline:
    def __init__(self, vectorstore, llm):
        self.vectorstore = vectorstore
        self.llm = llm
    
    def query(self, question, k=5):
        # 1. Retrieve relevant documents
        docs = self.vectorstore.similarity_search(question, k=k)
        
        # 2. Rerank results
        docs = self.rerank(question, docs)
        
        # 3. Build context
        context = "\n\n".join([doc.page_content for doc in docs])
        
        # 4. Generate answer with source attribution
        prompt = f"""Answer based on context. If not in context, say so.

Context: {context}

Question: {question}"""
        
        answer = self.llm.generate(prompt)
        
        return {
            "answer": answer,
            "sources": [doc.metadata for doc in docs]
        }
    
    def rerank(self, query, docs):
        # Implement reranking logic
        return docs[:3]  # Return top 3
```

### 2. Query Expansion

```python
# Expand queries for better retrieval
def expand_query(query, llm):
    prompt = f"""Generate 3 alternative queries for: {query}
Return as JSON array of strings."""
    
    response = llm.generate(prompt)
    expanded = [query] + json.loads(response)
    return expanded

# Use all queries for retrieval
expanded_queries = expand_query(original_query, llm)
all_docs = []
for q in expanded_queries:
    docs = vectorstore.similarity_search(q, k=3)
    all_docs.extend(docs)

# Deduplicate
unique_docs = list({doc.page_content: doc for doc in all_docs}.values())
```

### 3. Monitoring and Observability

```python
# Track RAG performance
import logging
from dataclasses import dataclass
from typing import List, Dict

@dataclass
class RAGMetrics:
    query: str
    retrieval_time: float
    num_docs: int
    answer_quality: float  # 0-1
    sources: List[str]

class RAGMonitor:
    def __init__(self):
        self.metrics: List[RAGMetrics] = []
    
    def log(self, metrics: RAGMetrics):
        self.metrics.append(metrics)
        logging.info(f"RAG query: {metrics.query[:50]}...")
    
    def get_stats(self):
        return {
            "avg_retrieval_time": sum(m.retrieval_time for m in self.metrics) / len(self.metrics),
            "avg_quality": sum(m.answer_quality for m in self.metrics) / len(self.metrics),
        }
```

## Quick Reference

| Component | Options | Recommendation |
|-----------|---------|----------------|
| Embeddings | OpenAI, BGE, E5 | ada-002 for ease, BGE for performance |
| Vector DB | FAISS, Pinecone, Chroma | FAISS for local, Pinecone for cloud |
| Chunking | Fixed, recursive, semantic | Recursive with overlap |
| Retrieval | Similarity, hybrid, multi-query | Hybrid for best results |
| Reranking | Cross-encoder, LLM | Cross-encoder for speed |

## Summary

- RAG grounds responses in retrieved documents
- Choose chunk size based on your use case
- Hybrid search combines keyword and semantic
- Re-ranking improves result quality
- Monitor retrieval and generation separately
- Implement proper error handling
- Cache embeddings and queries for efficiency
