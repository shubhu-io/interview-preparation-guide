---
layout: default
title: Site Reliability Engineering
parent: Data & Analytics
---

# Site Reliability Engineering

## Introduction

Site Reliability Engineering (SRE) is a software engineering approach to IT operations. Created at Google, SRE applies software engineering practices to operations problems: automation, monitoring, incident response, and capacity planning. SRE teams build and maintain large-scale production systems, balancing reliability with feature velocity.

SRE focuses on measuring and improving reliability through Service Level Objectives (SLOs), error budgets, and automation. It treats operations as a software problem, reducing toil through engineering solutions.

---

## Key Concepts

| Concept | Description |
|---------|-------------|
| SLI | Service Level Indicator - quantitative metric |
| SLO | Service Level Objective - target for SLI |
| SLA | Service Level Agreement - contractual commitment |
| Error Budget | Remaining acceptable unreliability |
| Toil | Manual, repetitive, automatable work |
| Postmortem | Blameless incident analysis |
| Chaos Engineering | Deliberately injecting failures |
| Observability | Understanding system state from outputs |
| Runbook | Step-by-step incident response guide |
| MTTR | Mean Time To Repair |
| MTBF | Mean Time Between Failures |
| Canary Deployment | Gradual rollout to small traffic percentage |
| Feature Flag | Toggle features without deployment |

---

## FAQ

### Q1: What is the difference between SLA, SLO, and SLI?
**A:** SLI is a metric (latency, error rate). SLO is the target for that metric (99.9%). SLA is the contractual promise with consequences. SLIs feed SLOs; SLOs define SLAs.

### Q2: What is an error budget?
**A:** The difference between 100% and your SLO. If SLO is 99.9%, error budget is 0.1% (43 min/month). When exhausted, halt features and focus on reliability.

### Q3: What is toil?
**A:** Manual, repetitive, automatable, reactive work that scales linearly. Examples: manual deployments, repetitive troubleshooting, ticket processing. SREs should automate this away.

### Q4: What is a postmortem?
**A:** Blameless analysis after an incident. Documents timeline, root cause, impact, what went well, what could improve, and action items. Purpose is learning, not blame.

### Q5: What is observability?
**A:** Understanding internal system state from external outputs. Built on three pillars: metrics (what happened), logs (details), traces (request flow). Enables debugging complex distributed systems.

### Q6: What is chaos engineering?
**A:** Deliberately injecting failures to test resilience before they happen naturally. Builds confidence in system's ability to handle real failures. Netflix's Chaos Monkey is a famous example.

### Q7: How do you design good alerts?
**A:** Alert on symptoms not causes. Each alert should require human action. Include severity levels and runbooks. Avoid alert fatigue by tuning thresholds. PagerDuty, OpsGenie for routing.

### Q8: What is the difference between monitoring and observability?
**A:** Monitoring watches known failure modes and alerts. Observability enables understanding any system state from outputs, including unknown failures. Monitoring tells you something is wrong; observability helps you understand why.

### Q9: What is capacity planning?
**A:** Ensuring systems handle expected load. Forecast demand, model resource usage, plan for growth, balance cost and reliability. Use auto-scaling for dynamic workloads.

### Q10: What is a runbook?
**A:** Step-by-step guide for handling specific incidents. Reduces MTTR by giving on-call engineers clear procedures. Should be kept updated and easily accessible.

---

## Common Mistakes

1. Alerting on causes instead of symptoms
2. Alert fatigue from too many non-actionable alerts
3. Skipping postmortems after incidents
4. Blaming individuals instead of systemic analysis
5. Not tracking error budgets
6. Ignoring toil accumulation
7. Monitoring only infrastructure, not user experience
8. Not testing failover procedures
9. Over-engineering for edge cases
10. Not documenting runbooks

---

## Best Practices

1. Define clear SLOs for every service
2. Track and manage error budgets
3. Invest in automation to reduce toil
4. Conduct blameless postmortems
5. Practice chaos engineering
6. Design alerts requiring human action
7. Maintain updated runbooks
8. Test failover and recovery regularly
9. Monitor user experience, not just infrastructure
10. Share learnings across teams

---

## Quick Reference

### SRE Formulas

| Metric | Formula |
|--------|---------|
| Availability | (Total Time - Downtime) / Total Time |
| Error Budget | 1 - SLO |
| MTBF | Total Uptime / Number of Failures |
| MTTR | Total Repair Time / Number of Repairs |
| Throughput | Requests / Time Period |

### SLO Targets Guide

| SLO | Downtime/Month | Downtime/Year |
|-----|---------------|---------------|
| 99% | 7.3 hours | 3.65 days |
| 99.9% | 43 min | 8.76 hours |
| 99.99% | 4.3 min | 52.6 min |
| 99.999% | 26 sec | 5.26 min |

### Golden Signals

| Signal | What It Measures |
|--------|-----------------|
| Latency | Time to serve requests |
| Traffic | Demand on system |
| Errors | Rate of failed requests |
| Saturation | Resource utilization |

### Monitoring Stack

| Tool | Purpose |
|------|---------|
| Prometheus | Metrics collection and alerting |
| Grafana | Dashboard visualization |
| ELK Stack | Log aggregation and search |
| Jaeger | Distributed tracing |
| PagerDuty | Incident routing |
| OpsGenie | Alert management |

### Deployment Strategies

| Strategy | Description |
|----------|-------------|
| Blue-Green | Two identical environments, swap traffic |
| Canary | Gradual rollout to small percentage first |
| Rolling | Update instances incrementally |
| Feature Flags | Toggle features without deployment |

---

## Learning Roadmap

### Phase 1: SRE Fundamentals (Week 1-2)
- SRE principles and philosophy
- SLAs, SLOs, SLIs
- Error budgets, toil reduction

### Phase 2: Monitoring and Observability (Week 3-4)
- Metrics, logs, traces
- Alerting design
- Prometheus, Grafana, ELK

### Phase 3: Incident Management (Week 5-6)
- On-call practices
- Incident response process
- Postmortems

### Phase 4: Reliability Engineering (Week 7-8)
- Capacity planning
- Load balancing
- Chaos engineering

### Phase 5: Advanced (Week 9-12)
- Automation and toil reduction
- Release engineering
- Cost optimization
