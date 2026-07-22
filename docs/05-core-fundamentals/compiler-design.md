---
layout: default
title: Compiler Design
parent: Core CS Fundamentals
---

# Compiler Design

Compiler Design is the theory and practice of translating source code from high-level programming languages into machine-executable instructions, covering lexical analysis, parsing, semantic analysis, optimization, and code generation.

## Key Concepts

| Concept | Description |
|---------|-------------|
| Lexical Analysis | Breaks source code into tokens (keywords, identifiers, operators) |
| Syntax Analysis | Checks grammatical structure, builds parse tree |
| Semantic Analysis | Verifies meaning, types, and scope rules |
| AST | Abstract Syntax Tree — simplified parse tree capturing semantic meaning |
| FIRST/FOLLOW | Sets used to construct LL(1) parsing tables |
| Three-Address Code | IR with at most three operands per instruction |
| Register Allocation | Assigns CPU registers to variables; NP-complete (graph coloring) |

## Compiler Phases

```
Source → [Lexer] → Tokens → [Parser] → AST → [Semantic] → Annotated AST
  → [IR Gen] → 3-Address Code → [Optimizer] → Optimized IR → [CodeGen] → Machine Code
```

## Grammar Types (Chomsky Hierarchy)

| Type | Grammar | Used For |
|------|---------|----------|
| Type 0 | Unrestricted | Turing machines |
| Type 1 | Context-sensitive | Natural languages |
| Type 2 | Context-free | Programming languages |
| Type 3 | Regular | Tokens/lexical analysis |

## Parsing Comparison

| Method | Direction | Examples | Power |
|--------|-----------|----------|-------|
| Top-Down | Root → leaves | LL(1), Recursive Descent | Fewer grammars |
| Bottom-Up | Leaves → root | LR(0), SLR(1), LALR(1), CLR(1) | More grammars |

## Optimization Techniques

| Type | Examples |
|------|----------|
| Local | Constant folding (3+4→7), dead code elimination, common subexpression |
| Loop | Invariant code motion, loop unrolling, strength reduction |
| Global | Copy propagation, tail call optimization, inlining |

## FAQ (Top 10)

**Q1: What is the difference between DFA and NFA?**
DFA: one transition per symbol per state, no ε-moves, O(n) execution. NFA: multiple transitions, ε-moves, easier to construct. Every NFA converts to equivalent DFA.

**Q2: How do you eliminate left recursion?**
Transform `A → Aα | β` to `A → βA'` and `A' → αA' | ε`. Required for LL(1) parsers.

**Q3: What is the difference between LL(1) and LR(1) parsing?**
LL(1): top-down, leftmost derivation, one lookahead. LR(1): bottom-up, rightmost in reverse, handles broader class of grammars.

**Q4: What is FIRST set?**
Set of terminals that can begin any string derived from a grammar symbol. Used in LL(1) parsing table construction.

**Q5: What is three-address code?**
Intermediate representation where each instruction has at most three operands (two sources, one destination): `x = y op z`.

**Q6: What is register allocation?**
Assigning CPU registers to variables during code generation. Algorithms: Chaitin's (graph coloring), linear scan (faster, less optimal).

**Q7: What is garbage collection?**
Automatic memory management reclaiming unreachable objects. Approaches: reference counting, mark-and-sweep, copying, generational, concurrent.

**Q8: What is constant folding?**
Compile-time evaluation of constant expressions: `3 + 4` → `7`.

**Q9: What is an AST vs CST?**
CST preserves all grammatical details. AST is simplified, capturing only semantic meaning. AST preferred for analysis and code generation.

**Q10: What is shift-reduce conflict?**
Parser can't decide between shifting the next token or reducing a rule. Caused by grammar ambiguity. Resolution: precedence rules, grammar modification.

## Common Mistakes

| Mistake | Problem | Solution |
|---------|---------|----------|
| Ambiguous grammars | Multiple parse trees | Rewrite using precedence/associativity |
| Left recursion in LL grammars | Infinite recursion | Eliminate using transformation |
| Matching keywords as identifiers | Keywords not recognized | Check keyword table first |
| Not building proper AST | Hard for later phases | Design AST to match language semantics |

## Best Practices

1. Modular design — separate phases into distinct modules
2. Use visitor pattern for AST traversal
3. Implement error recovery — don't stop at first error
4. Test each phase independently
5. Use parser generators (ANTLR, Bison) for complex grammars
6. Document grammar using EBNF notation

## Quick Reference

```
RegEx: a|b, ab, a*, a+, a?, [abc], [^abc]
FIRST(X): terminals that can begin strings from X
FOLLOW(X): terminals that can appear after X
LL(1) Table: A → α if a ∈ FIRST(α) or (ε ∈ FIRST(α) and a ∈ FOLLOW(A))
Three-Address: x = y op z | x = op y | goto L | if x goto L
```
