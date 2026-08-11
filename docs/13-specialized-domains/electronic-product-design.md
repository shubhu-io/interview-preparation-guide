---
layout: default
title: Electronic Product Design
parent: Specialized Domains
---

# Electronic Product Design

## Introduction

Electronic Product Design covers the entire journey from concept to manufacturable hardware: system architecture, schematic capture, PCB layout, component selection, power design, signal integrity, EMI/EMC compliance, thermal management, and DFM/DFT. Roles include Hardware Engineer, PCB Design Engineer, Product Design Engineer, and Power Electronics Engineer.

## What the Role Does

- Convert product requirements into a hardware architecture and block diagram.
- Design schematics and multi-layer PCB layouts (Altium, KiCad, Cadence Allegro).
- Select components: MCUs, power ICs, sensors, connectors — with cost/lead-time analysis.
- Design power delivery: LDOs, buck/boost converters, protection circuits.
- Validate prototypes: bring-up, testing, debugging with oscilloscopes and logic analyzers.
- Ensure compliance: EMI/EMC, safety (IEC/UL), and thermal requirements.
- Optimize for manufacturing (DFM/DFT) and reliability.

## Hiring Companies

Texas Instruments, Bosch, Siemens, Honeywell, STMicro, NXP, Infineon, and India: Tata Elxsi, VVDN, Centum, Cyient, L&T Technology Services, KPIT, eInfochips, MosChip, and product startups.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| Analog Electronics | Op-amps, transistors, filters, regulators ([Digital Logic](../../38-Digital-Logic/) as foundation) |
| Power Electronics | Buck/boost converters, LDOs, efficiency, thermal design |
| PCB Design | Stack-up, impedance, routing, ground planes, decoupling |
| Signal Integrity | Transmission lines, reflections, crosstalk, EMI/EMC basics |
| Microcontrollers | GPIO, ADC, PWM, peripherals, boot options |
| Components | Resistors/caps selection, derating, BOM management |
| Standards | IEC 61000 (EMC), UL/safety, IPC design standards |
| Test & Measurement | Oscilloscope, multimeter, logic analyzer, thermal camera |
| DFM/DFT | Design for manufacturing and test, panelization |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Analog + digital electronics fundamentals refresh
Weeks 3-4:   Power design (buck/boost, LDO), component selection
Weeks 5-6:   PCB design basics: stack-up, decoupling, grounding, SI
Weeks 7-8:   EMI/EMC, thermal, compliance standards
Weeks 9-10:  Build a full product: schematic + PCB + bring-up
Weeks 11-12: Mock design reviews + company-specific prep
```

## Sample Interview Questions

- How do you choose decoupling capacitors for an MCU power rail?
- Design a power supply for a 12V input to 3.3V output at 2A. What topology do you choose and why?
- What is the difference between a ground plane and a star ground?
- How do you reduce EMI in a product? (shielding, filtering, layout, slew-rate control)
- What considerations go into choosing an MCU for a battery-powered IoT device?
- Explain the PCB design flow from schematic to manufacturing.
- How would you debug a board that powers up but doesn't boot?

## Projects for Portfolio

- Design and build a complete IoT node: MCU + sensors + BLE + battery power.
- Design a buck converter and validate efficiency/ripple on the bench.
- Create a 4-layer PCB with controlled impedance for an MCU + SDIO/WiFi design.
- Build a bench power supply or a sensor-logging device end-to-end.

## Tools to Learn

- Schematic/PCB: KiCad (free), Altium, Cadence Allegro, Eagle
- Simulation: LTspice, SPICE, Ansys SIwave (advanced)
- Bench tools: oscilloscope, logic analyzer, multimeter, soldering station
- Version control: Git for ECAD (KiCad/Altium 365)

## Key Links

- Digital Logic: [38-Digital-Logic](../../38-Digital-Logic/)
- Computer Architecture: [39-Computer-Architecture](../../39-Computer-Architecture/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Skipping component derating and thermal analysis.
2. Ignoring decoupling and ground-plane basics — the #1 cause of field failures.
3. Not knowing the product test/validation plan.
4. Designing without cost, lead-time, and manufacturing constraints.
5. Being unable to debug a board methodically (power → clock → reset → IO).
