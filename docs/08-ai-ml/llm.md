---
layout: default
title: Large Language Models
parent: AI & Machine Learning
nav_order: 7
---

# Large Language Models (LLMs)

Large Language Models are neural networks trained on massive text datasets to understand and generate human-like text.

## Introduction

LLMs represent a breakthrough in natural language processing. They use transformer architectures and self-attention mechanisms to capture complex language patterns across billions of parameters.

### Model Scale Comparison

| Model | Parameters | Training Data | Context Window |
|-------|------------|---------------|----------------|
| GPT-3 | 175B | 300B tokens | 4K |
| GPT-4 | ~1.8T (est.) | 13T tokens | 128K |
| Claude 3 | ~2T (est.) | 15T tokens | 200K |
| LLaMA 2 | 70B | 2T tokens | 4K |
| LLaMA 3 | 405B | 15T+ tokens | 128K |

## Key Concepts

### 1. Transformer Architecture

```python
# Conceptual transformer block
import torch
import torch.nn as nn

class TransformerBlock(nn.Module):
    def __init__(self, d_model=512, n_heads=8):
        super().__init__()
        self.attention = nn.MultiheadAttention(d_model, n_heads)
        self.norm1 = nn.LayerNorm(d_model)
        self.ffn = nn.Sequential(
            nn.Linear(d_model, d_model * 4),
            nn.GELU(),
            nn.Linear(d_model * 4, d_model)
        )
        self.norm2 = nn.LayerNorm(d_model)
    
    def forward(self, x):
        # Self-attention with residual
        attn_out, _ = self.attention(x, x, x)
        x = self.norm1(x + attn_out)
        
        # Feed-forward with residual
        ffn_out = self.ffn(x)
        x = self.norm2(x + ffn_out)
        return x
```

### 2. Fine-Tuning LLMs

```python
# LoRA fine-tuning (Parameter-efficient)
from peft import LoraConfig, get_peft_model

lora_config = LoraConfig(
    r=16,                    # Rank
    lora_alpha=32,           # Alpha scaling
    target_modules=["q_proj", "v_proj"],
    lora_dropout=0.05,
    bias="none",
    task_type="CAUSAL_LM"
)

model = get_peft_model(base_model, lora_config)
print(f"Trainable params: {model.print_trainable_parameters()}")
```

### 3. Inference Optimization

```python
# Quantization for faster inference
from transformers import BitsAndBytesConfig

quant_config = BitsAndBytesConfig(
    load_in_4bit=True,
    bnb_4bit_quant_type="nf4",
    bnb_4bit_compute_dtype=torch.float16
)

model = AutoModelForCausalLM.from_pretrained(
    model_name,
    quantization_config=quant_config
)
```

## FAQ

### Q1: What makes LLMs different from traditional NLP models?

**Answer:** LLMs differ in:
- Scale: Billions of parameters vs millions
- Emergent abilities: Capabilities that appear at scale
- Zero-shot/few-shot: Can perform tasks without specific training
- Generalization: Works across many domains

### Q2: How do I choose the right LLM for my task?

**Answer:** Consider:
1. Task requirements (reasoning, creativity, factual accuracy)
2. Latency requirements
3. Cost constraints
4. Privacy needs (local vs API)
5. Context window size needed

### Q3: What is the difference between GPT-3.5 and GPT-4?

**Answer:** Key differences:
- GPT-4 has better reasoning capabilities
- Larger context window (128K vs 4K)
- Better at following instructions
- More expensive to run
- Slower response times

### Q4: How do LLMs handle long documents?

**Answer:** Techniques include:
- Sliding window attention
- Sparse attention patterns
- Hierarchical processing
- Retrieval-Augmented Generation (RAG)
- Chunking strategies

### Q5: What is the "lost in the middle" problem?

**Answer:** LLMs tend to focus on information at the beginning and end of long contexts, potentially missing important details in the middle. Solutions include better attention mechanisms and retrieval strategies.

### Q6: Can LLMs run locally?

**Answer:** Yes, with:
- Quantized models (4-bit, 8-bit)
- Smaller models (7B, 13B parameters)
- Efficient frameworks (llama.cpp, Ollama)
- Hardware: 8GB+ RAM for 7B models

### Q7: What are system prompts?

**Answer:** System prompts set the LLM's behavior:
```
System: You are a helpful coding assistant. Be concise and provide examples.
User: How do I sort a list in Python?
Assistant: ...
```

### Q8: How do LLMs handle multiple languages?

**Answer:** Multilingual capabilities come from:
- Training on diverse language data
- Transfer learning between languages
- Shared tokenization (SentencePiece, BPE)
- Cross-lingual representations

### Q9: What is temperature in LLMs?

**Answer:** Temperature controls randomness:
- **0.0-0.3**: Deterministic, focused outputs
- **0.4-0.7**: Balanced creativity
- **0.8-1.0**: More random, diverse outputs
- **1.0+**: Very creative but potentially incoherent

### Q10: How do I evaluate LLM performance?

**Answer:** Evaluation methods:
- **Automatic:** BLEU, ROUGE, perplexity
- **Task-specific:** Accuracy, F1, exact match
- **Human evaluation:** Quality ratings
- **Benchmark suites:** MMLU, HumanEval, GSM8K

## Common Mistakes

### 1. Not Setting Proper Context Window

```python
# ❌ Wrong: Exceeding context window
long_text = "..." * 50000
response = client.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": long_text}]
)

# ✅ Right: Respect context limits
if len(long_text) > 12000:  # ~4K tokens for GPT-4
    chunks = chunk_text(long_text, max_length=4000)
    responses = [process_chunk(chunk) for chunk in chunks]
```

### 2. Ignoring Rate Limits

```python
# ❌ Wrong: No rate limiting
for prompt in prompts:
    response = client.chat.completions.create(...)

# ✅ Right: Implement rate limiting
import time
from ratelimit import limits, sleep_and_retry

@sleep_and_retry
@limits(calls=10, period=60)
def call_api(prompt):
    return client.chat.completions.create(...)

for prompt in prompts:
    response = call_api(prompt)
```

### 3. Not Handling API Errors

```python
# ❌ Wrong: No error handling
response = client.chat.completions.create(...)

# ✅ Right: Robust error handling
from openai import RateLimitError, APIError

try:
    response = client.chat.completions.create(...)
except RateLimitError:
    time.sleep(60)
    response = client.chat.completions.create(...)
except APIError as e:
    print(f"API error: {e}")
```

## Best Practices

### 1. Effective Prompting

```python
# Structured prompt for better results
prompt = f"""
### Task
{task_description}

### Context
{relevant_context}

### Requirements
1. {requirement_1}
2. {requirement_2}

### Output Format
{expected_format}

### Examples
{input_output_examples}
"""
```

### 2. Response Parsing

```python
# Parse structured LLM responses
import json

def parse_llm_response(response):
    # Extract JSON from response
    try:
        # Try direct JSON parse
        return json.loads(response)
    except json.JSONDecodeError:
        # Extract from markdown code block
        if "```json" in response:
            json_str = response.split("```json")[1].split("```")[0]
            return json.loads(json_str)
        raise ValueError("Could not parse response")
```

### 3. Caching Responses

```python
# Cache LLM responses to reduce costs
import hashlib
import pickle
from pathlib import Path

class LLMCache:
    def __init__(self, cache_dir="llm_cache"):
        self.cache_dir = Path(cache_dir)
        self.cache_dir.mkdir(exist_ok=True)
    
    def get_key(self, prompt, model):
        content = f"{model}:{prompt}"
        return hashlib.md5(content.encode()).hexdigest()
    
    def get(self, prompt, model):
        key = self.get_key(prompt, model)
        cache_file = self.cache_dir / f"{key}.pkl"
        if cache_file.exists():
            with open(cache_file, "rb") as f:
                return pickle.load(f)
        return None
    
    def set(self, prompt, model, response):
        key = self.get_key(prompt, model)
        cache_file = self.cache_dir / f"{key}.pkl"
        with open(cache_file, "wb") as f:
            pickle.dump(response, f)
```

## Quick Reference

| Aspect | Recommendation |
|--------|----------------|
| Small tasks | GPT-3.5-turbo |
| Complex reasoning | GPT-4, Claude-3 |
| Local deployment | LLaMA-3 8B, Mistral |
| Low latency | Quantized models, API streaming |
| High accuracy | RAG + verification |
| Privacy | On-premises deployment |

## Summary

- LLMs use transformers with self-attention
- Scale enables emergent capabilities
- Fine-tuning adapts models to specific tasks
- Quantization enables local deployment
- Prompt engineering is crucial for performance
- Evaluate with both automatic and human metrics
- Implement proper error handling and caching
