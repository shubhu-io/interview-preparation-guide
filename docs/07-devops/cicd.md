---
layout: default
title: CI/CD
parent: DevOps & Cloud
---

# CI/CD
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Introduction

Continuous Integration and Continuous Delivery/Deployment (CI/CD) is a set of practices that automate the software delivery process. CI involves frequently integrating code changes into a shared repository, while CD ensures code is always in a deployable state and can be deployed to production automatically.

CI/CD pipelines reduce manual errors, provide feedback to developers, and enable faster release cycles. Modern CI/CD encompasses building, testing, security scanning, deployment, and monitoring throughout the software lifecycle.

---

## Key Concepts

### CI/CD Pipeline Stages

1. **Source**: Version control, code review
2. **Build**: Compile code, resolve dependencies
3. **Test**: Unit, integration, E2E tests
4. **Security**: SAST, DAST, dependency scanning
5. **Release**: Versioning, artifact creation
6. **Deploy**: Environment provisioning, deployment
7. **Verify**: Smoke tests, health checks
8. **Monitor**: Logging, metrics, alerting

### Deployment Strategies

| Strategy | Downtime | Rollback | Risk | Complexity |
|----------|----------|----------|------|------------|
| Blue-Green | Zero | Instant | Low | Medium |
| Canary | Zero | Easy | Low | High |
| Rolling | Zero | Moderate | Medium | Low |
| Recreate | Yes | Slow | High | Low |
| Feature Flags | Zero | Instant | Low | Medium |

### CI/CD Maturity Model

1. **Level 0**: Manual builds and deployments
2. **Level 1**: Automated builds, manual deployments
3. **Level 2**: CI/CD for some applications
4. **Level 3**: CI/CD for all applications
5. **Level 4**: Advanced CI/CD with GitOps and progressive delivery

### Key Metrics

| Metric | Description |
|--------|-------------|
| Lead Time | Time from commit to production |
| Deployment Frequency | How often code is deployed |
| Change Failure Rate | Percentage of failed deployments |
| MTTR | Mean time to recovery from failures |
| Pipeline Duration | Time for pipeline to complete |

### Continuous Integration vs Delivery vs Deployment

| Practice | Description |
|----------|-------------|
| Continuous Integration | Frequently merge code changes with automated builds/tests |
| Continuous Delivery | Code always in deployable state; deployment requires manual approval |
| Continuous Deployment | Every change that passes tests is automatically deployed to production |

---

## FAQ (Top 10)

### Q1: What is the difference between Continuous Delivery and Continuous Deployment?
**A:** Continuous Delivery: Code is always in deployable state; deployment to production requires manual approval. Continuous Deployment: Every change that passes tests is automatically deployed to production.

### Q2: What is a CI/CD pipeline?
**A:** Automated workflow that takes code from version control through build, test, and deployment stages. Ensures code quality and automates the release process.

### Q3: What is blue-green deployment?
**A:** Deployment strategy maintaining two identical environments. Traffic switches from blue (current) to green (new) after verification. Enables instant rollback.

### Q4: What is canary deployment?
**A:** Gradually rolling out changes to a small subset of users before full deployment. Allows monitoring for issues before affecting all users.

### Q5: What is a feature flag?
**A:** Toggle to enable/disable features without deploying code. Allows gradual rollouts, A/B testing, and instant feature disabling.

### Q6: What is GitOps?
**A:** Operational framework using Git as single source of truth for declarative infrastructure and applications. Changes via pull requests, automated reconciliation.

### Q7: What is the difference between SAST and DAST?
**A:** SAST: Static Application Security Testing analyzes source code. DAST: Dynamic Application Security Testing analyzes running application.

### Q8: What is pipeline as code?
**A:** Defining CI/CD pipelines in version-controlled files (Jenkinsfile, .github/workflows). Enables version control, review, and reuse of pipeline configurations.

### Q9: What is shift-left testing?
**A:** Moving testing earlier in development lifecycle. Instead of testing before release, tests run throughout development, catching issues sooner.

### Q10: What is progressive delivery?
**A:** Extension of continuous delivery with fine-grained control over deployment. Combines canary, feature flags, and automated rollbacks.

---

## Common Mistakes

1. **Skipping tests in CI** - Not running tests on every commit, leading to broken builds
2. **Manual deployments** - Performing deployments manually instead of automating
3. **No rollback strategy** - Not planning for deployment failures
4. **Ignoring security** - Not scanning for vulnerabilities in CI/CD pipeline
5. **Slow pipelines** - Not optimizing build and test times
6. **No monitoring** - Deploying without observability, leading to blind spots
7. **Hard-coded configurations** - Not using environment variables
8. **No approval gates** - Deploying to production without review or approval
9. **Ignoring flaky tests** - Not addressing unreliable tests that break builds
10. **Poor artifact management** - Not properly versioning and storing build artifacts

---

## Best Practices

### Pipeline Design
- Keep pipelines fast (under 10 minutes ideal)
- Run tests in parallel
- Use meaningful stage names
- Implement proper error handling
- Cache dependencies

### Testing
- Implement test pyramid (more unit, less E2E)
- Run tests in isolated environments
- Mock external dependencies
- Address flaky tests immediately

### Security
- Scan for vulnerabilities in pipeline
- Use secrets management
- Implement signed commits
- Audit pipeline access

### Deployment
- Use infrastructure as code
- Implement health checks
- Plan rollback procedures
- Use feature flags
- Monitor deployments

---

## Quick Reference

### Pipeline Checklist
- [ ] Source code checkout
- [ ] Dependency installation
- [ ] Code compilation
- [ ] Unit tests
- [ ] Integration tests
- [ ] Security scanning
- [ ] Code quality analysis
- [ ] Artifact creation
- [ ] Deployment to staging
- [ ] Smoke tests
- [ ] Approval gate
- [ ] Deployment to production
- [ ] Post-deployment verification

### Deployment Commands
```bash
# Docker deployment
docker build -t myapp:1.0 .
docker run -d -p 8080:80 myapp:1.0

# Kubernetes deployment
kubectl apply -f deployment.yaml
kubectl rollout status deployment/myapp
kubectl rollout undo deployment/myapp
```

### Common CI/CD Tools

| Tool | Type | Key Features |
|------|------|--------------|
| Jenkins | Self-hosted | Extensible, plugin ecosystem |
| GitHub Actions | Cloud | Native GitHub integration |
| GitLab CI/CD | Self-hosted/Cloud | Integrated with GitLab |
| CircleCI | Cloud | Fast execution, Docker support |
| ArgoCD | Self-hosted | GitOps for Kubernetes |

### GitHub Actions Reusable Workflow
```yaml
name: Reusable Deploy

on:
  workflow_call:
    inputs:
      environment:
        required: true
        type: string
      image-tag:
        required: true
        type: string

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: ${{ inputs.environment }}
    steps:
      - uses: actions/checkout@v4
      - name: Deploy to ${{ inputs.environment }}
        run: |
          echo "Deploying ${{ inputs.image-tag }} to ${{ inputs.environment }}"
```
