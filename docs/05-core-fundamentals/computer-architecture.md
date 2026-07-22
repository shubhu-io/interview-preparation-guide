---
layout: default
title: Computer Architecture
parent: Core CS Fundamentals
---

# Computer Architecture

Computer Architecture defines the structure and behavior of computer systems, covering processor design, memory hierarchy, instruction sets, and system organization. It bridges hardware and software.

## Key Concepts

| Concept | Description |
|---------|-------------|
| ISA | Instruction Set Architecture — operations, data types, registers, addressing modes |
| Pipelining | Overlapping execution of multiple instructions across stages |
| Cache | Small, fast memory that exploits temporal and spatial locality |
| Virtual Memory | Each process gets private address space, translated by MMU |
| Branch Prediction | Speculatively determines branch outcome to keep pipeline full |
| Amdahl's Law | Speedup = 1 / ((1 - f) + f/s); serial fraction limits parallel speedup |
| Cache Coherence | Ensuring all processors see consistent view of shared memory |

## Memory Hierarchy

```
Registers     → ~0.5 KB   → <1 ns
L1 Cache      → 32-64 KB  → 1-2 ns
L2 Cache      → 256KB-1MB → 3-10 ns
L3 Cache      → 2-32 MB   → 10-30 ns
Main Memory   → 8-128 GB  → 50-100 ns
SSD Storage   → 256GB-4TB → 10-100 μs
HDD Storage   → 1-20 TB   → 5-10 ms
```

## Pipeline Hazards

| Hazard | Description | Solutions |
|--------|-------------|-----------|
| Data (RAW) | Instruction depends on previous result | Forwarding, stalling, scheduling |
| Data (WAR) | Anti-dependency | Register renaming |
| Control | Branch affects next fetch | Branch prediction, delayed branch |
| Structural | Resource conflict | Resource duplication |

## Cache Mapping

| Type | Mapping | Miss Rate | Hardware Cost |
|------|---------|-----------|---------------|
| Direct Mapped | Block → one line | Higher | Lowest |
| Set Associative (n-way) | Block → set, n lines | Medium | Medium |
| Fully Associative | Block → any line | Lowest | Highest |

## RISC vs CISC

| Feature | RISC | CISC |
|---------|------|------|
| Instruction length | Fixed (32-bit) | Variable |
| Cycles per instruction | 1 (ideally) | 1-15+ |
| Pipelining | Easier | Harder |
| Hardware complexity | Lower | Higher |
| Examples | ARM, MIPS, RISC-V | x86, VAX |

## FAQ (Top 10)

**Q1: What is the speedup from pipelining with k stages?**
Ideally k× speedup. Real speedup is less due to: latch delays, unbalanced stages, hazards (stalls), branch penalties. 5-stage pipeline typically achieves 3-4×.

**Q2: Explain data hazards and resolution.**
RAW: instruction reads what previous wrote. WAR: instruction writes before previous reads. WAW: both write same location. Resolutions: forwarding, stalling, compiler scheduling, register renaming.

**Q3: What is branch prediction?**
Speculatively determines branch outcome before resolution. Types: 1-bit, 2-bit saturating counter, correlating, tournament. Modern predictors: 95-99% accuracy.

**Q4: What are the three C's of cache misses?**
Compulsory (cold, first access), Capacity (cache too small), Conflict (multiple blocks same set), Coherence (invalidation from other cores).

**Q5: Write-back vs write-through cache?**
Write-through: update both cache and memory. Write-back: update only cache, write memory on eviction. Write-back is faster (fewer memory writes).

**Q6: Explain Amdahl's Law.**
Speedup = 1 / ((1-f) + f/s). If 60% parallelizable (f=0.6) with 10× speedup: Speedup = 1/(0.4+0.06) = 2.17×. Serial fraction limits maximum speedup.

**Q7: How does TLB work?**
TLB caches recent virtual-to-physical page translations. On hit: fast translation. On miss: page table walk in memory (~10-100 cycles).

**Q8: What is out-of-order execution?**
Instructions execute when operands are ready regardless of program order. Uses reservation stations, reorder buffer, register renaming. Results committed in order.

**Q9: What is the difference between throughput and latency?**
Latency: time for one operation. Throughput: operations per unit time. Pipeline doesn't reduce individual instruction latency but increases throughput.

**Q10: What is cache coherence?**
Ensuring all processors see consistent memory. Protocols: MSI, MESI, MOESI. Snooping-based (broadcast) or directory-based (centralized tracking).

## Common Mistakes

| Mistake | Solution |
|---------|----------|
| Assuming CPI = 1 | Measure actual CPI with profiling |
| Ignoring cache effects | Use cache-flushing for accurate benchmarks |
| Over-optimizing serial code | Amdahl's Law limits speedup |
| Ignoring memory alignment | Align to cache line boundaries |

## Best Practices

1. Profile before optimizing — know where time is spent
2. Write cache-friendly code — sequential access, spatial locality
3. Minimize branch mispredictions — use branchless code when possible
4. Align data structures to cache line boundaries
5. Use hardware performance counters for measurement
6. Consider NUMA effects in multi-socket systems

## Quick Reference

```
CPU Time = Instructions × CPI × Cycle Time
Amdahl's Law: Speedup = 1 / ((1-f) + f/s)
Pipeline: IF → ID → EX → MEM → WB
Cache Misses: Compulsory + Capacity + Conflict + Coherence
Virtual Addr → TLB → Page Table → Physical Addr
```
