---
layout: default
title: DevOps & Cloud Engineering
parent: Specialized Domains
---

# DevOps & Cloud Engineering

## Introduction

DevOps and Cloud engineers automate the path from code to production. Roles: DevOps Engineer, Cloud Engineer, Platform Engineer, SRE, Release Engineer, AWS/Azure/GCP Engineer.

## What the Role Does

- Build CI/CD pipelines (GitHub Actions, Jenkins, GitLab CI).
- Run containers and orchestration (Docker, Kubernetes).
- Provision infrastructure as code (Terraform, CloudFormation).
- Manage cloud platforms: AWS, Azure, GCP.
- Implement monitoring, logging, alerting, and incident response.
- Automate everything: builds, tests, deploys, scaling, compliance.

## Hiring Companies

All companies with production software, plus cloud-focused firms: AWS, Google Cloud, Microsoft, and India: CloudFront, MobiStark, Zluri, plus IT services clouds teams.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| Linux & Shell | Commands, processes, systemd, scripting ([40-Linux](../../40-Linux/)) |
| Git & CI/CD | Git flows, GitHub Actions, Jenkins, GitLab CI ([54-Git](../../54-Git/), [56-CICD](../../56-CICD/)) |
| Containers | Docker images, compose, registry, multi-stage builds ([50-Docker](../../50-Docker/)) |
| Kubernetes | Pods, deployments, services, Ingress, Helm, RBAC ([51-Kubernetes](../../51-Kubernetes/)) |
| IaC | Terraform, Ansible, CloudFormation ([52-Terraform](../../52-Terraform/)) |
| Cloud (AWS/Azure/GCP) | Core services: compute, storage, networking, IAM ([46-AWS](../../46-AWS/), [47-Azure](../../47-Azure/), [48-Google-Cloud](../../48-Google-Cloud/)) |
| Monitoring | Prometheus, Grafana, ELK/Loki, alerting ([57-Monitoring](../../57-Monitoring/)) |
| Security | Secrets management, IAM, vulnerability scanning ([58-Security](../../58-Security/)) |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Linux + shell + Git mastery
Weeks 3-4:   Docker + build a containerized app
Weeks 5-6:   CI/CD pipeline from commit to deploy
Weeks 7-8:   Kubernetes: deploy, scale, troubleshoot
Weeks 9-10:  Terraform/IaC + one cloud cert track
Weeks 11-12: Mock DevOps rounds + a full demo pipeline
```

## Sample Interview Questions

- Walk me through a production CI/CD pipeline you'd design.
- How do you debug a pod that's CrashLoopBackOff in Kubernetes?
- Dockerfile optimization: how do you make a build fast and small?
- How do you handle secrets in CI/CD and Kubernetes?
- Design monitoring for a microservices app — metrics, logs, alerts.
- Explain Blue-Green vs Canary deployment.
- How does IAM/least-privilege work in AWS/GCP?

## Projects for Portfolio

- End-to-end CI/CD: GitHub repo → tests → Docker image → Kubernetes → monitoring.
- Terraform module that provisions a cloud env; document `plan/apply/destroy`.
- Kubernetes cluster with Helm charts, autoscaling, and canary rollout.
- A monitoring stack (Prometheus + Grafana) with custom alerts.

## Tools to Learn

- Containers: Docker, docker-compose, registry
- Orchestration: Kubernetes, Helm, minikube, k3s
- CI/CD: GitHub Actions, Jenkins, GitLab CI
- IaC: Terraform, Ansible
- Cloud: AWS free tier (S3, EC2, Lambda, RDS, IAM), GCP/Azure trials
- Observability: Prometheus, Grafana, Loki, Alertmanager

## Key Links

- DevOps folders: [49-DevOps](../../49-DevOps/) → [57-Monitoring](../../57-Monitoring/)
- Cloud: [45-Cloud-Computing](../../45-Cloud-Computing/), [46-AWS](../../46-AWS/), [47-Azure](../../47-Azure/), [48-Google-Cloud](../../48-Google-Cloud/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Knowing tools by name but not how they interact end-to-end.
2. No hands-on deployed pipeline in the portfolio.
3. Weak Linux/shell fundamentals — they power everything.
4. Ignoring security (secrets, IAM) — a senior interview differentiator.
5. Not being able to troubleshoot under pressure (pod issues, failed builds).