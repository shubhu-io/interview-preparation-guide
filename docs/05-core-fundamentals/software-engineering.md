---
layout: default
title: Software Engineering
parent: Core CS Fundamentals
---

# Software Engineering

Software Engineering is the systematic application of engineering principles to the design, development, testing, deployment, and maintenance of software. It encompasses methodologies, practices, and tools for building reliable, scalable systems.

## Key Concepts

| Concept | Description |
|---------|-------------|
| SDLC | Planning → Analysis → Design → Implementation → Testing → Deployment → Maintenance |
| Agile | Iterative, adaptive, customer-focused development in short sprints |
| SOLID | Five OOP design principles for maintainable code |
| TDD | Red-Green-Refactor: write failing test first, minimal code to pass, then refactor |
| Technical Debt | Cost of future rework from choosing quick solutions over better ones |
| CI/CD | Continuous Integration/Delivery/Deployment pipelines for automated builds and releases |
| Code Review | Peer review of code changes for quality, knowledge sharing, and consistency |

## Development Methodologies

| Method | Approach | Best For |
|--------|----------|----------|
| Waterfall | Sequential phases | Well-defined requirements |
| Agile/Scrum | Sprints (1-4 weeks), iterative | Evolving requirements |
| Kanban | Visual workflow, WIP limits | Continuous delivery |
| TDD | Test-first development | High-quality code |

## Testing Pyramid

```
      /\
     /  \  E2E Tests (few, slow)
    /----\
   /      \ Integration Tests (some)
  /--------\
 /          \ Unit Tests (many, fast)
/------------\
```

## Branching Strategies

| Strategy | Description |
|----------|-------------|
| Git Flow | main + develop + feature + release + hotfix branches |
| GitHub Flow | main + feature branches, simple |
| Trunk-Based | Frequent integration to main |

## FAQ (Top 10)

**Q1: What is the difference between software engineering and programming?**
Programming writes code for specific problems. Software engineering encompasses the entire lifecycle: requirements, design, development, testing, deployment, maintenance, considering scalability and team collaboration.

**Q2: What is the difference between Agile and Waterfall?**
Waterfall: sequential, each phase completes before next, changes expensive. Agile: iterative sprints, working software incrementally, welcomes change.

**Q3: What is the testing pyramid?**
Many unit tests at base, fewer integration tests, minimal E2E tests. Ensures fast feedback and maintainable test suites.

**Q4: Explain TDD and its benefits.**
Red-Green-Refactor: write failing test, write minimal code to pass, improve structure. Benefits: better design, comprehensive coverage, confidence to refactor, living documentation.

**Q5: What is technical debt and how to manage it?**
Implied cost of future rework from quick solutions. Manage by: tracking in backlog, allocating sprint capacity, opportunistic refactoring, establishing coding standards.

**Q6: What is a feature flag?**
Mechanism to enable/disable features in production without deploying new code. Use cases: progressive rollout, A/B testing, kill switch.

**Q7: What is the difference between merge and rebase?**
Merge creates merge commit, preserves history. Rebase rewrites commits for linear history, cleaner log.

**Q8: What is the purpose of code reviews?**
Quality (catch bugs), knowledge sharing, consistency (enforce standards), mentoring, security review, maintainability, collaboration.

**Q9: What is the Strategy pattern?**
Defines a family of algorithms and makes them interchangeable. Use when multiple algorithms exist for same operation and need runtime selection.

**Q10: What is YAGNI?**
"You Aren't Gonna Need It" — don't build functionality until it's actually needed. Avoids over-engineering.

## Common Mistakes

| Mistake | Better Approach |
|---------|----------------|
| Skipping tests for speed | Write tests alongside code |
| Over-engineering | Follow YAGNI principle |
| Ignoring code reviews | Mandatory peer reviews |
| Force pushing to shared branches | Use force-with-lease |
| Testing implementation details | Test behavior, not implementation |
| 100% coverage obsession | Focus on meaningful coverage |

## Best Practices

1. Write self-documenting code with clear names
2. Keep functions small — each does one thing well
3. Commit often with meaningful messages
4. Follow the testing pyramid
5. Use feature flags for safe rollouts
6. Document decisions with ADRs
7. Handle errors explicitly
8. Favor composition over inheritance

## Quick Reference

```
SOLID: SRP + OCP + LSP + ISP + DIP
TDD: Red → Green → Refactor
Git: init → add → commit → push → pull → merge/rebase
CI/CD: Source → Build → Test → Analyze → Package → Deploy → Verify
Agile: Sprint Planning → Daily Standup → Sprint Review → Retrospective
```
