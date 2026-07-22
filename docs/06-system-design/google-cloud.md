---
layout: default
title: Google Cloud
parent: System Design
---

# Google Cloud Platform

## Introduction

Google Cloud Platform (GCP) is a suite of cloud computing services providing infrastructure, platform, and serverless computing environments. Built on Google's infrastructure that powers Search, Gmail, and YouTube, GCP offers cutting-edge technologies in AI/ML, data analytics, and container orchestration.

---

## Key Concepts

### GCP Resource Hierarchy

- **Organization**: Top-level resource, maps to Google Workspace domain
- **Folders**: Group projects for organization and policy inheritance
- **Projects**: Basic organizational unit, all resources belong to a project
- **Resources**: Actual GCP services (VMs, databases, etc.)

### Compute Options

| Service | Use Case | Scaling | Management |
|---------|----------|---------|------------|
| Compute Engine | Full OS control | MIG auto-healing | IaaS |
| App Engine | Web applications | Auto-scale | PaaS |
| Cloud Functions | Event-driven code | Per-invocation | Serverless |
| Cloud Run | Containers | Auto-scale to zero | Serverless |
| GKE | Container orchestration | Cluster autoscaler | Managed K8s |

### Storage Classes

| Class | Access Pattern | Min Duration | Retrieval |
|-------|---------------|--------------|-----------|
| Standard | Frequently accessed | 0 days | Immediate |
| Nearline | Accessed monthly | 30 days | Immediate |
| Coldline | Accessed quarterly | 90 days | Immediate |
| Archive | Accessed annually | 365 days | Immediate |

### Storage Services

| Service | Description | Use Case |
|---------|-------------|----------|
| Cloud Storage | Object storage | Files, backups, static assets |
| Cloud SQL | Managed MySQL/PostgreSQL | Standard relational |
| Cloud Spanner | Globally distributed relational | Global, mission-critical apps |
| Firestore | Serverless NoSQL document | Real-time sync, mobile apps |
| Bigtable | Wide-column NoSQL | Large analytical/operational workloads |
| Memorystore | Managed Redis/Memcached | High-performance caching |

### Networking

- **VPC**: Global virtual network across all regions
- **Cloud Load Balancing**: Global and regional (HTTP(S), TCP/UDP, Internal)
- **Cloud CDN**: Edge caching for low-latency content delivery
- **Cloud Armor**: DDoS protection and WAF
- **Cloud Interconnect**: Dedicated or partner connectivity to on-premises
- **Cloud VPN**: Encrypted tunnels between networks

### Security

- **Cloud IAM**: Identity and access management with predefined and custom roles
- **Secret Manager**: Secure storage for secrets, API keys, passwords
- **Cloud KMS**: Managed cryptographic key management
- **Security Command Center**: Threat detection and security analytics

### Data Analytics

- **BigQuery**: Serverless data warehouse for petabyte-scale analytics
- **Dataflow**: Unified stream and batch data processing (Apache Beam)
- **Pub/Sub**: Real-time messaging for event-driven architectures
- **Dataproc**: Managed Apache Spark and Hadoop

### DevOps

- **Cloud Build**: Fully managed CI/CD platform
- **Artifact Registry**: Container and artifact storage
- **Cloud Deploy**: Managed deployment pipelines
- **Terraform**: Multi-cloud Infrastructure as Code

### GKE Modes

- **Autopilot**: Fully managed — Google manages node infrastructure, you only define pods
- **Standard**: You control nodes, node pools, and cluster configuration

### BigQuery Architecture

- Serverless, highly scalable data warehouse
- Uses Dremel query engine for SQL queries
- Storage: Columnar storage (Capacitor format)
- Pricing: On-demand (per TB scanned) or flat-rate (reserved slots)

### Cloud Functions Triggers

- HTTP requests
- Cloud Storage events (create/delete)
- Pub/Sub messages
- Firestore events
- Firebase Auth events
- Scheduled cron jobs

### GCP Regions and Zones

- **Regions**: Geographic locations containing zones (datacenters)
- **Zones**: Isolated locations within a region
- GCP has 40+ regions and 120+ zones
- Resources can be deployed in specific zones for low latency or across zones for high availability

---

## FAQ (Top 10)

### Q1: What is the difference between Compute Engine and GKE?
**A:** Compute Engine provides individual VMs where you manage the OS and infrastructure. GKE is managed Kubernetes that orchestrates containerized workloads across multiple VMs with auto-scaling and self-healing.

### Q2: Explain Cloud Functions 1st gen vs 2nd gen.
**A:** 2nd gen runs on Cloud Run infrastructure with longer timeouts (up to 60 minutes), larger instances, traffic splitting. 1st gen has 9-minute timeout and simpler deployment.

### Q3: How does BigQuery handle pricing?
**A:** Storage (per GB per month), Queries (on-demand: per TB scanned, or flat-rate: reserved slots), Streaming inserts, Data transfers. Free tier: 1 TB queries and 10 GB storage per month.

### Q4: What is GKE Autopilot vs Standard mode?
**A:** Autopilot manages entire cluster including node provisioning, scaling, and security — you only define pods. Standard gives control over nodes, node pools, and cluster configuration.

### Q5: How does Cloud Spanner achieve consistency?
**A:** Uses TrueTime (atomic clocks and GPS receivers) for globally consistent reads with external consistency. Uses Paxos for replication across zones/regions.

### Q6: What is Cloud Run and how does it differ from App Engine?
**A:** Cloud Run deploys containers with automatic scaling (including to zero) and supports any language/runtime. App Engine Standard uses sandboxed environment with language-specific runtimes.

### Q7: How do you optimize costs in GCP?
**A:** Committed use discounts for predictable workloads, sustained use discounts for long-running VMs, preemptible/spot VMs for fault-tolerant workloads, right-size resources, storage lifecycle policies.

### Q8: What is Cloud Armor?
**A:** DDoS protection and WAF capabilities for applications behind Google Load Balancers. Preconfigured WAF rules, IP-based access control, rate limiting, adaptive protection using ML.

### Q9: Explain Pub/Sub messaging model.
**A:** Publishers send messages to topics. Subscribers receive messages from subscriptions. Features: At-least-once delivery, message ordering, dead-letter topics, exactly-once delivery.

### Q10: What is the difference between Cloud SQL and Cloud Spanner?
**A:** Cloud SQL: Managed MySQL/PostgreSQL with single-region availability and vertical scaling. Cloud Spanner: Globally distributed, horizontally scalable relational database with strong consistency.

---

## Common Mistakes

1. **Not using IAM least privilege** — Granting editor/owner roles instead of minimal permissions
2. **Ignoring VPC firewall rules** — Using default allow-all rules instead of deny-by-default
3. **Not setting budget alerts** — Failing to configure billing alerts to prevent unexpected costs
4. **Over-provisioning Compute Engine** — Choosing large machine types without monitoring usage
5. **Using default service accounts** — Instead of creating dedicated service accounts with minimal permissions
6. **Hard-coding credentials** — Storing API keys in code instead of using Secret Manager

---

## Best Practices

### Security
- Use IAM custom roles with least privilege
- Enable Organization Policies for constraints
- Implement VPC Service Controls for sensitive workloads
- Use Cloud Armor for DDoS and WAF protection

### Performance
- Use committed use discounts for predictable workloads
- Leverage preemptible VMs for fault-tolerant workloads
- Implement Cloud CDN for global content delivery
- Use BigQuery partitioning and clustering

### Cost Optimization
- Right-size VMs based on actual usage
- Use sustained use discounts (automatic 20-30% discount)
- Implement storage lifecycle policies
- Set up budget alerts and quotas

### Reliability
- Deploy across multiple zones and regions
- Use health checks for load balancing
- Implement circuit breakers in applications
- Regular disaster recovery testing

---

## Quick Reference

```
GCLOUD CLI:
gcloud config set project PROJECT_ID
gcloud compute instances create NAME
gcloud container clusters create-auto CLUSTER_NAME --region=REGION
gcloud functions deploy NAME --trigger-http
gsutil mb -l LOCATION gs://BUCKET
bq mk DATASET

COMPUTE: Compute Engine (VMs), Cloud Run (Containers), Cloud Functions (FaaS), GKE (Kubernetes)
STORAGE: Cloud Storage (Objects), Cloud SQL (Relational), Cloud Spanner (Global), Firestore (NoSQL)
ANALYTICS: BigQuery (Warehouse), Dataflow (Processing), Pub/Sub (Messaging), Dataproc (Spark/Hadoop)
NETWORKING: VPC, Cloud Load Balancing, Cloud CDN, Cloud Armor, Cloud Interconnect
SECURITY: Cloud IAM, Secret Manager, Cloud KMS, Security Command Center

PRICING:
Compute Engine: Per-second billing, sustained use discounts
Cloud Storage: Per GB per month + operations
BigQuery: Per TB scanned (on-demand) or slots (flat-rate)
```
