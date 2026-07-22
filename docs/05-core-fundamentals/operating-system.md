---
layout: default
title: Operating System
parent: Core CS Fundamentals
---

# Operating System

An Operating System is system software that acts as an intermediary between computer hardware and user applications, managing hardware resources and providing services for application execution.

## Key Concepts

| Concept | Summary |
|---------|---------|
| Process vs Thread | Process: separate address space, IPC required. Thread: shared address space, faster context switch |
| Context Switching | Kernel saves current process state (PCB) and loads another; includes register save, TLB flush, cache misses |
| System Call | Programmatic request for kernel service (fork, open, read, exec, exit) |
| User vs Kernel Mode | User mode: restricted access. Kernel mode: full hardware access. System calls trigger mode switch |
| Deadlock | Four conditions: Mutual Exclusion, Hold and Wait, No Preemption, Circular Wait |
| Virtual Memory | Processes partially loaded; demand paging; page faults trigger disk I/O |
| TLB | Hardware cache for page table entries; TLB miss triggers page table walk |

## CPU Scheduling Algorithms

| Algorithm | Preemptive? | Starvation? | Notes |
|-----------|-------------|-------------|-------|
| FCFS | No | No | Suffers convoy effect |
| SJF/SRTF | No/Yes | Possible | Optimal average waiting time |
| Round Robin | Yes | No | Fixed time quantum; favors response time |
| Priority | Optional | Yes | Aging solves starvation |
| MLFQ | Yes | Possible | Multiple queues with different priorities |

## Process States

```
New → Ready → Running ⇄ Waiting → Terminated
```

## Page Replacement Algorithms

| Algorithm | Belady's Anomaly? | Notes |
|-----------|-------------------|-------|
| FIFO | Yes | Replace oldest page |
| LRU | No | Replace least recently used |
| Optimal | No | Replace page used farthest in future (theoretical) |
| Clock | No | Circular buffer with reference bits |

## FAQ (Top 10)

**Q1: What is the difference between a process and a thread?**
Threads share address space within a process (faster context switch, direct communication). Processes have separate address spaces (isolation, IPC required).

**Q2: What is a race condition?**
Concurrent shared data access where the final result depends on execution order. Example: two threads incrementing a shared counter can lose updates.

**Q3: What is the Bankers Algorithm?**
Deadlock avoidance using Available, Max, Allocation, Need matrices. Checks if granting a request leaves the system in a safe state.

**Q4: What is virtual memory and how does it work?**
Executes processes partially in memory via demand paging. Page faults trigger disk I/O. Gives illusion of larger memory.

**Q5: What is thrashing and how to prevent it?**
Excessive paging — more time swapping than executing. Prevention: Working Set Model, Page Fault Frequency control.

**Q6: Difference between mutex and semaphore?**
Mutex: ownership concept, only locking thread unlocks. Semaphore: signaling mechanism, no ownership, any thread can signal.

**Q7: What is Belady's Anomaly?**
Increasing frames increases page faults. Occurs with FIFO only, not LRU or Optimal.

**Q8: What is Copy-on-Write (COW)?**
fork() optimization: pages shared between parent/child until write occurs. On write, a copy is created.

**Q9: How is a page fault handled?**
Trap to kernel → validate address → find/evict frame → I/O to load page → update page table → restart instruction.

**Q10: What is the convoy effect?**
Short processes waiting behind a long process in FCFS, reducing CPU and I/O utilization.

## Common Mistakes

1. Confusing process and thread (threads share address space)
2. Bankers Algorithm: Need = Max - Allocation, not Allocation - Max
3. Deadlock vs Starvation (starvation has no circular dependency)
4. Belady's Anomaly only occurs with FIFO
5. Confusing segmentation (variable) with paging (fixed)
6. Ignoring context switch overhead in performance estimates
7. Not understanding Copy-on-Write behavior in fork()

## Best Practices

1. Draw diagrams in interviews (state diagrams, resource allocation graphs)
2. Practice scheduling numericals until instant recall
3. Master concurrency primitives (mutex, semaphore, monitor)
4. Relate OS concepts to system design discussions
5. Understand the full I/O path from user space to disk

## Quick Reference

```
Turnaround Time = Completion Time - Arrival Time
Waiting Time = Turnaround Time - Burst Time
Effective Access Time = (1-p) * mem_access + p * page_fault_time
Disk Access Time = Seek + Rotational Latency + Transfer
Deadlock: Mutual Exclusion + Hold & Wait + No Preemption + Circular Wait
```
