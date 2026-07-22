---
layout: default
title: GitHub
parent: DevOps & Cloud
---

# GitHub
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Introduction

GitHub is a web-based platform for version control and collaboration using Git. It provides hosting for software development projects, tools for code review, project management, and CI/CD through GitHub Actions. GitHub is the world's largest software development platform with over 100 million developers.

GitHub extends Git with features like pull requests, issues, wikis, GitHub Actions, and social coding features. It's essential for modern software development collaboration.

---

## Key Concepts

### Pull Request Workflow

1. Fork repository (for open source) or create branch
2. Make changes and commit
3. Push to remote
4. Create pull request
5. Code review and discussions
6. CI/CD checks pass
7. Merge (squash, rebase, or merge commit)
8. Delete branch

### Branch Protection Rules

- Require pull request reviews
- Require status checks (CI/CD)
- Require signed commits
- Require linear history
- Require conversation resolution
- Require code owner approval

### GitHub Actions Concepts

| Concept | Description |
|---------|-------------|
| Workflow | Automated process defined in YAML |
| Job | Group of steps running on same runner |
| Step | Individual task in a job |
| Action | Reusable unit of workflow logic |
| Runner | Server executing workflow |

### Security Features

1. **Dependabot**: Automated dependency updates
2. **Code Scanning**: Automated security analysis
3. **Secret Scanning**: Detect exposed secrets
4. **Security Advisories**: Vulnerability reporting
5. **SBOM**: Software Bill of Materials

### Repository Files

| File | Purpose |
|------|---------|
| README | Project documentation and overview |
| LICENSE | Legal usage terms |
| CONTRIBUTING | Contribution guidelines |
| CODE_OF_CONDUCT | Community standards |
| SECURITY | Security policy and reporting |
| CODEOWNERS | Automatic review assignments |

---

## FAQ (Top 10)

### Q1: What is the difference between fork and clone?
**A:** Clone creates local copy of repository. Fork creates server-side copy under your GitHub account. Fork is for contributing to others' projects; clone is for local development.

### Q2: What is a pull request?
**A:** Proposed changes to a repository, requesting review and merge. Enables code review, discussion, and automated checks before merging.

### Q3: What are GitHub Actions?
**A:** CI/CD platform for automating workflows. Define workflows in YAML, triggered by events. Build, test, deploy, and more.

### Q4: What is the difference between merge, squash, and rebase?
**A:** Merge: Creates merge commit preserving all history. Squash: Combines all commits into single commit. Rebase: Rewrites history for linear sequence.

### Q5: What are branch protection rules?
**A:** Settings preventing direct pushes to branches. Require PRs, reviews, status checks, and other requirements.

### Q6: What is Dependabot?
**A:** GitHub service that automatically creates PRs for dependency updates. Keeps dependencies secure and up-to-date.

### Q7: What are GitHub Actions secrets?
**A:** Encrypted variables for sensitive data (API keys, tokens). Available to workflows, hidden from logs.

### Q8: What is GitHub Pages?
**A:** Static website hosting from repository. Supports Jekyll, custom domains, and GitHub Actions deployment.

### Q9: What is CODEOWNERS?
**A:** File specifying code owners for repository paths. Automatically assigns reviewers to pull requests affecting owned code.

### Q10: What is GitHub Copilot?
**A:** AI pair programmer suggesting code completions. Integrates with IDEs, helps write code faster.

---

## Common Mistakes

1. **Not writing good commit messages** - Vague or non-descriptive messages
2. **Ignoring PR reviews** - Merging without proper code review
3. **Not using branch protection** - Allowing direct pushes to main branch
4. **Hard-coding secrets in workflows** - Storing sensitive data in YAML files
5. **Large pull requests** - Not breaking work into smaller, reviewable pieces
6. **Not writing documentation** - Missing README, contributing guidelines
7. **Ignoring CI/CD failures** - Not addressing failing checks before merging
8. **Poor repository organization** - Not following naming conventions
9. **Not using GitHub Projects** - Missing out on project management features
10. **Ignoring security alerts** - Not addressing Dependabot alerts

---

## Best Practices

### Repository Management
- Write comprehensive README
- Add LICENSE file
- Create CONTRIBUTING.md
- Use .gitignore
- Set up branch protection

### Pull Requests
- Keep PRs small and focused
- Write descriptive titles and descriptions
- Add relevant labels
- Request appropriate reviewers
- Address review comments

### GitHub Actions
- Use caching for dependencies
- Implement matrix builds
- Use reusable workflows
- Store secrets properly
- Monitor workflow runs

### Security
- Enable Dependabot
- Implement secret scanning
- Use code scanning
- Review security advisories
- Implement access controls

---

## Quick Reference

### GitHub CLI Commands
```bash
# Repository
gh repo create name --public/--private
gh repo clone owner/repo
gh repo view

# Pull Requests
gh pr create --title "Title" --body "Description"
gh pr list
gh pr checkout number
gh pr merge number

# Issues
gh issue create --title "Title" --body "Description"
gh issue list
gh issue close number

# Actions
gh run list
gh run view run-id
gh workflow run name

# Releases
gh release create tag --title "Release" --notes "Notes"
gh release list
```

### GitHub Actions CI/CD Example
```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [18.x, 20.x]
    steps:
      - uses: actions/checkout@v4
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node-version }}
          cache: 'npm'
      - run: npm ci
      - run: npm test
      - run: npm run build

  deploy:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    environment: production
    steps:
      - uses: actions/checkout@v4
      - run: echo "Deploying to production..."
```

### Common GitHub Actions
```yaml
# Checkout
- uses: actions/checkout@v4

# Setup Node.js
- uses: actions/setup-node@v4
  with:
    node-version: '20'
    cache: 'npm'

# Cache dependencies
- uses: actions/cache@v3
  with:
    path: ~/.npm
    key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}

# Upload artifacts
- uses: actions/upload-artifact@v3
  with:
    name: build
    path: dist/
```

### Issue Template
```yaml
name: Bug Report
about: Report a bug
labels: bug
body:
  - type: textarea
    id: description
    attributes:
      label: Describe the bug
    validations:
      required: true
  - type: textarea
    id: reproduction
    attributes:
      label: To reproduce
    validations:
      required: true
```
