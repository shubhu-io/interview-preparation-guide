---
layout: default
title: Site Reliability Engineering (SRE)
parent: Specialized Domains
---

# Site Reliability Engineering (SRE)

## Introduction

SREs keep production systems reliable, fast, and within budget. It's software engineering applied to operations. Roles: SRE, Platform Engineer, Reliability Engineer, Production Engineer, Incident Manager.

## What the Role Does

- Define SLOs/SLIs/SLAs and error budgets.
- Automate operations: deployments, scaling, incident response.
- Build monitoring, alerting, dashboards, and on-call tooling.
- Reduce toil; improve release reliability (canaries, feature flags).
- Capacity planning and chaos engineering.
- Post-incident reviews and blameless culture.

## Hiring Companies

All large-scale platforms: Google, Amazon, Netflix, Meta, LinkedIn, Uber, Databricks, and India: Flipkart, Swiggy, Zomato, PhonePe, Razorpay, Hotstar, plus cloud/DevOps teams everywhere.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| Linux & Systems | Processes, systemd, kernel concepts, networking ([40-Linux](../../40-Linux/)) |
| Distributed Systems | CAP, consensus, backpressure, idempotency ([44-Distributed-Systems](../../44-Distributed-Systems/)) |
| SLO/Error Budgets | SLIs, SLOs, error budgets, alerts on burn rate |
| Monitoring | Prometheus, Grafana, metrics/logs/traces ([57-Monitoring](../../57-Monitoring/)) |
| Kubernetes | Scheduling, autoscaling, probes, troubleshooting ([51-Kubernetes](../../51-Kubernetes/)) |
| Incident Response | Detection, triage, mitigation, blameless postmortems |
| Reliability Patterns | Retries, circuit breakers, graceful degradation, rate limiting |
| Toil Reduction | Automation, self-healing, infrastructure as code |
| SRE Tooling | Terraform, CI/CD, operators, feature flags, canary |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Linux, networking, fundamentals of distributed systems
Weeks 3-4:   Build a monitoring stack (Prometheus + Grafana) with alerts
Weeks 5-6:   Kubernetes: deploy, scale, probes, troubleshooting
Weeks 7-8:   SLO/error budget math + reliability patterns
Weeks 9-10:  Incident response simulation (game days) + postmortems
Weeks 11-12: Mock system/reliability rounds + portfolio pipeline
```

## Sample Interview Questions

- A service's error rate spiked at 3am. Walk me through your response.
- Design an SLO for a login service. How do you alert without paging on noise?
- What's the difference between an SLO and an SLA? What is an error budget?
- How do you make a deployment safe? (canary, feature flag, rollback)
- Explain circuit breakers and retry storms.
- A pod is CrashLoopBackOff and memory-heavy — diagnose it.
- How do you reduce toil in a repeatable incident?

## Projects for Portfolio

- A monitoring+alerting stack with real SLOs and burn-rate alerts.
- A Kubernetes workload with autoscaling, probes, and a canary deploy script.
- Blameless postmortem write-up for a simulated (or real past) incident.
- A reliability automation: self-healing script, feature-flag rollout, load test.

## Tools to Learn

- Monitoring: Prometheus, Grafana, Loki, Alertmanager, OpenTelemetry
- K8s: k3s/minikube, Helm, kubectl
- IaC/CI: Terraform, GitHub Actions/GitLab CI
- Load: k6, vegeta, Locust
- Incident: incident-io or simple runbooks; playbooks in markdown

## Key Links

- SRE folder: [77-SRE](../../77-SRE/)
- DevOps: [49-DevOps](../../49-DevOps/), [DevOps & Cloud Engineering](devops-cloud-engineering)
- Monitoring: [57-Monitoring](../../57-Monitoring/)
- Distributed Systems: [44-Distributed-Systems](../../44-Distributed-Systems/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Approaching SRE as pure ops — it's a software engineering role.
2. Not understanding SLO/error-budget math.
3. Weak on incident response process (the #1 scenario question).
4. No hands-on monitoring/k8s portfolio.
5. Ignoring toil reduction — automation is the whole point.