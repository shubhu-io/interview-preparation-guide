---
layout: default
title: Code Review
parent: Coding
---

# Code Review

{: .note }
Code review is not just a process — at FAANG companies, it's a culture. Demonstrating code review awareness signals you can work effectively in a team.

---

## Introduction

Code review is the systematic examination of source code by peers to find bugs, improve code quality, and share knowledge. At Google, Meta, Amazon, and others, code reviews are required for virtually every change that goes into production.

Mastering code review skills helps you write better code yourself, as you learn to spot issues before others point them out.

---

## The Code Review Pyramid

Review in this order of priority:

| Priority | Focus | Question |
|----------|-------|----------|
| 1 | **Correctness** | Does it do what it's supposed to? |
| 2 | **Security** | Can it be exploited? |
| 3 | **Performance** | Will it scale? |
| 4 | **Design** | Is the architecture sound? |
| 5 | **Readability** | Can others understand it? |
| 6 | **Style** | Does it follow conventions? (Automate this!) |

---

## Key Concepts

### Review Checklist

**Correctness:**
- Does the code meet requirements?
- Are all edge cases handled?
- Are error conditions handled gracefully?

**Security:**
- Is user input validated and sanitized?
- Are SQL queries parameterized?
- Are secrets not hardcoded?
- Are there injection vulnerabilities?

**Performance:**
- Are there N+1 database queries?
- Are algorithms efficient for expected data volumes?
- Is memory usage reasonable?

**Readability:**
- Are names clear and descriptive?
- Is the code DRY?
- Are functions appropriately sized?

### Comment Prefixes

| Prefix | Meaning | Blocking? |
|--------|---------|-----------|
| `[bug]` | Identified bug | Yes |
| `[security]` | Security concern | Yes |
| `[perf]` | Performance concern | Maybe |
| `[issue]` | Must be fixed | Yes |
| `[suggestion]` | Optional improvement | No |
| `[nit]` | Minor style/naming | No |
| `[question]` | Seeking clarification | No |
| `[praise]` | Good work! | No |

### PR Size Guidelines

| Lines | Review Type |
|-------|-------------|
| < 100 | Quick review (minutes) |
| 100-400 | Standard review (30-60 min) |
| 400-1000 | Request breakdown |
| > 1000 | MUST break into smaller PRs |

---

## FAQ

### Q1: How long should a code review take?
Review within 1-4 business hours. Reviews should take no more than 30-60 minutes. Effectiveness drops after 400 lines.

### Q2: Should I review my own code first?
Absolutely. Self-review catches obvious issues and respects the reviewer's time. Use `git diff` before requesting review.

### Q3: How do I handle disagreements?
Focus on the code, not the person. Use data, benchmarks, or reference standards. If unresolvable, escalate to a tech lead.

### Q4: What should I review first?
The PR description, to understand the purpose and context. Then the most critical files (core logic, security-sensitive).

### Q5: Should automated checks replace manual review?
No. Automation handles style and some correctness, but can't assess design, business logic, or security nuances. Humans for the complex.

### Q6: How do I review for security?
Look for: input validation, SQL parameterization, authentication checks, secrets in code, OWASP Top 10, error handling that doesn't leak info.

### Q7: What makes a bad code review?
Nitpicking on style while missing real bugs, being condescending, rubber-stamping, blocking on opinions rather than facts.

### Q8: How do I handle review feedback on my code?
Stay professional and non-defensive. Thank the reviewer. If you disagree, explain with evidence. Distinguish between mandatory fixes and suggestions.

### Q9: How many reviewers should a PR have?
1-2 reviewers. One thorough reviewer is better than two superficial ones. Two for critical changes.

### Q10: What is the difference between code review and pair programming?
Code review is asynchronous (write now, review later). Pair programming is synchronous (code together in real-time).

---

## Common Mistakes

| Mistake | How to Avoid |
|---------|--------------|
| Reviewing too much code at once | Keep PRs under 400 lines |
| Nitpicking while missing real issues | Review in order: correctness → security → performance |
| Not providing actionable feedback | Always explain the issue and suggest a fix |
| Rubber-stamping approvals | Take the time to actually read the code |
| Making it personal | Focus on the code: "This function could be clearer..." |
| Delaying reviews | Review within 4 business hours |
| Not reading the PR description | Always read it first for context |
| Ignoring tests | Review test code with same rigor as production |

---

## Best Practices

### For Reviewers
1. Read the PR description first
2. Start with the most critical files
3. Check tests alongside production code
4. Use consistent comment prefixes
5. Be timely — review within 4 hours
6. Provide praise for good work

### For Authors
1. Write clear PR descriptions
2. Keep PRs small and focused (under 400 lines)
3. Self-review before requesting review
4. Respond to all comments
5. Don't take feedback personally

### For Teams
1. Establish coding standards
2. Use automated linters for style
3. Define clear review requirements
4. Rotate reviewers to spread knowledge
5. Track review metrics

---

## Quick Reference

```
REVIEW ORDER (by importance):
1. Purpose & Design    — Does this solve the right problem?
2. Correctness         — Does it work for all cases?
3. Security            — Can it be exploited?
4. Performance         — Will it scale?
5. Error Handling      — Are failures handled gracefully?
6. Testing             — Are tests adequate?
7. Readability         — Can others understand it?
8. Style               — (Should be automated)

RED FLAGS — STOP AND INVESTIGATE:
□ eval() or exec() with user input
□ SQL string concatenation
□ Hardcoded passwords or API keys
□ Empty catch/except blocks
□ TODOs/FIXMEs in production code
□ Functions with 10+ parameters
□ Deeply nested code (> 3 levels)

REVIEW SLA:
Response: < 4 hours
Full review: < 1 business day
Re-review: < 4 hours

SUCCESS FORMULA
Code Review = Thoroughness + Timeliness + Constructiveness + Small PRs
```

---

## Security Checks

| Check | What to Look For |
|-------|-----------------|
| Input validation | All user input validated and sanitized |
| SQL injection | Parameterized queries, no string concatenation |
| Authentication | Auth checks on protected endpoints |
| Secrets | No hardcoded credentials |
| Encryption | Sensitive data properly encrypted |
| Error messages | Don't leak internal details |
| CORS | Properly configured |

---

*Last Updated: July 2026*
