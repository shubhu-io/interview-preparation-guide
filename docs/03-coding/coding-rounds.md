---
layout: default
title: Coding Rounds
parent: Coding
---

# Coding Rounds

{: .note }
Coding rounds are the primary technical screening mechanism for software engineering roles at virtually all tech companies.

---

## Introduction

Coding rounds are technical interview segments where candidates solve programming problems in real-time. They assess problem-solving ability, coding proficiency, algorithm knowledge, and communication skills. Formats include online assessments, whiteboard coding, live coding sessions, and take-home assignments.

A strong coding round performance can compensate for a weaker resume. A poor performance can eliminate otherwise qualified candidates.

---

## The 5-Step Interview Framework

| Step | Time | Activity |
|------|------|----------|
| 1. Understand | 2-3 min | Clarify problem, confirm input/output, identify constraints |
| 2. Design | 3-5 min | Discuss brute force, identify optimizations, get buy-in |
| 3. Code | 15-20 min | Write clean code, think aloud, handle edge cases |
| 4. Test | 3-5 min | Trace through test cases (normal, edge, corner) |
| 5. Analyze | 2-3 min | State time/space complexity, discuss improvements |

---

## Key Concepts

### Core Patterns to Master

| Pattern | When to Use | Time Complexity |
|---------|-------------|-----------------|
| Two Pointers | Sorted arrays, palindromes | O(n) |
| Sliding Window | Substrings, subarrays | O(n) |
| Fast/Slow Pointers | Linked list cycles | O(n) |
| Binary Search | Sorted/monotonic search space | O(log n) |
| Merge Intervals | Overlapping ranges | O(n log n) |
| BFS | Shortest path, level-order | O(V+E) |
| DFS | Path finding, cycles, connected components | O(V+E) |
| Dynamic Programming | Optimization, counting problems | Varies |
| Hash Map | Frequency, two sum, caching | O(n) |
| Heap/Priority Queue | Top K, merge sorted, median | O(n log n) |
| Trie | Prefix search, autocomplete | O(L) |
| Union-Find | Connected components | O(α(n)) |
| Topological Sort | Dependency ordering in DAG | O(V+E) |

### Complexity Reference

| Complexity | Name | Example |
|-----------|------|---------|
| O(1) | Constant | Hash map lookup |
| O(log n) | Logarithmic | Binary search |
| O(n) | Linear | Single loop |
| O(n log n) | Linearithmic | Merge sort |
| O(n²) | Quadratic | Nested loops |
| O(2ⁿ) | Exponential | Recursive Fibonacci |

### Communication Templates

- "Let me understand the problem first..."
- "The brute force approach would be... with O(n²) complexity."
- "I think we can optimize this using..."
- "Let me trace through this example..."
- "I'm going to handle the edge case where..."

---

## FAQ

### Q1: What should I do if I don't know how to solve a problem?
Start by clarifying the problem. Discuss the brute-force approach and explain why it's not optimal. Try to identify patterns from similar problems. Ask the interviewer for hints if needed — they want to see your thought process.

### Q2: How important is communication during coding?
Extremely important. Many interviewers value communication as much as the solution itself. Think aloud, explain your choices, ask questions, and keep the interviewer informed.

### Q3: Should I write pseudocode first?
Discuss the approach verbally first. If complex, brief pseudocode can help organize your thoughts. For simple problems, code directly while explaining.

### Q4: What programming language should I use?
Use the language you're most comfortable with. Most interviewers care about problem-solving, not language. Python is popular for readability; Java/C++ for structure.

### Q5: How do I handle edge cases?
After writing the solution, ask: What if the input is empty? One element? All the same? Very large? Add checks for these cases.

### Q6: What if I make a mistake?
Don't panic. Use debugging techniques: trace through the code, check variable values, identify the issue. Interviewers appreciate seeing how you handle mistakes.

### Q7: How long should I spend on each problem?
In a 45-minute interview: 2-3 min understanding, 3-5 min designing, 15-20 min coding, 3-5 min testing, 2-3 min complexity analysis.

### Q8: How do I optimize from brute force?
Common patterns: hash map for O(1) lookup, two pointers instead of nested loops, sliding window for subarrays, dynamic programming to avoid redundant calculations.

### Q9: What are the most common coding interview mistakes?
Not asking clarifying questions, jumping into code without a plan, not thinking aloud, ignoring edge cases, not testing the solution, writing unreadable code, not discussing complexity.

### Q10: How do I prepare for dynamic programming?
Start with 1D DP (climbing stairs, house robber), then 2D DP (unique paths, LCS), then knapsack variants. Practice: identify subproblems, write recurrence, memoize, optimize to tabulation.

---

## Common Mistakes

| Mistake | How to Avoid |
|---------|--------------|
| Not asking clarifying questions | Always confirm: input format, constraints, edge cases |
| Jumping into code without a plan | Spend 3-5 min discussing approach first |
| Not thinking aloud | Verbalize every decision you make |
| Ignoring edge cases | Systematically check: empty, single element, large input |
| Not testing the solution | Always trace through test cases |
| Writing messy code | Use meaningful names, consistent formatting |
| Not discussing complexity | Always state time and space complexity |
| Giving up too quickly | Communicate, try brute force, ask for hints |

---

## Best Practices

1. **Practice daily** — 1-2 problems/day beats cramming
2. **Master the patterns** — Learn the 15 core patterns, not individual problems
3. **Think before coding** — Spend time understanding and designing
4. **Communicate constantly** — Keep the interviewer informed
5. **Write clean code** — Meaningful names, proper indentation
6. **Test systematically** — Example first, then edge cases
7. **Practice under pressure** — Use a timer to simulate interviews
8. **Do mock interviews** — Practice with friends or use Pramp

---

## Quick Reference

```
INTERVIEW FRAMEWORK (5 Steps)
1. Understand (2-3 min) — Clarify, confirm
2. Design (3-5 min) — Approach, complexity
3. Code (15-20 min) — Clean, readable, think aloud
4. Test (3-5 min) — Trace through cases
5. Analyze (2-3 min) — Time/space complexity

PATTERN SELECTION
Sorted input? → Binary Search
Need shortest path? → BFS or Dijkstra
Optimization problem? → Dynamic Programming
Subarray/substring? → Sliding Window / Two Pointers
Frequency counting? → Hash Map
Top K elements? → Heap / Priority Queue

SUCCESS FORMULA
Coding Round Success = Patterns + Practice + Communication + Clean Code
```

---

## FAANG Interview Examples

| Company | Problem | Category | Difficulty |
|---------|---------|----------|------------|
| Google | Merge K Sorted Lists | Heap | Hard |
| Meta | Valid Palindrome II | Two Pointers | Easy |
| Amazon | LRU Cache | Design/Hash Map | Medium |
| Apple | Reverse Linked List | Linked List | Easy |
| Microsoft | Course Schedule | Topological Sort | Medium |

---

*Last Updated: July 2026*
