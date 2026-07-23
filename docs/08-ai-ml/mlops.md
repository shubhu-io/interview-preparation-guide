---
layout: default
title: MLOps
parent: AI & Machine Learning
nav_order: 11
---

# MLOps

MLOps (Machine Learning Operations) combines ML systems development with DevOps practices to reliably deploy, monitor, and maintain ML models in production.

## Introduction

MLOps bridges the gap between model development and production deployment. It encompasses the entire ML lifecycle from data management to model monitoring.

### MLOps Maturity Levels

| Level | Description | Characteristics |
|-------|-------------|-----------------|
| Level 0 | Manual process | Manual training, no CI/CD |
| Level 1 | ML pipeline automation | Automated training, basic monitoring |
| Level 2 | CI/CD for ML | Full automation, versioning |
| Level 3 | Full MLOps | Automated retraining, A/B testing |

## Key Concepts

### 1. ML Pipeline Components

```python
# Example: Full ML pipeline
from prefect import flow, task
import mlflow

@task
def load_data(source: str):
    """Load and validate raw data"""
    import pandas as pd
    df = pd.read_csv(source)
    assert len(df) > 0, "Empty dataset"
    return df

@task
def preprocess(df):
    """Feature engineering and preprocessing"""
    from sklearn.preprocessing import StandardScaler
    scaler = StandardScaler()
    features = scaler.fit_transform(df.drop("target", axis=1))
    return features, df["target"]

@task
def train(X, y):
    """Train model with experiment tracking"""
    from sklearn.ensemble import RandomForestClassifier
    from sklearn.model_selection import cross_val_score
    
    with mlflow.start_run():
        model = RandomForestClassifier(n_estimators=100)
        scores = cross_val_score(model, X, y, cv=5)
        
        mlflow.log_metric("accuracy", scores.mean())
        mlflow.sklearn.log_model(model, "model")
        
        return model

@flow
def ml_pipeline(source: str):
    """Main pipeline"""
    df = load_data(source)
    X, y = preprocess(df)
    model = train(X, y)
    return model

# Run pipeline
ml_pipeline("data/train.csv")
```

### 2. Model Registry

```python
# MLflow model registry
import mlflow

# Register model
model_uri = "runs:/<run_id>/model"
result = mlflow.register_model(model_uri, "my-model")

# Transition model stage
client = mlflow.tracking.MlflowClient()
client.transition_model_version_stage(
    name="my-model",
    version=1,
    stage="production"
)

# Load production model
model = mlflow.pyfunc.load_model("models:/my-model/production")
```

### 3. Monitoring & Alerting

```python
# Model monitoring
from prometheus_client import Counter, Gauge
import structlog

# Metrics
prediction_counter = Counter('predictions_total', 'Total predictions')
drift_gauge = Gauge('data_drift_score', 'Data drift score')
latency_histogram = Histogram('prediction_latency_seconds', 'Prediction latency')

class ModelMonitor:
    def __init__(self, reference_data):
        self.reference_data = reference_data
        self.predictions = []
    
    def log_prediction(self, input_data, prediction, latency):
        prediction_counter.inc()
        latency_histogram.observe(latency)
        
        self.predictions.append({
            "input": input_data,
            "prediction": prediction,
            "timestamp": datetime.now()
        })
    
    def check_drift(self, new_data):
        from scipy.stats import ks_2samp
        
        drift_scores = []
        for col in self.reference_data.columns:
            stat, p_value = ks_2samp(self.reference_data[col], new_data[col])
            drift_scores.append(1 - p_value)
        
        avg_drift = np.mean(drift_scores)
        drift_gauge.set(avg_drift)
        
        if avg_drift > 0.1:  # Threshold
            self.alert("Data drift detected!")
        
        return avg_drift
```

## FAQ

### Q1: What's the difference between MLOps and DevOps?

**Answer:** Key differences:
- MLOps deals with experiments and data
- Model versioning differs from code versioning
- ML requires continuous monitoring for drift
- Experiments need reproducibility
- Resource requirements are different (GPU vs CPU)

### Q2: How do I handle model versioning?

**Answer:** Versioning strategies:
- Use model registries (MLflow, Weights & Biases)
- Tag versions with metrics
- Maintain promotion stages (staging → production)
- Keep rollback capability
- Version data alongside models

### Q3: What is feature store?

**Answer:** A feature store manages ML features:
- Centralized feature definitions
- Consistent features for training/serving
- Feature versioning
- Low-latency serving for inference
- Examples: Feast, Tecton, Hopsworks

### Q4: How do I handle model drift?

**Answer:** Drift handling:
1. Monitor data distribution changes
2. Track model performance metrics
3. Set up alerts for drift thresholds
4. Implement automated retraining
5. A/B test new models

### Q5: What tools are in the MLOps stack?

**Answer:** Common tools:
- **Experiment Tracking**: MLflow, W&B
- **Orchestration**: Airflow, Prefect, Kubeflow
- **Feature Store**: Feast, Tecton
- **Model Serving**: TorchServe, Triton, Seldon
- **Monitoring**: Evidently, WhyLabs

### Q6: How do I deploy models efficiently?

**Answer:** Deployment strategies:
- Containerization (Docker, Kubernetes)
- Serverless (AWS Lambda, Cloud Functions)
- Edge deployment (TensorRT, ONNX)
- Batch inference
- Real-time serving

### Q7: What is continuous training?

**Answer:** Automated model retraining:
- Triggered by data changes or schedule
- Validates model quality before deployment
- Includes data validation steps
- Maintains experiment history
- Supports rollback

### Q8: How do I test ML models?

**Answer:** Testing types:
- **Unit tests**: Individual components
- **Integration tests**: Pipeline flow
- **Model tests**: Performance benchmarks
- **Data tests**: Schema, quality
- **Shadow testing**: Compare with production

### Q9: What is data lineage?

**Answer:** Tracking data origins:
- Where data came from
- How it was transformed
- Which models used it
- Audit compliance
- Debugging issues

### Q10: How do I scale ML systems?

**Answer:** Scaling strategies:
- Horizontal scaling for serving
- Distributed training
- Feature store for shared features
- Model caching
- Async processing for large batches

## Common Mistakes

### 1. No Experiment Tracking

```python
# ❌ Wrong: No tracking
model = train(X, y)
accuracy = evaluate(model, X_test, y_test)

# ✅ Right: Track everything
import mlflow

with mlflow.start_run(run_name="rf_v1"):
    mlflow.log_params({"n_estimators": 100, "max_depth": 10})
    model = train(X, y)
    accuracy = evaluate(model, X_test, y_test)
    mlflow.log_metric("accuracy", accuracy)
    mlflow.sklearn.log_model(model, "model")
```

### 2. Manual Deployments

```python
# ❌ Wrong: Manual model deployment
model = load_model("model.pkl")
# Manually copy to server
# Manually restart service

# ✅ Right: Automated pipeline
@flow
def deploy_model(model_version):
    """Automated deployment"""
    model = load_from_registry(model_version)
    
    # Validate model
    metrics = validate_model(model)
    if metrics["accuracy"] < 0.85:
        raise ValueError("Model below threshold")
    
    # Deploy
    container = build_container(model)
    deploy_to_kubernetes(container)
    
    # Monitor
    setup_monitoring(model_version)
```

### 3. Ignoring Data Validation

```python
# ❌ Wrong: Trust input data
def predict(data):
    return model.predict(data)

# ✅ Right: Validate data
from great_expectations.dataset import PandasDataset

def validate_input(data):
    ds = PandasDataset(data)
    
    expectations = [
        ds.expect_column_values_to_not_be_null("feature1"),
        ds.expect_column_values_to_be_between("feature2", 0, 100),
        ds.expect_table_row_count_to_be_between(1, 10000)
    ]
    
    results = [e.success for e in expectations]
    return all(results)

def predict(data):
    if not validate_input(data):
        raise ValueError("Invalid input data")
    return model.predict(data)
```

## Best Practices

### 1. Project Structure

```
ml-project/
├── data/
│   ├── raw/
│   ├── processed/
│   └── features/
├── src/
│   ├── data/
│   │   ├── validate.py
│   │   └── transform.py
│   ├── models/
│   │   ├── train.py
│   │   └── predict.py
│   └── monitoring/
│       └── drift.py
├── pipelines/
│   └── training_pipeline.py
├── tests/
│   ├── test_data.py
│   └── test_model.py
├── configs/
│   └── config.yaml
├── Dockerfile
└── requirements.txt
```

### 2. Configuration Management

```python
# Using Hydra for configuration
from hydra import compose, initialize_config_dir
from dataclasses import dataclass

@dataclass
class TrainingConfig:
    n_estimators: int = 100
    max_depth: int = 10
    learning_rate: float = 0.01
    batch_size: int = 32
    epochs: int = 10

@hydra.main(config_path="configs", config_name="training")
def train(cfg: TrainingConfig):
    model = RandomForestClassifier(
        n_estimators=cfg.n_estimators,
        max_depth=cfg.max_depth
    )
    model.fit(X_train, y_train)
```

### 3. Model Serving

```python
# FastAPI model server
from fastapi import FastAPI, HTTPException
import joblib
import numpy as np

app = FastAPI()
model = joblib.load("model.pkl")

@app.post("/predict")
async def predict(features: list[float]):
    try:
        prediction = model.predict(np.array(features).reshape(1, -1))
        return {"prediction": prediction.tolist()}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@app.get("/health")
async def health():
    return {"status": "healthy"}

# Run with: uvicorn main:app --host 0.0.0.0 --port 8000
```

## Quick Reference

| Task | Recommended Tools |
|------|-------------------|
| Experiment Tracking | MLflow, W&B, DVC |
| Pipeline Orchestration | Airflow, Prefect, Kubeflow |
| Feature Store | Feast, Tecton |
| Model Serving | TorchServe, Triton, BentoML |
| Monitoring | Evidently, WhyLabs, Grafana |
| Version Control | DVC, Git LFS |

## Summary

- MLOps automates the ML lifecycle
- Track experiments and versions systematically
- Implement CI/CD for models
- Monitor data and model drift
- Validate inputs and outputs
- Use feature stores for consistency
- Deploy with rollback capability
