---
layout: default
title: Competitive Programming
parent: Coding
---

# Competitive Programming

{: .note }
Competitive programming develops problem-solving speed, algorithmic thinking, and coding proficiency under pressure — skills that directly translate to interview success.

---

## Introduction

Competitive Programming (CP) is a mind sport where participants solve algorithmic problems under time constraints. Major tech companies — Google (Code Jam), Meta (Hacker Cup), Microsoft — actively sponsor CP competitions and recruit top performers.

The skills from CP directly transfer to interviews: rapid problem analysis, algorithm selection, clean implementation, and working under time pressure.

---

## CP vs. Interview Coding

| Aspect | Competitive Programming | Interview Coding |
|--------|------------------------|------------------|
| Time Limit | 2-5 hours, multiple problems | 30-45 min, 1-2 problems |
| Problem Type | Algorithmic, mathematical | Design + implementation |
| Hints | None | Interviewer may guide |
| Testing | Automated, hidden tests | Manual walkthrough |
| Code Quality | Speed matters most | Readability matters |
| Collaboration | Solo | Paired with interviewer |

---

## Key Concepts

### Constraint Analysis

| Constraint | Likely Approach |
|-----------|----------------|
| n ≤ 10 | Brute force, all permutations |
| n ≤ 20 | Bitmask DP |
| n ≤ 500 | O(n³) algorithms |
| n ≤ 5000 | O(n²) algorithms |
| n ≤ 10⁵ | O(n log n) algorithms |
| n ≤ 10⁶ | O(n) algorithms |
| n ≤ 10⁹ | O(log n) or O(1) — math/binary search |

### Problem-Solving Framework

1. **Read & Understand** (2-3 min) — Identify I/O, note constraints
2. **Design** (5-10 min) — Approach, edge cases, complexity check
3. **Implement** (15-25 min) — Clean, modular code with templates
4. **Test & Debug** (5-10 min) — Examples, edge cases

### Essential Algorithms

| Algorithm | Complexity | Use Case |
|-----------|-----------|----------|
| Binary Search | O(log n) | Sorted/monotonic search space |
| Two Pointers | O(n) | Sorted arrays, pairs |
| Sliding Window | O(n) | Subarrays/substrings |
| BFS/DFS | O(V+E) | Graph traversal |
| Dijkstra | O((V+E) log V) | Shortest path, weighted |
| Union-Find | O(α(n)) ≈ O(1) | Connected components |
| Segment Tree | O(log n) per query | Range queries + updates |
| KMP | O(n+m) | Pattern matching |

### Common Problem Categories

- **Array & String:** Two pointers, sliding window, prefix sums, Kadane's
- **Graphs:** BFS/DFS, shortest path, MST, topological sort, SCC
- **DP:** Knapsack, LIS, LCS, interval DP, digit DP, bitmask DP
- **Data Structures:** Union-Find, segment tree, BIT, monotonic stack
- **Math:** GCD, modular arithmetic, sieve, combinatorics
- **Strings:** KMP, Z-function, Rabin-Karp, suffix array

---

## FAQ

### Q1: Which platform is best for beginners?
Codeforces is most popular with problems sorted by difficulty. Start with Div. 3/2 problems rated 800-1200. AtCoder has well-curated problems. LeetCode for interview prep.

### Q2: How many problems should I solve?
500+ with deliberate practice (upsolving, reading editorials) puts you at intermediate. Quality > quantity — understand each solution deeply.

### Q3: What is upsolving?
Solving contest problems after the contest ends, using editorials for problems you couldn't solve during. One of the most effective improvement methods.

### Q4: How do I improve my rating?
Practice consistently, participate in every contest, upsolve all problems, study editorials, focus on weak areas. Improvement is gradual.

### Q5: Should I focus on CP or interview prep?
For interviews specifically, focus on interview-style problems (LeetCode). For strong algorithmic fundamentals, CP is excellent. CP skills transfer well.

### Q6: What language for CP?
C++ is most popular (speed + STL). Python for prototyping (may be too slow). Java acceptable but verbose. Choose one and master it.

### Q7: How do I handle time pressure?
Practice under timed conditions regularly. Don't spend too long on one problem — skip and come back. Read all problems first.

### Q8: When should I use BFS vs DFS?
BFS: shortest path in unweighted graphs, level-by-level. DFS: explore all paths, cycle detection, topological sort.

### Q9: What is a monotonic stack?
Maintains elements in sorted order. Useful for finding next greater/smaller element for each array element in O(n).

### Q10: How do I handle integer overflow?
Use `long long` in C++, `long` in Java, Python's arbitrary precision. Take modulo after each operation. Use `1LL *` prefix.

---

## Common Mistakes

| Mistake | How to Avoid |
|---------|--------------|
| Not reading constraints | Check constraints first, determine complexity |
| Off-by-one in loops | Double-check boundaries, test with small inputs |
| Forgetting edge cases | Consider: empty, single element, max values |
| Integer overflow | Use long long, take modulo after each op |
| Wrong complexity | Profile code, check for hidden O(n) in loops |
| Not using fast I/O | `sys.stdin.buffer.read()` in Python |
| Modulo errors | Use `((a % m) + m) % m` for non-negative |

---

## Best Practices

### Before Contest
- Set up IDE with templates and snippets
- Test fast I/O setup
- Review template library

### During Contest
1. Read all problems first (5 min)
2. Start with easiest problem
3. Don't spend more than 20 min stuck — skip
4. Test with examples before submitting
5. Keep track of time

### After Contest
1. Upsolve all missed problems
2. Read editorials for all problems
3. Study top contestants' solutions
4. Note lessons learned
5. Track progress

---

## Quick Reference

```
TIME COMPLEXITY GUIDELINES
n ≤ 10      → O(n!) brute force
n ≤ 20      → O(2^n) bitmask DP
n ≤ 500     → O(n^3) Floyd-Warshall
n ≤ 5000    → O(n^2) DP
n ≤ 10^5    → O(n log n) sorting, segment tree
n ≤ 10^6    → O(n) linear scan
n ≤ 10^9    → O(log n) binary search
n ≤ 10^18   → O(log n) matrix exponentiation

COMMON COMPLEXITIES
Sorting:           O(n log n)
BFS/DFS:           O(V + E)
Dijkstra:          O((V+E) log V)
Knapsack:          O(n * W)
LIS:               O(n log n)
Union-Find:        O(α(n)) ≈ O(1)

PYTHON FAST I/O
import sys
input = sys.stdin.readline

MODULAR ARITHMETIC
MOD = 10**9 + 7
(a * b) % m = (a%m * b%m) % m
a / b mod m = a * pow(b, m-2, m) mod m
```

---

## Practice Platforms

| Platform | Focus | Best For |
|----------|-------|----------|
| Codeforces | Most popular CP | All levels |
| AtCoder | Well-curated problems | Learning |
| LeetCode | Interview-focused | Interview prep |
| CSES | Finnish Olympiad | Structured learning |
| USACO Guide | Structured curriculum | Beginners |

---

*Last Updated: July 2026*
