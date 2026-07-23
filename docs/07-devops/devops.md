---
layout: default
title: DevOps
parent: DevOps & Cloud
---

# DevOps
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Introduction

DevOps is a set of practices, tools, and cultural philosophies that automate and integrate processes between software development (Dev) and IT operations (Ops). It aims to shorten the software development lifecycle while delivering features, fixes, and updates frequently and reliably.

DevOps encompasses continuous integration, continuous delivery, infrastructure as code, configuration management, containerization, monitoring, and collaboration. Organizations adopting DevOps achieve faster time-to-market, fewer failure rates, and quicker recovery times.

---

## Key Concepts

### CALMS Framework

| Pillar | Description |
|--------|-------------|
| **C**ulture | Collaboration, shared responsibility, blameless postmortems |
| **A**utomation | Automate everything from testing to deployment |
| **L**ean | Eliminate waste, limit work in progress, continuous improvement |
| **M**easurement | Track metrics to drive decisions (DORA metrics) |
| **S**haring | Knowledge sharing, cross-functional teams, feedback loops |

### The Three Ways

1. **Flow**: Optimize left-to-right flow from development to operations to customer
2. **Feedback**: Create fast, frequent feedback loops from operations to development
3. **Continuous Learning**: Foster culture of experimentation, risk-taking, and learning from failure

### DORA Metrics

| Metric | Low Performers | High Performers |
|--------|---------------|-----------------|
| Deployment Frequency | Once per month | Multiple times per day |
| Lead Time for Changes | One month to six months | Less than one hour |
| MTTR | One week to one month | Less than one hour |
| Change Failure Rate | 15-30% | 0-15% |

### DevOps Lifecycle

```
Plan → Code → Build → Test → Release → Deploy → Operate → Monitor
  ↑                                                           ↓
  ←←←←←←←←←←←←← Feedback Loop ←←←←←←←←←←←←←←←←←←←←←←←←←←←
```

### Infrastructure as Code Approaches

- **Declarative**: Define desired state (Terraform, CloudFormation)
- **Imperative**: Define step-by-step instructions (scripts, Ansible playbooks)
- **Immutable**: Replace infrastructure rather than modify (containers, golden images)
- **Mutable**: Modify existing infrastructure in place (traditional config management)

---

## FAQ (Top 10)

### Q1: What is the difference between DevOps and SRE?
**A:** DevOps is a cultural philosophy and set of practices. SRE is a specific implementation of DevOps with emphasis on reliability, error budgets, and automation of operations tasks.

### Q2: What is Infrastructure as Code and why is it important?
**A:** IaC manages infrastructure through machine-readable configuration files rather than manual processes. Benefits: version control, reproducibility, automation, documentation, and consistency across environments.

### Q3: Explain the difference between continuous delivery and continuous deployment.
**A:** Continuous Delivery: Code is always in a deployable state; releases require manual approval. Continuous Deployment: Every change that passes tests is automatically deployed to production.

### Q4: What is blue-green deployment?
**A:** Deployment strategy maintaining two identical environments (blue and green). Traffic switches from blue (current) to green (new) after deployment verification. Enables instant rollback.

### Q5: What is canary deployment?
**A:** Deployment strategy that gradually rolls out changes to a small subset of users before full deployment. Allows monitoring for issues before affecting all users.

### Q6: What is GitOps?
**A:** Operational framework where Git repositories are the single source of truth for declarative infrastructure and applications. Changes are made via pull requests, and automated agents reconcile desired state.

### Q7: What are the three pillars of observability?
**A:** Metrics (numerical measurements over time), Logs (discrete event records), and Traces (distributed request flow). Together they provide complete visibility into system behavior.

### Q8: What is chaos engineering?
**A:** Practice of intentionally introducing failures into systems to test resilience and identify weaknesses before they cause outages.

### Q9: What is an error budget?
**A:** The acceptable level of unreliability based on SLOs. If SLO is 99.9%, error budget is 0.1%. Teams can spend error budget on faster releases; once exhausted, reliability becomes priority.

### Q10: What is shift-left testing?
**A:** Moving testing earlier in the development lifecycle. Instead of testing before release, tests run throughout development, catching issues sooner and reducing cost of fixing bugs.

---

## Common Mistakes

1. **Manual deployments** - Performing deployments manually instead of automating through CI/CD pipelines
2. **Skipping automated tests** - Not implementing comprehensive automated testing in pipelines
3. **Ignoring infrastructure as code** - Managing infrastructure through console clicks instead of version-controlled code
4. **No monitoring or alerting** - Deploying without observability, leading to blind spots
5. **Blame culture** - Focusing on individual blame during incidents instead of systemic improvements
6. **Ignoring security** - Treating security as an afterthought instead of integrating it throughout the pipeline (DevSecOps)
7. **Too many manual approvals** - Creating bottlenecks with excessive approval gates
8. **Not implementing rollback strategies** - Deploying without ability to quickly rollback changes
9. **Ignoring technical debt** - Not allocating time for refactoring and paying down technical debt
10. **Silos between teams** - Maintaining separate Dev and Ops teams without shared responsibility

---

## Best Practices

### CI/CD
- Keep pipelines fast (under 10 minutes ideal)
- Run tests in parallel
- Cache dependencies and build artifacts
- Implement branch protection rules

### Infrastructure as Code
- Store state files securely (remote state)
- Use modules for reusable components
- Implement drift detection
- Plan before apply

### Monitoring
- Implement the four golden signals (latency, traffic, errors, saturation)
- Create actionable alerts (not noisy)
- Use structured logging
- Implement distributed tracing

### Incident Management
- Establish clear on-call rotations
- Create and maintain runbooks
- Conduct blameless postmortems
- Track and trend incident metrics

---

## Quick Reference

### Git Commands
```bash
git init                    # Initialize repo
git add .                   # Stage all changes
git commit -m "message"     # Commit changes
git push origin main        # Push to remote
git pull origin main        # Pull from remote
git branch feature-xyz      # Create branch
git merge feature-xyz       # Merge branch
git stash                   # Stash changes
```

### Docker Commands
```bash
docker build -t myapp:1.0 .    # Build image
docker run -p 8080:80 myapp    # Run container
docker ps                       # List containers
docker-compose up -d            # Start services
docker-compose down             # Stop services
```

### Kubernetes Commands
```bash
kubectl get pods               # List pods
kubectl describe pod POD_NAME  # Pod details
kubectl logs POD_NAME          # View logs
kubectl apply -f file.yaml     # Apply manifest
kubectl scale deployment NAME --replicas=3  # Scale
```

### Terraform Commands
```bash
terraform init          # Initialize
terraform plan          # Preview changes
terraform apply         # Apply changes
terraform destroy       # Destroy infrastructure
terraform state list    # List resources
```
