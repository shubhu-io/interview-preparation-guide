---
layout: default
title: System-on-Chip (SoC) Design
parent: Specialized Domains
---

# System-on-Chip (SoC) Design

## Introduction

SoC design integrates processing cores, memory, interconnects, and peripherals onto a single chip. It sits between RTL design and full chip architecture: SoC Architects define the block diagram, SoC Design Engineers integrate and validate IP, and teams handle interconnects, memory hierarchy, low-power, clocking/reset, and boot flows. Roles: SoC Architect, SoC Design Engineer, SoC Verification Engineer, Performance Architect.

## What the Role Does

- Define SoC architecture: cores, accelerators, memory map, peripherals.
- Integrate third-party and internal IP blocks (CPU, GPU, DSP, memory controllers).
- Own interconnect topology: AXI/AHB buses, NoCs, coherency.
- Develop clocking, reset, and power-domain architecture.
- Model and optimize performance, bandwidth, and power.
- Drive SoC-level verification and debug.

## Hiring Companies

Qualcomm, Apple, AMD, Intel, Nvidia, Samsung, MediaTek, Broadcom, Synopsys, Arm, Marvell, and India: Arm India, Qualcomm India, Intel India, AMD India, Synopsys India, InCore, Cientra, Tessolve, MosChip.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| Computer Architecture | Pipelines, caches, memory hierarchy, superscalar ([39-Computer-Architecture](../../39-Computer-Architecture/)) |
| Interconnects | AXI/AHB/APB protocols, Network-on-Chip (NoC), coherency protocols |
| Cache Coherency | MOESI/MESI, snooping vs directory, cache-coherent interconnects |
| Memory Hierarchy | L1/L2/L3, DRAM controllers, memory maps, bandwidth |
| Clocking & Reset | PLL/clock trees, clock domains, reset synchronization |
| Low-Power Design | Power domains, DVFS, power gating, UPF/CPF |
| Boot Flow | ROM, bootloaders, security (secure boot, TRNG) |
| IP Integration | Pin/level interfaces, integration checks (LINT, CDC) |
| Performance Modeling | Cycle-approximate models, profiling, bottleneck analysis |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Computer architecture fundamentals, pipelining, caches
Weeks 3-4:   AXI/AHB protocol details, memory-mapped interfaces
Weeks 5-6:   Cache coherency, MESI, interconnect design
Weeks 7-8:   Clocking, reset, power domains, low-power techniques
Weeks 9-10:  SoC integration, boot flow, security
Weeks 11-12: Mock SoC design rounds + performance model practice
```

## Sample Interview Questions

- How does a cache-coherent interconnect work? Explain MESI protocol.
- Design the memory map for an SoC with CPU, GPU, and peripherals.
- What is the difference between AXI and AHB? When would you use a NoC over a bus?
- Explain DVFS and how voltage/frequency scaling affects power and performance.
- How would you verify that all clock-domain crossings in an SoC are safe?
- Walk through the boot sequence of a SoC from power-on to application.
- How do you debug a performance bottleneck between CPU and memory?

## Projects for Portfolio

- Integrate a soft-core CPU (e.g., RISC-V on FPGA) with memory and peripherals on an AXI bus.
- Build a cycle-accurate memory subsystem model and analyze bandwidth.
- Design and implement a cache-coherent system (MESI) in simulation.
- Create an SoC block diagram + power/clock plan for a hypothetical chip and document trade-offs.

## Tools to Learn

- RTL: SystemVerilog, Verilator, Xcelium/QuestaSim
- FPGA: Vivado (AXI IP Integrator is a great hands-on SoC tool)
- Arch modeling: gem5, SystemC/TLM
- Verification: UVM, assertions (SVA)

## Key Links

- Computer Architecture: [39-Computer-Architecture](../../39-Computer-Architecture/)
- Digital Logic: [38-Digital-Logic](../../38-Digital-Logic/)
- VLSI guide: [VLSI Design](vlsi-design)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Knowing protocols but not why the architecture uses them.
2. Not understanding cache coherency trade-offs (snooping vs directory).
3. Ignoring power/thermal constraints in architecture answers.
4. Being unable to explain a boot flow end-to-end.
5. Confusing SoC architecture with RTL design — they want the system view.
