---
layout: default
title: VLSI Design
parent: Specialized Domains
---

# VLSI Design

## Introduction

Very Large Scale Integration (VLSI) design spans digital design (RTL), verification, synthesis, static timing analysis, physical design, and analog/mixed-signal. Roles include RTL Design Engineer, Verification Engineer, DFT Engineer, Physical Design Engineer, and Analog Design Engineer.

## What the Role Does

- Write RTL (Verilog/SystemVerilog) for digital blocks.
- Verify designs using UVM testbenches, assertions, and coverage.
- Run synthesis, STA, CDC/LINT checks, and power analysis.
- Perform floorplanning, placement, routing, and signoff (physical design).
- Design analog blocks: PLLs, ADCs, DACs, bandgaps, LDOs.

## Hiring Companies

Intel, Qualcomm, AMD, Nvidia, TI, Micron, Broadcom, Samsung, MediaTek, STMicro, Infineon, NXP, Synopsys, Cadence, Arm, and Indian companies: InCore, MosChip, eInfochips, Tessolve, Vervesemi, Cientra, Sankalp.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| Digital Logic | Boolean algebra, combinational/sequential logic, FSM design ([Digital Logic](../../38-Digital-Logic/)) |
| Verilog/SystemVerilog | RTL coding, testbench, interfaces, assertions |
| CMOS Fundamentals | Transistor operation, inverter, NAND/NOR, noise margins, power |
| Timing | Setup/hold time, clock skew, metastability, CDC, STA |
| Synthesis | RTL-to-gate, constraints (SDC), area/timing trade-offs |
| Verification | UVM, functional coverage, constrained-random testing |
| DFT | Scan insertion, BIST, ATPG, boundary scan |
| Physical Design | Floorplan, placement, CTS, routing, DRC/LVS |
| Low Power | Clock gating, power gating, voltage scaling, UPF |
| Scripting | Tcl, Python, Perl for automation |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Digital logic + CMOS fundamentals, Verilog basics
Weeks 3-4:   FSM design + RTL coding practice (counters, shift registers, FIFOs)
Weeks 5-6:   Synthesis + STA + timing concepts, SDC constraints
Weeks 7-8:   UVM verification + coverage-driven testing
Weeks 9-10:  Physical design flow + DFT + low-power concepts
Weeks 11-12: Mock domain rounds + company-specific question banks
```

## Sample Interview Questions

- Explain setup time and hold time. How do you fix a setup violation? (reduce combinational delay, retiming, lower clock frequency)
- What is clock domain crossing (CDC)? How do you safely cross domains? (2-FF synchronizer, FIFO, handshake)
- Design a synchronous FIFO / a sequence detector using FSM.
- What is the difference between blocking and non-blocking assignments?
- Explain the UVM architecture and the role of the sequencer.
- What is scan-based testing and why is DFT important?
- What are the challenges in physical design at lower technology nodes?

## Projects for Portfolio

- Design and verify a RISC-V or simple processor core on an FPGA.
- Build a UVM testbench for an AXI/UART/IP block.
- Implement a FIFO or FFT block, synthesize it, and run STA.
- Create a clock-domain-crossing safe module and prove correctness with assertions.

## Tools to Learn

- RTL simulation: Verilator, ModelSim, QuestaSim, Xcelium
- Synthesis: Yosys (free), Design Compiler (industry)
- FPGA: Vivado, Quartus, Intel/Altera
- Board: any FPGA dev kit (e.g., Digilent Basys, Pynq)

## Key Links

- Digital Logic folder: [38-Digital-Logic](../../38-Digital-Logic/)
- Computer Architecture folder: [39-Computer-Architecture](../../39-Computer-Architecture/)
- Verilog free learning: ChipVerify, HDLBits, NPTEL VLSI courses
- Companies: [Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Knowing Verilog syntax but not the synthesized hardware behind it.
2. Not understanding what real hardware each RTL line implies.
3. Ignoring timing/STA questions — they appear in almost every VLSI round.
4. Memorizing UVM classes without being able to explain the flow.
5. Not knowing your own FPGA/board projects in depth.
