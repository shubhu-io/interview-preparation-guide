---
layout: default
title: CS Fundamentals
parent: Programming Languages
---

# CS Fundamentals

Computer science core concepts — networking, OS, databases, and computational theory.

## Introduction

Computer Science fundamentals form the bedrock of every technical interview. Regardless of your role — backend engineer, frontend developer, data scientist, or DevOps engineer — interviewers expect you to understand how computers work at a fundamental level.

FAANG companies specifically test CS fundamentals because they underpin everything: data representation affects how you store data, networking knowledge affects system design, OS concepts affect concurrency, and computational complexity determines whether your solution is viable.

## Key Concepts

### Number Systems

| System | Base | Digits | Example |
|--------|------|--------|---------|
| Binary | 2 | 0, 1 | 1010₂ = 10₁₀ |
| Octal | 8 | 0-7 | 12₈ = 10₁₀ |
| Decimal | 10 | 0-9 | 10₁₀ |
| Hexadecimal | 16 | 0-9, A-F | A₁₆ = 10₁₀ |

### Computational Complexity

| Complexity | Name | Example |
|-----------|------|---------|
| O(1) | Constant | Array access, hash lookup |
| O(log n) | Logarithmic | Binary search |
| O(n) | Linear | Linear scan |
| O(n log n) | Linearithmic | Merge sort |
| O(n²) | Quadratic | Nested loops |
| O(2ⁿ) | Exponential | Subset enumeration |
| O(n!) | Factorial | Permutation generation |

**Complexity Classes:**
- **P**: Problems solvable in polynomial time
- **NP**: Problems verifiable in polynomial time
- **NP-Complete**: Hardest problems in NP (SAT, 3-SAT, TSP)
- **NP-Hard**: At least as hard as NP-Complete

### Bitwise Operations

```c
// Common bitwise tricks
x & (x - 1)     // Clear lowest set bit
x & (-x)         // Isolate lowest set bit
(x ^ (x >> 1))   // XOR for parity

// Check if power of 2
bool isPowerOf2(int x) { return x > 0 && (x & (x - 1)) == 0; }

// Count set bits (Brian Kernighan)
int count = 0;
while (x) { x &= (x - 1); count++; }
```

### OSI Model Layers

| Layer | Name | Protocols | Function |
|-------|------|-----------|----------|
| 7 | Application | HTTP, FTP, SMTP | User interface |
| 6 | Presentation | SSL/TLS, JPEG | Data formatting |
| 5 | Session | NetBIOS, RPC | Connection management |
| 4 | Transport | TCP, UDP | End-to-end delivery |
| 3 | Network | IP, ICMP, ARP | Routing |
| 2 | Data Link | Ethernet, Wi-Fi | Frame transmission |
| 1 | Physical | USB, Bluetooth | Bit transmission |

### TCP vs UDP

| Feature | TCP | UDP |
|---------|-----|-----|
| Connection | Connection-oriented | Connectionless |
| Reliability | Guaranteed delivery | Best-effort |
| Ordering | Maintains order | No ordering |
| Speed | Slower (overhead) | Faster |
| Use Cases | Web, email, file transfer | Streaming, gaming, DNS |

### Database ACID Properties

| Property | Description |
|----------|-------------|
| Atomicity | All or nothing — transactions are indivisible |
| Consistency | Data remains valid after transactions |
| Isolation | Concurrent transactions don't interfere |
| Durability | Committed data survives crashes |

### OS Process vs Thread

| Feature | Process | Thread |
|---------|---------|--------|
| Memory | Separate address space | Shared address space |
| Creation | Heavyweight | Lightweight |
| Communication | IPC (pipes, shared memory) | Direct (shared memory) |
| Context Switch | Expensive | Cheaper |

## FAQ

**Q1: What is Big-O notation and why does it matter?**
Big-O describes the upper bound of an algorithm's growth rate as input size increases. It matters because it tells you how an algorithm scales.

**Q2: What is the difference between a process and a thread?**
A process has its own memory space and resources. A thread shares the process's memory but has its own stack and registers.

**Q3: What is the OSI model?**
A conceptual framework that standardizes network communication into 7 layers. Each layer has specific responsibilities.

**Q4: What is TCP's three-way handshake?**
1. Client sends SYN
2. Server responds with SYN-ACK
3. Client sends ACK
Connection established.

**Q5: What is virtual memory?**
A memory management technique that gives processes the illusion of having a large contiguous address space using paging to swap between RAM and disk.

**Q6: What is a deadlock?**
A situation where two or more processes are blocked forever, each waiting for a resource held by another. Four conditions: mutual exclusion, hold and wait, no preemption, circular wait.

**Q7: What is the difference between HTTP and HTTPS?**
HTTPS is HTTP with TLS encryption. It provides confidentiality, integrity, and authentication. Uses port 443 vs HTTP's port 80.

**Q8: What is DNS and how does it work?**
Domain Name System translates domain names to IP addresses. Process: browser cache → OS cache → ISP cache → recursive resolver → root server → TLD server → authoritative server.

**Q9: What is the CAP theorem?**
In a distributed system, you can only guarantee two of three: Consistency, Availability, Partition tolerance. In practice, partition tolerance is required.

**Q10: What is two's complement?**
A method of representing negative integers in binary. To negate: invert all bits and add 1. Range: -2^(n-1) to 2^(n-1)-1.

**Q11: What is a cache and why is it important?**
A small, fast memory that stores copies of frequently accessed data. Reduces average memory access time. Cache misses can cause 100x+ slowdowns.

**Q12: What is the difference between mutex and semaphore?**
Mutex is a locking mechanism (one thread at a time). Semaphore is a signaling mechanism (count-based, multiple threads).

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Confusing Big-O with Big-Theta | Big-O is upper bound, Big-Theta is tight bound |
| Not considering cache effects | Prefer sequential access patterns |
| Confusing TCP and UDP | Match protocol to requirements |
| Ignoring constant factors | Consider practical input sizes |
| Not understanding two's complement | Study overflow and signed/unsigned arithmetic |
| Confusing mutex and semaphore | Mutex = exclusive lock, Semaphore = counting signal |

## Best Practices

1. Always state assumptions (best, average, worst case)
2. Consider both time AND space complexity
3. Understand the full HTTP request/response lifecycle
4. Know the difference between connection-oriented and connectionless
5. Understand DNS resolution at multiple levels
6. Always use parameterized queries (prevent SQL injection)
7. Understand indexing and when it helps vs hurts
8. Know process vs thread trade-offs
9. Understand deadlock conditions and prevention
10. Know scheduling algorithms (FCFS, SJF, Round Robin)

## Quick Reference

```
COMPLEXITY CLASSES:
  O(1)     — Constant: hash lookup
  O(log n) — Logarithmic: binary search
  O(n)     — Linear: array scan
  O(n log n) — Linearithmic: merge sort
  O(n²)    — Quadratic: nested loops
  O(2ⁿ)    — Exponential: subsets
  O(n!)    — Factorial: permutations

BITWISE TRICKS:
  x & (x-1)     — Clear lowest set bit
  x & (-x)      — Isolate lowest set bit
  x ^ (x >> 1)  — Parity check

TWO'S COMPLEMENT (8-bit):
  Range: -128 to 127
  -1 = 11111111
  -128 = 10000000
  Negate: invert bits + 1

IEEE 754 FLOAT:
  Sign | Exponent (8) | Mantissa (23)
```
