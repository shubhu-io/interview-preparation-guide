---
layout: default
title: Digital Logic
parent: Core CS Fundamentals
---

# Digital Logic

Digital Logic is the foundation of computer engineering, dealing with representation and manipulation of discrete values using Boolean algebra, logic gates, and digital circuits.

## Key Concepts

| Concept | Description |
|---------|-------------|
| Boolean Algebra | Mathematical system for logical operations (AND, OR, NOT) |
| Karnaugh Map | Graphical method for simplifying Boolean expressions |
| Universal Gates | NAND and NOR can implement any Boolean function |
| Combinational Circuit | Output depends only on current inputs (no memory) |
| Sequential Circuit | Output depends on current inputs AND past state |
| Flip-Flop | Edge-triggered storage element; output changes on clock edge |
| FSM | Finite State Machine — systematic design for sequential circuits |

## Logic Gates

| Gate | Expression | Truth Table (00,01,10,11) |
|------|-----------|--------------------------|
| AND | A·B | 0, 0, 0, 1 |
| OR | A+B | 0, 1, 1, 1 |
| NOT | A' | 1, 0 |
| NAND | (A·B)' | 1, 1, 1, 0 |
| NOR | (A+B)' | 1, 0, 0, 0 |
| XOR | A⊕B | 0, 1, 1, 0 |

## Flip-Flop Types

| Type | Behavior |
|------|----------|
| SR | S=1,R=0 → set; S=0,R=1 → reset; S=R=1 → invalid |
| D | Qnext = D |
| JK | J=K=1 → toggle; J=K=0 → hold |
| T | T=1 → toggle; T=0 → hold |

## Combinational vs Sequential

| Feature | Combinational | Sequential |
|---------|--------------|------------|
| Memory | None | Flip-flops |
| Clock | Not required | Typically required |
| Examples | Adders, MUX, decoders | Counters, registers, FSMs |
| Analysis | Boolean algebra | State tables, timing |

## K-Map Rules

1. Group 1s in powers of 2 (1, 2, 4, 8, 16)
2. Groups must be rectangular
3. Groups can wrap around edges
4. Make groups as large as possible
5. Each group must contain at least one new 1
6. Use don't care conditions (X) to improve grouping

## FAQ (Top 10)

**Q1: What are universal gates and why important?**
NAND and NOR are universal — any Boolean function can be implemented using only one type. Important because manufacturing a single gate type reduces cost, and NAND is faster/smaller in CMOS.

**Q2: Simplify: A·B + A·B' + A'·B**
Factor: A·(B + B') + A'·B = A + A'·B = A + B (using absorption law).

**Q3: What is the difference between SOP and POS?**
SOP: sum (OR) of product (AND) terms. POS: product (AND) of sum (OR) terms. SOP implements based on when output is 1; POS when output is 0.

**Q4: What is a half adder vs full adder?**
Half adder adds two bits (Sum = A⊕B, Carry = A·B). Full adder adds three bits including carry-in. Full adder built from two half adders + OR gate.

**Q5: What is carry-lookahead adder?**
Computes carry bits in parallel using generate (G=A·B) and propagate (P=A⊕B) signals. O(log n) delay vs O(n) for ripple carry.

**Q6: What is the difference between a latch and flip-flop?**
Latch is level-triggered (output changes while enable active). Flip-flop is edge-triggered (output changes on clock edge only). Flip-flops preferred in synchronous designs.

**Q7: What is metastability?**
When a flip-flop can't resolve to 0 or 1 (setup/hold violation). Prevention: two-flop synchronizer, sufficient clock period.

**Q8: What is the difference between Mealy and Moore machines?**
Moore: output depends only on state. Mealy: output depends on state AND inputs. Mealy responds faster but may have glitches.

**Q9: How do you design a sequence detector?**
Draw state diagram with states for each partial match. Example for "101": S0→S01→S10→S101. Use D flip-flops and derive equations from state table.

**Q10: What is 2's complement?**
Method for negative binary numbers: invert all bits and add 1. Most common signed number representation.

## Common Mistakes

| Mistake | Solution |
|---------|----------|
| Incorrect 2's complement conversion | Invert bits and add 1 |
| Not considering K-map wrap-around | Check edge wrapping |
| Mixing up Mealy/Moore | Mealy = transitions; Moore = states |
| Ignoring timing constraints | Follow setup/hold times |

## Best Practices

1. Draw truth tables before writing Boolean expressions
2. Use K-maps for functions with ≤6 variables
3. Verify with all input combinations
4. Check for hazards (static and dynamic)
5. Use standard building blocks (MUX, adders)
6. Consider fan-in/fan-out limits

## Quick Reference

```
DeMorgan's: (A·B)' = A'+B'    (A+B)' = A'·B'
Full Adder: Sum = A⊕B⊕Cin     Cout = AB + Cin(A⊕B)
2:1 MUX: Out = S'I0 + S·I1
Timing: tsu (setup before clock), th (hold after clock), tpd (propagation delay)
```
