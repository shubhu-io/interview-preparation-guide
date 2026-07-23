---
layout: default
title: AWS
parent: System Design
---

# AWS

## Introduction

Amazon Web Services (AWS) is the world's most comprehensive cloud platform, offering over 200 services from compute and storage to AI/ML and IoT. AWS knowledge is essential for backend developers, DevOps engineers, and architects.

### AWS Global Infrastructure

| Concept | Description |
|---------|-------------|
| Region | Geographic area (us-east-1, eu-west-1) |
| AZ | Data center within a region (2-6 per region) |
| Edge Location | CDN/POP points (200+ locations) |

---

## Key Concepts

### Compute Services

**EC2 Instance Types:**
| Family | Purpose | Example |
|--------|---------|---------|
| General Purpose | Balanced | t3, m5 |
| Compute Optimized | CPU-heavy | c5, c6g |
| Memory Optimized | RAM-heavy | r5, x1 |
| Storage Optimized | I/O-heavy | i3, d2 |
| Accelerated | GPU/ML | p3, g4 |

**EC2 Pricing:** On-Demand (pay per hour), Reserved (1-3 year commitment, 30-60% savings), Spot (unused capacity, 60-90% savings, can be interrupted).

### Storage Services

**S3 Storage Classes:**
| Class | Use Case | Cost |
|-------|----------|------|
| Standard | Frequently accessed | $$$ |
| Intelligent-Tiering | Unknown access patterns | $$ |
| Standard-IA | Infrequent access | $$ |
| Glacier Instant | Archive, millisecond retrieval | $ |
| Glacier Flexible | Archive, minutes-hours | ¢ |
| Glacier Deep | Archive, 12+ hours | ¢¢ |

### Database Services

**RDS Engines:** MySQL, PostgreSQL, MariaDB, Oracle, SQL Server, Aurora

**DynamoDB:** Key-value and document database with single-digit millisecond performance and auto-scaling.

### Networking

**VPC Components:** Subnets (public/private), Route tables, Internet Gateway, NAT Gateway, Security Groups (stateful), Network ACLs (stateless).

### Security

**IAM Best Practices:** Least privilege principle, use roles not access keys, enable MFA, rotate credentials, use AWS Organizations for multi-account.

### Well-Architected Framework (Six Pillars)

| Pillar | Key Principles |
|--------|---------------|
| **Operational Excellence** | Automate operations, observe, iterate, IaC |
| **Security** | Defense in depth, traceability, automate security |
| **Reliability** | Auto-recover from failures, meet demand |
| **Performance Efficiency** | Use resources efficiently |
| **Cost Optimization** | Avoid unnecessary costs |
| **Sustainability** | Minimize environmental impact |

### Serverless Services

| Service | Purpose |
|---------|---------|
| Lambda | Compute (functions) |
| API Gateway | HTTP endpoints |
| DynamoDB | Database |
| S3 | Object storage |
| SQS/SNS | Messaging |
| Step Functions | Workflow orchestration |

### Container Services

| Service | Description |
|---------|-------------|
| ECS | Managed container orchestration |
| EKS | Managed Kubernetes |
| Fargate | Serverless containers |
| ECR | Container registry |

### Monitoring & Logging

| Service | Purpose |
|---------|---------|
| CloudWatch | Metrics, logs, alarms |
| CloudTrail | API audit logging |
| X-Ray | Distributed tracing |
| GuardDuty | Threat detection |

### Disaster Recovery Options

| Strategy | Description | RPO | RTO | Cost |
|----------|-------------|-----|-----|------|
| **Backup & Restore** | Restore from backups to new infrastructure | Hours | Hours | Low |
| **Pilot Light** | Minimal always-on infrastructure | Minutes | Minutes | Medium |
| **Warm Standby** | Scaled-down full stack, scale up on failover | Seconds | Minutes | Medium-High |
| **Multi-Site Active-Active** | Full capacity in multiple regions | Near zero | Near zero | High |

### Infrastructure as Code

| Service | Description |
|---------|-------------|
| CloudFormation | AWS-native IaC |
| CDK | Programmatic IaC |
| Terraform | Multi-cloud IaC |

### Advanced Networking

- **VPC Flow Logs**: Capture IP traffic metadata for troubleshooting and security analysis
- **VPC Endpoints**: Private connectivity to AWS services without internet
- **Transit Gateway**: Hub for connecting VPCs and on-premises networks
- **Direct Connect**: Dedicated network connection from on-premises to AWS
- **PrivateLink**: Private connectivity between VPCs, AWS services, and on-premises

---

## FAQ (Top 10)

### Q1: Design a three-tier architecture on AWS.
**A:** Presentation tier: S3 + CloudFront for static assets; ALB for dynamic. Application tier: EC2 in Auto Scaling Group across 2+ AZs; or Lambda + API Gateway. Data tier: RDS Multi-AZ; ElastiCache for caching. VPC with public/private subnets.

### Q2: When would you use DynamoDB vs. RDS?
**A:** DynamoDB: Simple key-value access, single-digit ms latency at any scale, auto-scaling. RDS: Complex queries, JOINs, ACID transactions, relational data. Use DynamoDB for session storage, user profiles, gaming leaderboards.

### Q3: How do you optimize S3 costs?
**A:** Lifecycle policies to auto-transition tiers. Intelligent-Tiering for unknown access. Delete old versions. Compress objects. S3 Batch Operations for bulk changes.

### Q4: Explain the difference between Security Groups and Network ACLs.
**A:** Security Groups: Instance-level, stateful, allow rules only. Network ACLs: Subnet-level, stateless, allow and deny rules. Use Security Groups for most cases.

### Q5: How do you handle a sudden traffic spike on AWS?
**A:** Auto Scaling to maximum capacity. ELB for distribution. CloudFront for caching. Read replicas for database. ElastiCache for frequent queries. Predictive scaling for pre-scaling.

### Q6: Design a scalable order processing system on AWS.
**A:** ALB → ECS Fargate (or Lambda + API Gateway). SQS for order processing (decouple). Lambda or ECS consumers process orders. DynamoDB for orders. SNS for notifications. CloudWatch for monitoring.

### Q7: How do you implement a serverless API on AWS?
**A:** API Gateway for HTTP endpoints. Lambda for compute. DynamoDB for database. Use Serverless Framework or SAM for deployment. Include CORS, authentication, and error handling.

### Q8: What is the difference between SQS and SNS?
**A:** SQS: Message queue (one consumer). SNS: Pub/sub (many subscribers). Use SQS for decoupling; SNS for fan-out notifications.

### Q9: How do you secure an AWS account?
**A:** Use IAM users with least privilege. Enable MFA on all users. Use IAM roles for services. Enable CloudTrail for audit logging. Use VPC for network isolation. Enable GuardDuty for threat detection.

### Q10: How do you set up CI/CD on AWS?
**A:** CodeCommit for source. CodeBuild for building. CodeDeploy for deployment. CodePipeline for orchestration. Use buildspec.yml and appspec.yml for configuration.

---

## Common Mistakes

| Mistake | Problem | Solution |
|---------|---------|----------|
| Using root account | Security risk | Create IAM users with least privilege |
| Not enabling MFA | Account vulnerable | Enable MFA on all accounts |
| Hardcoded credentials | Security risk | Use IAM roles |
| Single-AZ deployment | No failover | Deploy across multiple AZs |
| Ignoring costs | Unexpected bills | Set billing alarms and budgets |
| No backups | Data loss risk | Enable automated backups |

---

## Best Practices

1. **Use IAM roles** — Not access keys for services
2. **Enable MFA** — On all users, especially root
3. **Tag resources** — For cost allocation and management
4. **Use managed services** — Let AWS handle infrastructure
5. **Design for failure** — Multi-AZ, auto scaling
6. **Automate with IaC** — CloudFormation or Terraform
7. **Monitor everything** — CloudWatch alarms
8. **Review costs regularly** — Cost Explorer, budgets
9. **Encrypt data** — At rest (KMS) and in transit (TLS)
10. **Use VPC endpoints** — Avoid public internet for AWS service access

---

## Quick Reference

```
COMPUTE: EC2 (VMs), Lambda (Serverless), ECS/EKS (Containers), Fargate (Serverless containers)
STORAGE: S3 (Object), EBS (Block), EFS (File), Glacier (Archive)
DATABASE: RDS (Relational), DynamoDB (NoSQL), ElastiCache (Cache), Redshift (Analytics)
NETWORKING: VPC, ALB/NLB, CloudFront (CDN), Route 53 (DNS)
SECURITY: IAM, KMS, WAF, Shield
MONITORING: CloudWatch, CloudTrail, X-Ray, GuardDuty

PRICING: On-Demand > Reserved > Spot (cost decreases, flexibility decreases)
S3: Standard > IA > Glacier (cost decreases, retrieval time increases)
```
