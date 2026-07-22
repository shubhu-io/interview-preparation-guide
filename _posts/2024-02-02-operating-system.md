---
layout: post
"Operating System"
categories: [Core-CS]
tags: [interview, preparation]
toc: true
---


> *Comprehensive guide covering OS concepts from basics to advanced for FAANG and top-tier tech interviews.*

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [Learning Roadmap](#2-learning-roadmap)
3. [Theory Notes](#3-theory-notes)
4. [Key Concepts](#4-key-concepts)
5. [Frequently Asked Interview Questions](#5-frequently-asked-interview-questions)
6. [Hands-on Practice Exercises](#6-hands-on-practice-exercises)
7. [Real Interview Questions from FAANG](#7-real-interview-questions-from-faang)
8. [Common Mistakes](#8-common-mistakes)
9. [Best Practices](#9-best-practices)
10. [Cheat Sheet](#10-cheat-sheet)
11. [Flash Cards](#11-flash-cards)
12. [Mind Map](#12-mind-map)
13. [Mermaid Diagrams](#13-mermaid-diagrams)
14. [Code Examples](#14-code-examples)
15. [Mini Project - Process Scheduler Simulator](#15-mini-project---process-scheduler-simulator)
16. [Intermediate Project - Memory Management Simulator](#16-intermediate-project---memory-management-simulator)
17. [Advanced Project - Simple OS Kernel](#17-advanced-project---simple-os-kernel)
18. [10 Project Ideas](#18-10-project-ideas)
19. [Practice Websites](#19-practice-websites)
20. [Books](#20-books)
21. [Documentation](#21-documentation)
22. [YouTube Channels](#22-youtube-channels)
23. [Blogs](#23-blogs)
24. [Certifications](#24-certifications)
25. [Checklist](#25-checklist)
26. [Revision Notes](#26-revision-notes)
27. [One-Day Revision Plan](#27-one-day-revision-plan)
28. [One-Week Revision Plan](#28-one-week-revision-plan)
29. [Mock Interview Questions](#29-mock-interview-questions)
30. [Difficulty Rating](#30-difficulty-rating)

---

## 1. Introduction

**What is an Operating System?** An Operating System is system software that acts as an intermediary between computer hardware and user applications. It manages hardware resources, provides services for application execution, and creates an environment where users can run programs conveniently and efficiently.

### Types of Operating Systems

| Type | Description | Examples |
|------|-------------|----------|
| **Batch OS** | Jobs are batched together without user interaction | IBM OS/360 |
| **Time-Sharing OS** | CPU time is shared among multiple users | Unix, Linux |
| **Distributed OS** | Multiple interconnected CPUs share resources | Amoeba, Plan 9 |
| **Network OS** | Computers connected via network with independent resources | Windows Server, Novell NetWare |
| **Real-Time OS** | Guarantees response within fixed time constraints | VxWorks, QNX, RT-Linux |
| **Embedded OS** | Designed for embedded systems | FreeRTOS, Embedded Linux |

### Why OS is Critical for Interviews

- OS concepts form the backbone of system design discussions
- Understanding processes, memory, and concurrency is essential for writing efficient code
- FAANG interviews routinely ask OS questions at all levels
- OS knowledge is crucial for debugging, performance optimization, and scalability

---

## 2. Learning Roadmap

| Level | Topics | Time |
|-------|--------|------|
| **Beginner** | What is an OS? Process vs Program, System Calls, OS Structures | 1 week |
| **Intermediate** | Process Management, CPU Scheduling, Synchronization, Deadlocks | 2-3 weeks |
| **Advanced** | Memory Management, Virtual Memory, File Systems, I/O, Disk Scheduling | 2-3 weeks |
| **Expert** | Kernel Internals, RTOS, Distributed OS, OS Security, Virtualization | 3-4 weeks |### Beginner
- Learn what an OS is and its functions
- Understand user mode vs kernel mode
- System calls and their types
- OS structures (Monolithic, Microkernel, Layered, Modular)

### Intermediate
- Process lifecycle and states
- CPU scheduling algorithms with numerical problems
- Synchronization primitives and their usage
- Deadlock conditions and handling strategies

### Advanced
- Memory allocation strategies
- Paging, Segmentation, Virtual Memory
- Page replacement algorithms
- File systems and disk scheduling
- I/O management and DMA

### Expert
- Kernel module development
- Real-time OS concepts
- OS security mechanisms
- Virtualization and containerization (Docker internals)
- Performance tuning and profiling

---

## 3. Theory Notes

### 3.1 Process Management

#### Process vs Thread

| Feature | Process | Thread |
|---------|---------|--------|
| Definition | Program in execution | Lightweight unit of a process |
| Address Space | Separate address space | Shares address space with process |
| Memory | Own code, data, heap, stack | Shares code, data, heap; own stack |
| Communication | IPC (pipes, sockets, shared memory) | Direct memory access |
| Context Switch | Slower (more overhead) | Faster (less overhead) |
| Creation | fork(), CreateProcess() | pthread_create(), CreateThread() |
| Isolation | High | Low |
| Resources | Own resources | Shares process resources |

#### Process States

1. **New** - Process is being created
2. **Ready** - Process is ready to run, waiting for CPU
3. **Running** - Instructions are being executed
4. **Waiting (Blocked)** - Process waiting for I/O or event
5. **Terminated** - Process has finished execution

#### Context Switching

The kernel saves the state of the current process (PCB) and loads the saved state of another process. Overhead includes saving/loading registers, TLB flush, cache misses, scheduler decision time.

#### Process Control Block (PCB)

Data structure storing PID, Program Counter, CPU Registers, Memory limits, Open files, Process state, Scheduling info, Accounting info.

#### Inter-Process Communication (IPC)

| Method | Description | Type | Use Case |
|--------|-------------|------|----------|
| **Pipe** | Unidirectional byte stream between related processes | Unnamed | Parent-child communication |
| **Named Pipe (FIFO)** | Similar to pipe, but unrelated processes | Named | Any two processes on same machine |
| **Shared Memory** | Fastest IPC; processes share memory region | Memory | High-speed data sharing |
| **Message Queue** | Messages are queued and retrieved | Message | Structured communication |
| **Socket** | Communication over network | Network | Client-server across machines |
| **Semaphore** | Synchronization mechanism | Sync | Coordinating access to resources |
| **Mutex** | Binary semaphore for mutual exclusion | Sync | Protecting critical sections |
| **Signal** | Notification of events to processes | Async | Event handling |
---

### 3.2 CPU Scheduling

| Algorithm | Description | Preemptive? | Starvation? |
|-----------|-------------|-------------|-------------|
| **FCFS** | First Come First Served | No | No |
| **SJF** | Shortest Job First | No (or Yes for SRTF) | Possible |
| **SRTF** | Shortest Remaining Time First | Yes | Possible |
| **Round Robin** | Each process gets fixed time quantum | Yes | No |
| **Priority** | Higher priority runs first | Optional | Yes (aging solves) |
| **Multilevel Queue** | Processes separated into queues by type | Per-queue | Possible |
| **Multilevel Feedback Queue** | Processes can move between queues | Yes | Possible |

**Scheduling Criteria:** CPU Utilization, Throughput, Turnaround Time, Waiting Time, Response Time.

---

### 3.3 Synchronization

#### Race Condition
When multiple processes/threads access shared data concurrently and the final result depends on the order of execution.

#### Critical Section Problem
Code segment accessing shared resources. Requirements: 1. Mutual Exclusion, 2. Progress, 3. Bounded Waiting.

#### Petersons Solution
Software-based for two processes: flag[i]=true; turn=j; while (flag[j] && turn==j); // critical section; flag[i]=false;

#### Mutex
Locking mechanism; only one thread can acquire it. Operations: lock()/unlock(). Types: Spinlock (busy-waits), Sleep lock (blocks thread).

#### Semaphore
Integer variable via wait() (P) and signal() (V). Binary (0/1) - single resource. Counting (>1) - multiple identical resources.

#### Monitor
High-level construct encapsulating shared variables, procedures, condition variables. Only one thread executes inside at a time.

#### Deadlock

**Necessary Conditions:**
1. **Mutual Exclusion** - At least one resource is non-sharable
2. **Hold and Wait** - Process holds resources while waiting for others
3. **No Preemption** - Resources cannot be forcibly taken
4. **Circular Wait** - Circular chain of processes waiting for each other

**Handling Methods:**
| Method | Description | Example |
|--------|-------------|---------|
| **Prevention** | Ensure at least one condition never holds | Disallow hold-and-wait |
| **Avoidance** | OS knows resource requests in advance | Bankers Algorithm |
| **Detection** | Allow deadlock, detect and recover | Wait-for graph |
| **Recovery** | Terminate processes or preempt resources | Kill deadlocked processes |

#### Bankers Algorithm
Deadlock avoidance checking safe state. Data structures: Available, Max, Allocation, Need. Safety Algorithm finds safe sequence.

#### Starvation vs Deadlock
- **Starvation** - Process waits indefinitely, no circular dependency
- **Deadlock** - Circular waiting with blocked processes

---

### 3.4 Memory Management

#### Contiguous Allocation
- **Fixed Partitioning** - Fixed-size partitions (internal fragmentation)
- **Dynamic Partitioning** - On-demand partitions (external fragmentation)

#### Paging
Physical memory = frames, logical memory = pages. Page table maps virtual->physical. TLB is hardware cache for page table. No external fragmentation.

#### Segmentation
Variable-sized segments (code, data, stack, heap). Segment table: base + limit. External fragmentation.

#### Virtual Memory
Processes partially loaded. Demand paging - pages loaded on need. Page fault triggers OS trap.

#### Page Replacement Algorithms

| Algorithm | Description | Beladys Anomaly? |
|-----------|-------------|-------------------|
| **FIFO** | Replace oldest page | Yes |
| **LRU** | Replace least recently used page | No |
| **Optimal** | Replace page used farthest in future | No |
| **Clock** | Circular buffer with reference bits | No |

#### Thrashing
Excessive paging - CPU swaps more than executes. Cause: too many processes. Solution: Working Set Model.

#### Working Set
Pages a process currently uses. Must fit in available frames. Working Set Model monitors page fault frequency.

#### Page Fault Handling
1. Trap to OS; 2. Validate address; 3. Find free frame; 4. I/O to load page; 5. Update page table; 6. Restart instruction.

---

### 3.5 File Systems

| Method | Description | Pros | Cons |
|--------|-------------|------|------|
| **Contiguous** | File in contiguous blocks | Fast access | External fragmentation |
| **Linked** | Block points to next block | No fragmentation | Slow direct access |
| **Indexed** | File has index block | Fast direct access | Index overhead |

#### Directory Structures
- Single-Level, Two-Level, Tree-Structured, Acyclic Graph, General Graph

#### Disk Scheduling

| Algorithm | Description |
|-----------|-------------|
| **FCFS** | Process in request order |
| **SSTF** | Shortest seek time first |
| **SCAN** | Elevator algorithm, one direction then reverse |
| **C-SCAN** | SCAN but arm returns to start |
| **LOOK** | SCAN only to last request |
| **C-LOOK** | C-SCAN only to last request |

#### RAID Levels
- RAID 0: Striping (no redundancy, 2 disks)
- RAID 1: Mirroring (tolerates 1 failure, 2 disks)
- RAID 5: Striping + parity (tolerates 1 failure, 3 disks)
- RAID 6: Dual parity (tolerates 2 failures, 4 disks)
- RAID 10: Mirror + Striping (tolerates 1 per group, 4 disks)

---

### 3.6 I/O Management

- **Buffering** - Temporary storage to smooth I/O data transfer
- **Spooling** - Simultaneous Peripheral Operations On-Line (printer buffer)
- **DMA** - Direct Memory Access, device transfers data without CPU
- **I/O Models**: Polling (busy-wait), Interrupt-Driven (efficient), DMA (most efficient)
---

## 4. Key Concepts

| Concept | Summary |
|---------|---------|
| **Kernel** | Core of OS, manages everything, runs in privileged mode |
| **System Call** | Interface between user programs and OS services |
| **Dual Mode** | User mode (restricted) / Kernel mode (privileged) switching |
| **Von Neumann** | Stored-program concept: instructions and data in same memory |
| **Multiprogramming** | Multiple programs ready to run, improves CPU utilization |
| **Multitasking** | Time-sharing of CPU among processes |
| **Multiprocessing** | Multiple CPUs/cores executing simultaneously |
| **TLB** | Hardware cache for page table entries |
| **Locality** | Temporal and Spatial access patterns |
| **Protection Rings** | Ring 0 = kernel, Ring 3 = user |
| **Copy-on-Write** | Fork optimization: pages shared until written to |
| **Inode** | File metadata (permissions, size, data block pointers) |

---

## 5. Frequently Asked Interview Questions

### Beginner Level (Q1-Q10)

**Q1: What is the difference between a process and a program?**

A program is a passive collection of instructions on disk. A process is an active entity - a program loaded in memory with its own address space, registers, stack, and PCB. A single program can spawn multiple processes.

**Q2: Explain the different process states.**

New, Ready, Running, Waiting (Blocked), Terminated. Transitions: New->Ready->Running<->Waiting, Running->Terminated.

**Q3: What is the difference between a process and a thread?**

Threads share address space within a process (faster context switch, direct communication). Processes have separate address spaces (isolation, IPC required).

**Q4: What is a system call? Give examples.**

Programmatic request for kernel service. Examples: fork() (process), open() (file), read() (I/O), exec() (program load), exit() (terminate).

**Q5: What is the difference between user mode and kernel mode?**

User mode: restricted hardware access, process isolation. Kernel mode: full access, privileged operations. System calls trigger mode switch via trap.

**Q6: Explain FCFS scheduling with an example.**

Processes get CPU in arrival order. P1=24ms, P2=3ms, P3=3ms (all at time 0): avg waiting time = (0+24+27)/3 = 17ms. Suffers from convoy effect.

**Q7: What is a race condition?**

Concurrent shared data access where final result depends on execution order. Example: two threads incrementing shared counter can lose updates.

**Q8: What is a critical section?**

Code segment accessing shared resources. Must satisfy: Mutual Exclusion, Progress, Bounded Waiting.

**Q9: What is a semaphore? Differentiate binary and counting.**

Integer variable via wait()/signal(). Binary (0/1): single resource control. Counting (>=0): multiple identical resources.

**Q10: Explain deadlock and its necessary conditions.**

Processes blocked forever waiting for resources held by each other. Four conditions: Mutual Exclusion, Hold and Wait, No Preemption, Circular Wait.

### Intermediate Level (Q11-Q20)

**Q11: What is the Bankers Algorithm?**

Deadlock avoidance using Available, Max, Allocation, Need matrices. Checks if granting a request leaves system in safe state (safe sequence exists).

**Q12: Compare paging and segmentation.**

Paging: fixed-size, no external fragmentation, transparent. Segmentation: variable-size, external fragmentation, user-visible logical divisions.

**Q13: What is virtual memory? How does it work?**

Executes processes partially in memory via demand paging. Page faults trigger disk I/O. Gives illusion of larger memory, supports more/larger programs.

**Q14: Explain LRU page replacement.**

Replaces least recently used page. Requires access tracking (counters/stack). Optimal in practice, expensive. No Beladys Anomaly.

**Q15: What is thrashing? How to prevent?**

Excessive paging - more time swapping than executing. Causes: too many processes. Prevention: Working Set Model, Page Fault Frequency control.

**Q16: Difference between mutex and semaphore?**

Mutex: ownership concept, only locking thread unlocks, priority inheritance. Semaphore: signaling mechanism, no ownership, any thread can signal.

**Q17: What is the convoy effect?**

Short processes waiting behind long process in FCFS, reducing CPU and I/O utilization. Example: CPU-bound process followed by I/O-bound processes.

**Q18: Explain Round Robin scheduling.**

Fixed time quantum per process. If unfinished, goes to queue end. Favors response time. Quantum: too large = FCFS, too small = many context switches.

**Q19: Internal vs External fragmentation?**

Internal: waste inside allocated block (fixed partitioning). External: scattered free blocks (dynamic partitioning).

**Q20: Explain SCAN (Elevator) disk scheduling.**

Disk arm moves one direction servicing requests, then reverses. Provides uniform wait time, prevents starvation.
### Advanced Level (Q21-Q30)

**Q21: What is Beladys Anomaly?**

Increasing frames increases page faults. Occurs with FIFO only (not LRU/Optimal). Example: ref string 1,2,3,4,1,2,5,1,2,3,4,5 - 3 frames=9 faults, 4 frames=10 faults.

**Q22: Explain Multilevel Feedback Queue.**

Multiple queues with different priorities/quantums. Processes move between queues. I/O-bound stay high, CPU-bound sink. Aging prevents starvation. Used in Unix.

**Q23: What is Copy-on-Write (COW)?**

fork() optimization: pages shared between parent/child until write occurs. On write, copy created. Saves memory, avoids copying large address spaces.

**Q24: Explain Producer-Consumer problem.**

Bounded buffer: producer adds items, consumer removes. Solved with semaphores: empty (buffer slots), full (items count), mutex (mutual exclusion).

**Q25: What is the Readers-Writers problem?**

Multiple readers OK simultaneously. Only one writer, no readers during writing. Solutions: reader-priority, writer-priority, fair version.

**Q26: Explain Dining Philosophers problem.**

5 philosophers, 5 forks (chopsticks). Deadlock example. Solutions: limit 4 diners, pick both forks together, odd/even picking order.

**Q27: Hard link vs Soft link?**

Hard: direct inode pointer, same data, cannot cross filesystems. Soft: path reference, can cross FS, dangling if target deleted.

**Q28: How is a page fault handled?**

1. Trap to kernel; 2. Save state; 3. Validate address; 4. Find/evict frame; 5. I/O to load page; 6. Update page table; 7. Restart instruction.

**Q29: Priority inversion and inheritance?**

Inversion: high-priority blocked by low-priority holding lock, while medium preempts low. Inheritance: low temporarily inherits high priority to finish CS.

**Q30: Explain Working Set Model.**

W(delta, t) = pages referenced in last delta time. Must fit in physical memory to prevent thrashing. OS monitors page fault frequency.

### FAANG Level (Q31-Q36)

**Q31: Design a thread pool.**

Worker threads + task queue. Benefits: no thread creation/destruction per task, controlled resource usage, improved response time.

**Q32: How does malloc() work in Linux?**

glibc uses ptmalloc. Small allocations: bins (fast, small, unsorted). Large: mmap(). Huge: sbrk/brk. Free chunks tracked via freed lists with coalescing.

**Q33: Explain zero-copy networking.**

sendfile(), splice() move data disk->network without user-space copy. Reduces context switches, CPU usage, memory bandwidth. Used in nginx, Kafka.

**Q34: Spinlock vs Mutex?**

Spinlock: busy-waits, no context switch, for short CS on multi-core. Mutex: thread sleeps, context switch overhead, for longer waits.

**Q35: How does Linux CFS work?**

Completely Fair Scheduler: red-black tree runqueue. vruntime tracks CPU time. Picks smallest vruntime. Proportional share based on nice value.

**Q36: Explain memory-mapped files.**

mmap() maps file to address space. File I/O via memory load/store. Pages faulted in on demand. Uses: shared memory IPC, DB buffer pools, executable loading.

### Expert Level (Q37-Q42)

**Q37: Explain the differences between user-level and kernel-level threads.**

User-level threads: managed by user-space library, no kernel support, fast creation/switching, but one blocking call blocks all. Kernel-level threads: managed by OS, true parallelism on multicore, slower creation/switching. Mapping models: many-to-one, one-to-one, many-to-many.

**Q38: What is priority inversion and how is it solved?**

High-priority thread blocked waiting for a resource held by low-priority thread, while medium-priority thread preempts low-priority. Solution: Priority Inheritance — low-priority thread temporarily inherits high-priority to finish critical section quickly. Used in Mars Pathfinder fix and real-time systems.

**Q39: Explain the Windows vs Linux process model differences.**

Linux: processes created via fork() (copy-on-write), threads are lightweight processes sharing address space. Windows: CreateProcess() loads new executable, CreateThread() for threads, separate process and thread objects. Linux treats threads specially only in scheduling. Windows has distinct kernel objects for processes and threads.

**Q40: What is a context switch and what are its costs?**

Context switch: saving state of current process (PCB) and loading state of next. Costs: CPU cycles (1-1000 microseconds), TLB flush (pipeline stalls), cache pollution (cold cache), scheduler overhead. Minimized by: thread-local storage, skip TLB flush for same-address-space switches, efficient scheduling algorithms.

**Q41: How does the Linux OOM killer work?**

Out-of-Memory killer activates when system cannot allocate memory. Selects process to kill based on oom_score (points based on memory usage, process age, nice value). SIGKILL sent. Critical processes protected via oom_score_adj. Can be configured but risky. Modern alternative: memory cgroups for per-process limits.

**Q42: Explain the concept of kernel preemption.**

Non-preemptable kernel: only process-level context switches, critical sections can be long. Preemptable kernel: kernel can be interrupted during execution, better response time but more complex synchronization. Linux uses voluntary preemption (preemption points) and forced preemption (CONFIG_PREEMPT). Critical for real-time performance.


---

## 6. Hands-on Practice Exercises

### Scheduling Exercises
1. Calculate avg waiting/turnaround time for FCFS, SJF, SRTF, RR
2. Simulate page replacement (FIFO, LRU, Optimal) on a 20-reference string
3. Compare Round Robin performance with quantum values of 1, 2, 4, 8
4. Trace Multilevel Feedback Queue scheduling with 3 priority levels

### Memory Management Exercises
5. Compute EAT given page fault rate and memory access time
6. Simulate a multi-level page table lookup for a 32-bit address
7. Calculate page table size for different page sizes (1KB, 4KB, 64KB)
8. Trace LRU stack-based algorithm on a reference string

### Synchronization Exercises
9. Identify deadlock in resource allocation graph
10. Implement Producer-Consumer with semaphores
11. Implement Readers-Writers problem with fairness
12. Solve Dining Philosophers avoiding deadlock

### File System Exercises
13. Calculate disk seek time for different scheduling algorithms
14. Compare file allocation methods given block size and file sizes
15. Trace inode-based file access for a given directory tree
16. Calculate RAID storage capacity and fault tolerance for different levels

### Process Management Exercises
17. Trace process state transitions from a timeline
18. Simulate fork() with copy-on-write behavior
19. Calculate context switch overhead for different scenarios
20. Implement a simple process scheduler in C/Python

## 14. Code Examples

### 14.1 Producer-Consumer with Semaphores (C)

```c
#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#define BUFFER_SIZE 5

int buffer[BUFFER_SIZE];
int in = 0, out = 0;

sem_t empty;    // counts empty slots
sem_t full;     // counts full slots
sem_t mutex;    // binary semaphore for mutual exclusion

void *producer(void *arg) {
    int item;
    for (int i = 0; i < 10; i++) {
        item = rand() % 100;
        sem_wait(&empty);
        sem_wait(&mutex);
        buffer[in] = item;
        in = (in + 1) % BUFFER_SIZE;
        printf("Produced: %d\n", item);
        sem_post(&mutex);
        sem_post(&full);
    }
    return NULL;
}

void *consumer(void *arg) {
    int item;
    for (int i = 0; i < 10; i++) {
        sem_wait(&full);
        sem_wait(&mutex);
        item = buffer[out];
        out = (out + 1) % BUFFER_SIZE;
        printf("Consumed: %d\n", item);
        sem_post(&mutex);
        sem_post(&empty);
    }
    return NULL;
}

int main() {
    sem_init(&empty, 0, BUFFER_SIZE);
    sem_init(&full, 0, 0);
    sem_init(&mutex, 0, 1);

    pthread_t prod, cons;
    pthread_create(&prod, NULL, producer, NULL);
    pthread_create(&cons, NULL, consumer, NULL);
    pthread_join(prod, NULL);
    pthread_join(cons, NULL);

    sem_destroy(&empty);
    sem_destroy(&full);
    sem_destroy(&mutex);
    return 0;
}
```

### 14.2 Page Replacement Simulator (Python)

```python
def fifo_page_faults(pages, frame_count):
    frames = []
    faults = 0
    for page in pages:
        if page not in frames:
            faults += 1
            if len(frames) >= frame_count:
                frames.pop(0)
            frames.append(page)
    return faults

def lru_page_faults(pages, frame_count):
    frames = []
    faults = 0
    for page in pages:
        if page not in frames:
            faults += 1
            if len(frames) >= frame_count:
                frames.pop(0)
            frames.append(page)
        else:
            frames.remove(page)
            frames.append(page)
    return faults

def optimal_page_faults(pages, frame_count):
    frames = []
    faults = 0
    for i, page in enumerate(pages):
        if page not in frames:
            faults += 1
            if len(frames) >= frame_count:
                farthest = -1
                victim = 0
                for j, f in enumerate(frames):
                    try:
                        idx = pages[i+1:].index(f)
                    except ValueError:
                        victim = j
                        break
                    if idx > farthest:
                        farthest = idx
                        victim = j
                frames[victim] = page
            else:
                frames.append(page)
    return faults

# Example usage
pages = [7, 0, 1, 2, 0, 3, 0, 4, 2, 3, 0, 3, 2, 1, 2, 0, 1, 7, 0, 1]
frames = 3
print(f"FIFO: {fifo_page_faults(pages, frames)} faults")
print(f"LRU:  {lru_page_faults(pages, frames)} faults")
print(f"OPT:  {optimal_page_faults(pages, frames)} faults")
```

### 14.3 Bankers Algorithm (Python)

```python
def bankers_algorithm(available, maximum, allocation):
    n = len(maximum)
    m = len(available)
    need = [[maximum[i][j] - allocation[i][j] for j in range(m)] for i in range(n)]
    work = available[:]
    finish = [False] * n
    safe_sequence = []

    while len(safe_sequence) < n:
        found = False
        for i in range(n):
            if not finish[i]:
                if all(need[i][j] <= work[j] for j in range(m)):
                    work = [work[j] + allocation[i][j] for j in range(m)]
                    finish[i] = True
                    safe_sequence.append(i)
                    found = True
        if not found:
            return None  # Unsafe state

    return safe_sequence

# Example
available = [3, 3, 2]
maximum = [[7, 5, 3], [3, 2, 2], [9, 0, 2], [2, 2, 2], [4, 3, 3]]
allocation = [[0, 1, 0], [2, 0, 0], [3, 0, 2], [2, 1, 1], [0, 0, 2]]

result = bankers_algorithm(available, maximum, allocation)
if result:
    print(f"Safe sequence: {result}")
else:
    print("System is in unsafe state!")
```

### 14.4 Disk Scheduling Simulator (Python)

```python
def fcfs_disk(requests, head):
    total = 0
    current = head
    for req in requests:
        total += abs(req - current)
        current = req
    return total

def sstf_disk(requests, head):
    total = 0
    current = head
    remaining = list(requests)
    while remaining:
        closest = min(remaining, key=lambda x: abs(x - current))
        total += abs(closest - current)
        current = closest
        remaining.remove(closest)
    return total

def scan_disk(requests, head, disk_size=200):
    total = 0
    sorted_req = sorted(requests)
    left = [r for r in sorted_req if r < head]
    right = [r for r in sorted_req if r >= head]
    total += sum(abs(head - r) for r in reversed(left))
    total += abs(left[0] - 0) if left else 0
    total += abs(0 - right[0]) if right else 0
    total += sum(abs(right[i] - right[i+1]) for i in range(len(right)-1))
    return total

# Example
requests = [98, 183, 37, 122, 14, 124, 65, 67]
head = 53
print(f"FCFS: {fcfs_disk(requests, head)} seeks")
print(f"SSTF: {sstf_disk(requests, head)} seeks")
print(f"SCAN: {scan_disk(requests, head)} seeks")
```

---

## 7. Real Interview Questions from FAANG

### Google
- Design a thread-safe blocking queue
- Virtual memory address translation - hardware/software path
- fork() internals and Copy-on-Write details
- Design LRU cache with O(1) operations
- Implement a deadlock detection tool

### Amazon
- How does Linux handle signals?
- Process vs Thread memory perspective (heap, stack, code, data)
- Complete read() syscall path from user space to disk
- Design a rate limiter using OS primitives
- What happens when you type a URL? (OS level perspective)

### Microsoft
- Memory layout of a C program (text, data, BSS, heap, stack)
- Windows DLL loading and loader lock
- Kernel-mode vs user-mode scheduling
- Windows memory manager internals
- Interrupt handling and IRQL levels

### Meta (Facebook)
- Design a concurrent hash map
- Kernel-level mutex implementation (futex)
- Debugging OS-level performance bottlenecks
- Linux OOM killer mechanism
- Context switching - minimizing its cost

---

## 8. Common Mistakes

1. Confusing process and thread (threads share address space)
2. Preemptive vs non-preemptive confusion
3. Bankers Algorithm: Need = Max - Allocation, not Allocation - Max
4. Deadlock vs Starvation (starvation no circular dependency)
5. Beladys Anomaly only with FIFO
6. Segmentation (variable) vs Paging (fixed)
7. Semaphore negative value = waiting processes count
8. RR quantum choice trade-offs
9. Ignoring context switch overhead
10. Not understanding Copy-on-Write behavior

---

## 9. Best Practices

1. Draw diagrams in interviews (RAG, state diagrams)
2. Use real-world analogies
3. Practice scheduling numericals until instant recall
4. Understand the full I/O path
5. Master concurrency primitives
6. Study Linux kernel basics
7. Write multi-threaded programs
8. Relate OS concepts to system design
---

## 10. Cheat Sheet

### Scheduling Formulas
- Turnaround Time = Completion Time - Arrival Time
- Waiting Time = Turnaround Time - Burst Time
- Response Time = First Response Time - Arrival Time
- CPU Utilization = (Total CPU Time / Total Time) * 100
- Throughput = Number of processes / Total Time

### Page Table Sizing
- Page offset bits = log2(page size)
- Number of pages = address space / page size
- Page table size = pages * page table entry size

### Effective Access Time (Paging)
- EAT = (1-p) * mem_access + p * page_fault_time

### Disk Access Time = Seek + Rotational Latency + Transfer

### Deadlock: ME + H&W + NP + CW

### Process States: New -> Ready -> Running <-> Waiting -> Terminated

---

## 11. Flash Cards (20 Q&A)

| # | Question | Answer |
|---|----------|--------|
| 1 | What is the kernel? | Core OS component in privileged mode, manages CPU/memory/devices |
| 2 | Preemptive vs Non-preemptive? | Preemptive: CPU can be taken (RR, SRTF). Non-preemptive: process holds CPU (FCFS, SJF) |
| 3 | What is a TLB miss? | Virtual-to-physical mapping not in TLB cache, triggers page table walk |
| 4 | External vs Internal fragmentation? | External: scattered free blocks. Internal: block larger than needed |
| 5 | Optimal page replacement? | Replace page used farthest in future. Theoretical only |
| 6 | What is PCB? | Process metadata: PID, state, registers, memory, files, scheduling info |
| 7 | Zombie process? | Terminated process still in table (parent hasnt called wait()) |
| 8 | Orphan process? | Process whose parent died, adopted by init (PID 1) |
| 9 | Sync vs Async I/O? | Sync: caller blocks. Async: caller continues, notified on completion |
| 10 | Priority inversion? | High-priority blocked by low-priority holding lock, medium preempts low |
| 11 | Locality of reference? | Temporal (recently accessed) and Spatial (nearby locations) |
| 12 | Spinlock? | Busy-waiting lock for short critical sections on multi-core |
| 13 | Logical vs Physical address? | Logical: CPU-generated (virtual). Physical: actual RAM. MMU translates |
| 14 | System call trap? | Software interrupt switching user mode to kernel mode |
| 15 | What is MMU? | Memory Management Unit - translates virtual to physical addresses |
| 16 | Microkernel advantages? | Smaller kernel, better security, fault isolation |
| 17 | What is an Inode? | File metadata (permissions, size, data blocks). NOT filename |
| 18 | Nice value in Linux? | Process priority: -20 (highest) to +19 (lowest), default 0 |
| 19 | Barrier in parallel prog? | Sync point where threads wait until all reach barrier |
| 20 | Bootloader function? | Loads OS kernel into memory and starts execution |

---

## 12. Mind Map

`
OPERATING SYSTEM
|
+-- Process Management
|   +-- Process (PCB, States, Context Switch)
|   +-- Thread (User vs Kernel threads)
|   +-- IPC (Pipes, Shared Memory, Message Queues, Sockets)
|   +-- Scheduling (FCFS, SJF, RR, Priority, MLQ, MLFQ)
|
+-- Synchronization
|   +-- Race Conditions & Critical Section
|   +-- Locks (Mutex, Spinlock)
|   +-- Semaphores (Binary, Counting)
|   +-- Classical Problems (PC, RW, DP)
|   +-- Deadlock (Conditions, Prevention, Avoidance, Detection, Recovery)
|
+-- Memory Management
|   +-- Paging (Page Table, TLB, Multi-level)
|   +-- Segmentation
|   +-- Virtual Memory (Demand Paging, Page Fault)
|   +-- Page Replacement (FIFO, LRU, Optimal, Clock)
|   +-- Thrashing (Working Set)
|
+-- File Systems
|   +-- Allocation (Contiguous, Linked, Indexed)
|   +-- Directory Structures
|   +-- Disk Scheduling (FCFS, SSTF, SCAN, C-SCAN)
|   +-- RAID Levels (0, 1, 5, 6, 10)
|
+-- I/O Management
    +-- I/O Models (Polling, Interrupt, DMA)
    +-- Buffering & Spooling
`

---

## 13. Mermaid Diagrams

### Process State Diagram

`mermaid
stateDiagram-v2
    [*] --> New
    New --> Ready : Admitted
    Ready --> Running : Dispatch
    Running --> Ready : Interrupt/Timeout
    Running --> Waiting : I/O Wait
    Waiting --> Ready : I/O Complete
    Running --> Terminated : Exit
    Terminated --> [*]
`

### CPU Scheduling Flow

`mermaid
flowchart TD
    A[Process Arrives] --> B[Ready Queue]
    B --> C[Scheduler Decision]
    C --> D[Execute]
    D --> E{Complete?}
    E -->|Yes| F[Terminated]
    E -->|No| G{I/O or Timeout?}
    G -->|I/O| H[Waiting Queue]
    H --> B
    G -->|Timeout| B
`

### Deadlock Handling

`mermaid
flowchart LR
    A[Deadlock] --> B[Prevention]
    A --> C[Avoidance]
    A --> D[Detection]
    A --> E[Recovery]
    B --> F[Break 1 of 4 conditions]
    C --> G[Bankers Algorithm]
    D --> H[Wait-for Graph]
    E --> I[Terminate/Preempt]
`

### Virtual to Physical Address Translation

`mermaid
flowchart LR
    CPU -->|Virtual Addr| MMU
    MMU --> TLB{TLB Hit?}
    TLB -->|Yes| PA[Physical Addr]
    TLB -->|No| PT[Page Table Walk]
    PT --> Mem{In Memory?}
    Mem -->|Yes| PA
    Mem -->|No| PF[Page Fault]
    PF --> Disk[Disk I/O]
    Disk --> PT
    PA --> RAM[Memory Access]
`
