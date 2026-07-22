---
layout: default
title: Data Structures & Algorithms
parent: Programming Languages
---

# Data Structures & Algorithms

Master DSA concepts, patterns, and problems to ace technical interviews at top companies.

## Introduction

**Data Structures** are specialized formats for organizing, processing, retrieving, and storing data efficiently. **Algorithms** are step-by-step procedures for solving problems.

### Why DSA Matters for Interviews

| Reason | Detail |
|--------|--------|
| **Problem Solving** | Demonstrates logical thinking and analytical ability |
| **Optimization** | Shows you can write efficient, scalable code |
| **Foundation** | Underpins all software engineering work |
| **Filtering** | Top companies use DSA to filter candidates |
| **Transferable** | Skills apply across languages and domains |

## Key Concepts

### Big-O Notation Summary

| Notation | Name | Example |
|----------|------|---------|
| O(1) | Constant | Hash lookup |
| O(log n) | Logarithmic | Binary search |
| O(n) | Linear | Linear search |
| O(n log n) | Linearithmic | Merge sort |
| O(n²) | Quadratic | Bubble sort |
| O(2ⁿ) | Exponential | Brute-force subsets |
| O(n!) | Factorial | Permutations |

### Data Structures Overview

| Structure | Access | Search | Insert | Delete | Use Case |
|-----------|--------|--------|--------|--------|----------|
| Array | O(1) | O(n) | O(n) | O(n) | Random access |
| Linked List | O(n) | O(n) | O(1)† | O(1)† | Frequent insert/delete |
| Stack | O(n) | O(n) | O(1) | O(1) | LIFO operations |
| Queue | O(n) | O(n) | O(1) | O(1) | FIFO operations |
| Hash Table | N/A | O(1) avg | O(1) avg | O(1) avg | Key-value lookup |
| BST | O(log n) avg | O(log n) avg | O(log n) avg | O(log n) avg | Ordered data |
| Heap | N/A | O(n) | O(log n) | O(log n) | Priority queue |
| Trie | O(m) | O(m) | O(m) | O(m) | Prefix search |

*†Given reference to node*

### Sorting Algorithms

| Algorithm | Best | Average | Worst | Space | Stable |
|-----------|------|---------|-------|-------|--------|
| Bubble Sort | O(n) | O(n²) | O(n²) | O(1) | Yes |
| Merge Sort | O(n log n) | O(n log n) | O(n log n) | O(n) | Yes |
| Quick Sort | O(n log n) | O(n log n) | O(n²) | O(log n) | No |
| Heap Sort | O(n log n) | O(n log n) | O(n log n) | O(1) | No |
| Counting Sort | O(n+k) | O(n+k) | O(n+k) | O(k) | Yes |

## FAQ

**Q1: What is the difference between an array and a linked list?**
Arrays offer O(1) access by index but O(n) insertion/deletion. Linked lists offer O(1) insertion/deletion at known positions but O(n) access.

**Q2: Explain BFS vs DFS. When to use each?**
BFS uses a queue and explores level by level — shortest path in unweighted graphs. DFS uses a stack/recursion and explores deeply — cycle detection, topological sort, path existence.

**Q3: What is memoization vs tabulation?**
Memoization: top-down, recursive, cache results as needed. Tabulation: bottom-up, iterative, fills table in order.

**Q4: How does a heap differ from a BST?**
Heap guarantees parent-child ordering (min or max), not full ordering. BST maintains full sorted order. Heaps are better for priority access; BSTs for range queries.

**Q5: When would you use a BST over a hash table?**
When you need ordered traversal, range queries, or find predecessor/successor efficiently.

**Q6: Explain the two-pointer technique.**
Use two pointers moving toward each other or in the same direction to solve problems on sorted arrays or sliding windows in O(n) time.

**Q7: What is a hash table? What happens on collision?**
Maps keys to values via a hash function. Collisions handled by chaining (linked list at each bucket) or open addressing (probing for next slot).

**Q8: When does Dijkstra's algorithm fail?**
With negative edge weights. Use Bellman-Ford instead.

**Q9: What is path compression in Union-Find?**
During find, make each node point directly to the root, flattening the tree structure for near-constant amortized time.

**Q10: What is the Master Theorem for recursion analysis?**
For T(n) = aT(n/b) + O(n^d): if log_b(a) < d → O(n^d), if log_b(a) = d → O(n^d log n), if log_b(a) > d → O(n^{log_b(a)}).

## Common Mistakes

| Mistake | How to Avoid |
|---------|-------------|
| Not handling edge cases | Always check: null, empty, single element, duplicates |
| Off-by-one errors | Draw examples, use inclusive/exclusive bounds carefully |
| Forgetting to reset visited | Track visited nodes to avoid infinite loops in graphs |
| Using wrong data structure | Map problem requirements to the right structure |
| Not analyzing complexity | Always state time and space complexity |
| Greedy when DP needed | Verify greedy choice property before using greedy |
| Recursion without base case | Always define clear base cases first |

## Best Practices

1. **Understand before coding** — Spend 2–3 minutes analyzing the problem
2. **Clarify assumptions** — Ask about input size, constraints, edge cases
3. **Think out loud** — Explain your approach before writing code
4. **Start with brute force** — Then optimize
5. **Test mentally** — Walk through with an example
6. **Name variables clearly** — Readable code is debuggable code
7. **Know your complexities** — Memorize common algorithm complexities
8. **Practice under pressure** — Solve problems with a timer
9. **Review solutions** — Study optimal approaches after solving
10. **Pattern recognition** — Group problems by technique (sliding window, two pointers, DP, etc.)

## Quick Reference

### Classic Problem Patterns

| Pattern | Problems | Technique |
|---------|----------|-----------|
| Two Pointers | Two Sum, Container With Most Water | Opposite ends or same direction |
| Sliding Window | Max Subarray, Longest Substring | Expand/shrink window |
| BFS/DFS | Number of Islands, Word Search | Queue for BFS, stack/recursion for DFS |
| Dynamic Programming | Coin Change, LCS, LIS | State → recurrence → base case → order |
| Backtracking | N-Queens, Permutations | Explore all candidates, abandon invalid paths |
| Binary Search | Search Rotated Array, Find Peak | Divide search space in half |

### Code Examples

```python
# Two Sum
def two_sum(nums, target):
    seen = {}
    for i, num in enumerate(nums):
        complement = target - num
        if complement in seen:
            return [seen[complement], i]
        seen[num] = i
    return []

# Maximum Subarray (Kadane's)
def max_subarray(nums):
    current = best = nums[0]
    for num in nums[1:]:
        current = max(num, current + num)
        best = max(best, current)
    return best

# Binary Search
def binary_search(arr, target):
    lo, hi = 0, len(arr) - 1
    while lo <= hi:
        mid = lo + (hi - lo) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            lo = mid + 1
        else:
            hi = mid - 1
    return -1
```

### Learning Roadmap

**Beginner (Weeks 1–4)**
- Arrays, Strings, Two Pointers
- Linked Lists, Stacks, Queues
- Hash Maps, Basic Sorting & Searching

**Intermediate (Weeks 5–10)**
- Trees, BST, Heaps
- Recursion & Backtracking
- Graphs (BFS, DFS), Basic DP

**Advanced (Weeks 11–20)**
- Dynamic Programming (all patterns)
- Greedy Algorithms
- Advanced Graphs (Dijkstra, Bellman-Ford)
- Trie, Union-Find, Segment Tree
