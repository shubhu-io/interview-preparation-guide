---
layout: default
title: Cloud Computing
parent: System Design
---

# Cloud Computing

## Introduction

Cloud Computing is the delivery of computing resources (servers, storage, databases, networking, software) over the internet on a pay-as-you-go basis. Major providers include AWS, Azure, and Google Cloud.

### Cloud Service Models

| Model | Description | Examples |
|-------|-------------|----------|
| IaaS | Infrastructure as a Service | EC2, Azure VMs, GCE |
| PaaS | Platform as a Service | Heroku, App Engine, Elastic Beanstalk |
| SaaS | Software as a Service | Gmail, Salesforce, Slack |
| FaaS | Function as a Service (Serverless) | Lambda, Azure Functions, Cloud Functions |

### Cloud Deployment Models

| Model | Description |
|-------|-------------|
| Public | Resources shared across organizations (AWS, Azure) |
| Private | Dedicated to single organization |
| Hybrid | Mix of public and private |
| Multi-cloud | Using multiple cloud providers |

---

## Key Concepts

### High Availability

**Availability Zones (AZ):** Isolated data centers within a region.
**Regions:** Geographic areas containing multiple AZs.
**Edge Locations:** Points of presence for CDN and DNS.

**Availability Targets:**
- 99.9% = 8.76 hours downtime/year
- 99.99% = 52.6 minutes downtime/year
- 99.999% = 5.26 minutes downtime/year

### Core AWS Services

**Compute:** EC2 (VMs), Lambda (Serverless), ECS/EKS (Containers)
**Storage:** S3 (Object), EBS (Block), EFS (File), Glacier (Archive)
**Database:** RDS (Relational), DynamoDB (NoSQL), ElastiCache (Cache)
**Networking:** VPC, ALB/NLB, CloudFront (CDN), Route 53 (DNS)

### Auto Scaling

**Policy Types:**
- **Target tracking** — Maintain metric at target value
- **Step scaling** — Scale based on CloudWatch alarms
- **Scheduled scaling** — Scale at specific times
- **Predictive scaling** — ML-based forecasting

### Serverless Architecture

**Benefits:** No server management, auto-scaling built-in, pay per invocation, high availability.

**Components:** Lambda (compute), API Gateway (HTTP), DynamoDB (database), S3 (storage), SQS/SNS (messaging).

### Cost Optimization Strategies

- Right-sizing instances
- Reserved instances/Savings plans (30-40% savings)
- Spot instances for fault-tolerant workloads (60-90% savings)
- S3 storage classes with lifecycle policies
- Stop unused resources
- Use managed services

### Disaster Recovery Strategies

| Strategy | RPO | RTO | Cost | Complexity |
|----------|-----|-----|------|------------|
| **Backup & Restore** | Hours | Hours | Low | Low |
| **Pilot Light** | Minutes | Minutes | Medium | Medium |
| **Warm Standby** | Seconds | Minutes | Medium-High | Medium-High |
| **Multi-Site Active-Active** | Near zero | Near zero | High | High |

### Well-Architected Framework (Six Pillars)

1. **Operational Excellence** — Automate, observe, iterate
2. **Security** — Defense in depth, traceability
3. **Reliability** — Recover from failures, meet demand
4. **Performance Efficiency** — Use resources efficiently
5. **Cost Optimization** — Avoid unnecessary costs
6. **Sustainability** — Minimize environmental impact

### Load Balancing Types

- **Application LB (ALB)** — HTTP/HTTPS, path-based routing
- **Network LB (NLB)** — TCP/UDP, ultra-low latency
- **Gateway LB (GWLB)** — Third-party virtual appliances

### VPC Subnet Design

- Public subnets: route to Internet Gateway, host ALBs, bastion hosts
- Private subnets: route to NAT Gateway, host application servers, databases
- Database subnets: no internet route, only accessible from app subnets

### Security Best Practices

- **IAM**: Least privilege, MFA, role-based access
- **Encryption**: At rest (KMS), in transit (TLS)
- **Logging**: CloudTrail for API audit, VPC Flow Logs
- **Monitoring**: GuardDuty for threat detection, CloudWatch alarms
- **Network**: WAF for web apps, Shield for DDoS protection

### Managed Services Benefits

- No server patching or maintenance
- Automatic scaling and high availability
- Built-in security and compliance
- Reduced operational overhead
- Pay-per-use pricing models

---

## FAQ (Top 10)

### Q1: Design a highly available web application on AWS.
**A:** Deploy across 2+ AZs. Use ALB for traffic distribution. Auto Scaling EC2 in multiple AZs. RDS Multi-AZ for database failover. S3 + CloudFront for static assets. ElastiCache for session storage.

### Q2: When would you use Lambda vs. EC2?
**A:** Lambda: Event-driven, short-running (<15min), variable traffic, no server management needed. EC2: Long-running processes, consistent traffic, need OS control, stateful applications.

### Q3: How do you secure an AWS environment?
**A:** IAM with least privilege and MFA. VPC with private subnets, security groups, NACLs. Encryption at rest (KMS) and in transit (TLS). CloudTrail for audit logging. GuardDuty for threat detection.

### Q4: Explain the difference between horizontal and vertical scaling.
**A:** Vertical: increase instance size (simple, limited by hardware). Horizontal: add more instances (better fault tolerance, unlimited scaling, requires stateless design).

### Q5: What is eventual consistency?
**A:** All replicas converge to same value after some time. Use when high availability matters more than immediate consistency. Use strong consistency for financial data, inventory counts.

### Q6: Design a cost-effective architecture for variable traffic.
**A:** Serverless-first (Lambda + API Gateway). S3 + CloudFront for static assets. DynamoDB on-demand. Reserved capacity for baseline. Spot instances for batch processing.

### Q7: How do you handle a sudden traffic spike?
**A:** Auto Scaling to maximum capacity. ELB for distribution. CloudFront for caching. Read replicas for database. ElastiCache for frequent queries. Predictive scaling for pre-scaling.

### Q8: How do you optimize S3 costs?
**A:** Lifecycle policies to auto-transition tiers. Intelligent-Tiering for unknown access. Delete old versions. Compress objects. S3 Batch Operations for bulk changes.

### Q9: What is the difference between ALB and NLB?
**A:** ALB: HTTP/HTTPS, path-based routing, Layer 7. NLB: TCP/UDP, ultra-low latency, Layer 4. Use ALB for web apps; NLB for high-performance networking.

### Q10: How do you migrate a monolith to microservices?
**A:** Use Strangler Fig pattern. Identify service boundaries with DDD. Containerize services. Use ECS/EKS for orchestration. Database per service. API Gateway as entry point.

---

## Common Mistakes

| Mistake | Problem | Solution |
|---------|---------|----------|
| Using single AZ | No failover | Deploy across multiple AZs |
| Hardcoding credentials | Security risk | Use IAM roles and Secrets Manager |
| Over-provisioning | Wasted cost | Right-size and use auto scaling |
| No monitoring | Can't detect issues | Set up CloudWatch alarms |
| Ignoring security | Vulnerabilities | Follow security best practices |
| Not testing failover | Assumed HA | Regularly test failure scenarios |

---

## Best Practices

1. **Design for failure** — Assume things will break
2. **Use managed services** — Let AWS handle infrastructure
3. **Automate everything** — Infrastructure as Code (CloudFormation, Terraform)
4. **Monitor costs** — Set budgets and alerts
5. **Implement security** — Defense in depth
6. **Use CDNs** — Cache at edge locations
7. **Design stateless** — Enable horizontal scaling
8. **Use multiple AZs** — Never rely on a single data center
9. **Log everything** — Centralized logging for debugging and auditing
10. **Test regularly** — Load testing, chaos engineering

---

## Quick Reference

```
SERVICE MODELS
IaaS: You manage OS, apps (EC2)
PaaS: You manage apps only (Heroku)
SaaS: Fully managed (Gmail)
FaaS: Serverless functions (Lambda)

AVAILABILITY TARGETS
99.9%  = 8.76 hrs/year downtime
99.99% = 52.6 min/year downtime

SCALING STRATEGIES
Vertical: Bigger instance
Horizontal: More instances
Auto Scaling: Automatic adjustment

COST OPTIMIZATION
Reserved: 1-year commit (30-40% savings)
Spot: Unused capacity (60-90% savings)
Right-size: Match instance to workload
```
