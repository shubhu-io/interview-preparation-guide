---
layout: default
title: Debugging
parent: Coding
---

# Debugging

{: .note }
Debugging is a systematic, analytical process of understanding why software behaves unexpectedly — not merely fixing errors.

---

## Introduction

Debugging is the process of finding and resolving defects in programs. Strong debugging skills distinguish senior engineers from junior ones. Companies like Google, Amazon, and Microsoft explicitly evaluate debugging ability during interviews, presenting buggy code and asking candidates to identify and fix issues.

Debugging can consume 50% or more of development time. Mastering it helps in interviews and real-world software development.

---

## The Scientific Method of Debugging

| Step | Action |
|------|--------|
| 1. Reproduce | Consistently trigger the failure |
| 2. Hypothesize | Form a theory about the cause |
| 3. Test | Design an experiment to confirm/deny |
| 4. Fix | Implement the fix once confirmed |
| 5. Verify | Ensure fix works and doesn't introduce new bugs |

---

## Key Concepts

### Bug Distribution (IBM Study)

- **56%** of bugs are in design/requirements
- **27%** are in coding
- **10%** are in testing
- **7%** are in documentation

Cost of fixing increases exponentially: **1x** in design → **100x** in production.

### Types of Bugs

| Bug Type | Description | Example |
|----------|-------------|---------|
| Syntax Error | Language grammar violation | Missing semicolon |
| Runtime Error | Error during execution | Division by zero |
| Logic Error | Code runs but wrong result | Off-by-one in loop |
| Resource Leak | Resources not released | Unclosed file handles |
| Concurrency Bug | Timing-dependent failures | Race condition |
| Performance Bug | Correct but too slow | O(n²) where O(n) needed |

### Debugging Techniques

| Technique | When to Use |
|-----------|-------------|
| Print/Logging | Simple inspection of variable values |
| Binary Search Debugging | Bug location unknown in large code |
| Rubber Duck Debugging | Need to articulate assumptions |
| IDE Debugger | Complex bugs needing step-through |
| git bisect | Bug introduced recently |

### Binary Search Debugging

1. Place a checkpoint in the **middle** of suspicious code
2. Bug before checkpoint → search first half
3. Bug after checkpoint → search second half
4. Repeat — O(log n) steps for 1000 lines

### Common Bug Patterns

**Off-by-one:**
```python
# BUG: range(len(arr) + 1) causes IndexError
for i in range(len(arr)):
    print(arr[i])  # Correct
```

**Null pointer:**
```python
def get_value(node):
    if node is None:
        return None
    return node.val
```

**Infinite loop:**
```python
def find_first_negative(arr):
    i = 0
    while i < len(arr):  # Must check bounds
        if arr[i] < 0:
            return i
        i += 1
    return -1
```

---

## FAQ

### Q1: What is the difference between debugging and testing?
Testing finds bugs by executing programs. Debugging finds the root cause of a known bug and fixes it. Testing identifies *that* a bug exists; debugging finds *why*.

### Q2: How should I approach a bug I can't reproduce?
Look for timing-dependent issues (race conditions, async code). Add extensive logging. Narrow down conditions. Use deterministic testing tools.

### Q3: What is the most efficient debugging technique?
Binary search debugging for unknown locations. Educated guessing for known symptoms. The scientific method is the most reliable overall.

### Q4: How do I debug code during an interview?
Think aloud. Start with simplest cases. Use print statements or trace by hand. Check edge cases. Break the problem into smaller pieces.

### Q5: What is a Heisenbug?
A bug that disappears or changes behavior when you try to observe or debug it, often due to debug output changing timing.

### Q6: What is a Bohrbug?
A deterministic, reliably reproducible bug — the opposite of a Heisenbug.

### Q7: How does git bisect help?
Performs binary search through commit history to find which commit introduced a bug. Mark known-good and known-bad commits.

### Q8: What is the 5 Whys technique?
A root cause analysis method where you ask "why" five times to drill down from symptom to root cause.

### Q9: How do I debug race conditions?
Use thread-safe logging, add assertions, use ThreadSanitizer, run with randomized scheduling, add artificial delays.

### Q10: What should I always add after fixing a bug?
A regression test that specifically exercises the bug scenario.

---

## Common Mistakes

| Mistake | How to Avoid |
|---------|--------------|
| Randomly changing code | Form a hypothesis first, one change at a time |
| Ignoring error messages | Read them carefully — they usually tell you what's wrong |
| Assuming bug is where it appears | Trace data flow backward |
| Not reproducing first | Always establish reproduction steps |
| Over-reliance on print statements | Use a debugger for complex issues |
| Not checking edge cases | Test with empty, single element, max inputs |
| Not adding a test after fixing | Always add a regression test |

---

## Best Practices

1. **Reproduce** — Make the bug happen reliably
2. **Isolate** — Narrow down the location
3. **Diagnose** — Find the root cause
4. **Fix** — Minimal correct fix
5. **Test** — Verify fix works and doesn't break anything
6. **Document** — Record what happened
7. **Prevent** — Add tests and process improvements

### When Stuck
- Take a break, come back with fresh eyes
- Explain the problem to someone else (rubber duck)
- Binary search through the code
- Check your assumptions
- Simplify to minimal failing case

---

## Quick Reference

```
ERROR MESSAGE READING
1. Read the exception type
2. Read the message
3. Look at FIRST line of YOUR code in stack trace
4. Check the line number

COMMON BUG PATTERNS
Off-by-one:    Check loop bounds (< vs <=, 0 vs 1)
Null access:   Check all dereferences for null
Race condition: Check shared mutable state
Memory leak:   Check every allocation has deallocation
Infinite loop: Check termination makes progress

TOOLS BY LANGUAGE
Python:  pdb, breakpoints(), tracemalloc
Java:    JDB, IntelliJ debugger, VisualVM
JS:      Chrome DevTools, node --inspect
C/C++:   GDB, Valgrind, AddressSanitizer
Go:      Delve (dlv), pprof

SUCCESS FORMULA
Debugging = Reproduce + Hypothesize + Test + Fix + Verify + Prevent
```

---

*Last Updated: July 2026*
