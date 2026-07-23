---
layout: default
title: Puzzle Solving
parent: Aptitude & Reasoning
nav_order: 9
---

# Puzzle Solving for Interviews

{: .note }
Puzzle solving tests your analytical thinking, creativity, and problem-solving approach under pressure.

## Introduction

Puzzle solving in interviews refers to brain teasers, logic puzzles, and mathematical challenges that test your analytical thinking, creativity, and problem-solving approach under pressure. Unlike coding problems, puzzles often require lateral thinking and pattern recognition.

**Why It Matters:**
- Used in consulting, investment banking, and tech interviews
- Tests raw thinking ability and creativity
- Shows how you approach unfamiliar problems
- Differentiates analytical thinkers from rote learners

## Puzzle-Solving Framework

**Step 1: Understand the Puzzle**
- Read carefully — every detail matters
- Identify what you know and what you need to find
- Restate the puzzle in your own words
- Ask clarifying questions if ambiguous

**Step 2: Simplify**
- Try a smaller version of the problem
- Solve for n=2, n=3 before tackling general case
- Remove constraints one by one to build understanding

**Step 3: Identify Patterns**
- Look for patterns in smaller cases
- Consider mathematical relationships
- Think about symmetry and invariants

**Step 4: Work Backwards**
- Start from the desired outcome
- Trace back what conditions must be true
- Identify the minimum steps needed

**Step 5: Consider Extreme Cases**
- What happens with 0 items? 1 item? 2 items?
- Edge cases often reveal the pattern

**Step 6: Verify Your Solution**
- Test with small examples
- Check that solution satisfies all constraints

## Classic Puzzles

### Weighing Puzzles
**Problem:** 12 balls, one is heavier or lighter. Find odd ball in 3 weighings.

**Key Insight:** Each weighing has 3 outcomes → 3³ = 27 possibilities cover 24 (12 balls × 2 states).

### River Crossing Puzzles
**Problem:** Farmer, wolf, goat, cabbage. Boat carries only one item. Wolf eats goat, goat eats cabbage if left alone.

**Solution:** Handle the goat first (it conflicts with both), then manage conflicts.

### Hat Puzzles
**Problem:** Three prisoners wear hats. Each can see others' hats but not their own. Guess hat color without communicating.

**Key Insight:** Use logic and information from others' guesses.

## Mathematical Puzzles

### Probability Puzzles
**Monty Hall Problem:** Pick one of 3 doors. Host opens goat door. Should you switch?
**Answer:** Yes, always switch (2/3 probability vs 1/3).

**Birthday Paradox:** In a room of 23 people, probability two share a birthday?
**Answer:** About 50.7% (counterintuitive).

### Number Theory Puzzles
- Clock hands overlap 11 times in 12 hours (not 12)
- 111,111,111 × 111,111,111 = 12,345,678,987,654,321

### Combinatorics Puzzles
- 8 queens on 8×8 chessboard: 92 solutions (12 unique)

## Lateral Thinking Puzzles

**Example:** A man pushes his car to a hotel and loses his fortune.
**Answer:** He's playing Monopoly.

**Key approaches:**
1. Challenge assumptions — "car" might not mean a real car
2. Consider context — what scenario makes this make sense?
3. Think about word meanings — multiple interpretations

## Interview-Specific Puzzles

### Estimation Questions (Fermi Problems)

**"How many piano tuners are in Chicago?"**
1. Chicago population: ~3 million
2. Households: ~1 million
3. Pianos per household: ~1 in 20 → 50,000 pianos
4. Tunings per year: ~2 → 100,000 tunings
5. Tunings per tuner per year: ~1,000
6. Piano tuners needed: ~100

### Strategy Puzzles

**"25 horses, 5 race tracks. Minimum races to find top 3?"**
**Answer:** 7 races. Race 5 groups, then winners, then remaining candidates.

## Puzzle-Solving Patterns

| Pattern | Description | Example |
|---------|------------|---------|
| Parity | Even/odd considerations | Light switch puzzles |
| Invariance | What stays the same | Tower of Hanoi |
| Pigeonhole | More items than containers | Birthday paradox |
| Modular arithmetic | Clock arithmetic | Day of week problems |
| Recursion | Smaller subproblems | Fibonacci |
| Binary search | Halving search space | Guessing numbers |
| Contradiction | Assume opposite, find contradiction | Proof puzzles |

## Key Concepts

| Concept | Description | Application |
|---------|------------|-------------|
| Pattern Recognition | Identifying recurring structures | All puzzles |
| Lateral Thinking | Approaching from unexpected angles | Creative puzzles |
| Logical Deduction | Drawing conclusions from premises | Logic puzzles |
| Mathematical Reasoning | Using math to solve | Number puzzles |
| Working Backwards | Starting from the answer | Strategy puzzles |
| Simplification | Solving smaller versions first | Complex puzzles |
| Assumption Challenging | Questioning implicit assumptions | Lateral puzzles |
| Estimation | Approximating with reasonable assumptions | Fermi problems |

## Best Practices

1. **Read the puzzle carefully** — Every word matters
2. **Restate the puzzle** — Confirm your understanding
3. **Start with small cases** — Solve for n=2, n=3 to find patterns
4. **Think aloud** — Explain your approach, even if uncertain
5. **Look for patterns** — Mathematical, logical, or structural
6. **Work backwards** — Start from the answer and trace back
7. **Consider extreme cases** — 0, 1, or very large numbers
8. **Challenge assumptions** — Question what you take for granted
9. **Ask clarifying questions** — Don't make unnecessary assumptions
10. **Verify your answer** — Test with examples and edge cases

## Common Mistakes to Avoid

| Mistake | Impact | Solution |
|---------|--------|----------|
| Rushing to answer | Giving wrong answer | Take 1-2 minutes to think first |
| Not communicating | Interviewer can't see thinking | Verbalize thought process |
| Giving up too quickly | Shows lack of persistence | Try at least one approach |
| Ignoring details | Missing key information | Read carefully, note every detail |
| Not testing solution | Assuming answer is correct | Verify with small examples |
| Overthinking | Making it more complex | Start with simplest approach |

## Quick Reference

### Framework
1. Understand — read carefully, restate
2. Simplify — try small cases
3. Pattern — look for recurring structures
4. Work backwards — start from the answer
5. Verify — test with examples

### Common Patterns
- Parity: Even/odd considerations
- Pigeonhole: More items than containers
- Invariance: What stays the same
- Binary search: Halving the search space
- Recursion: Smaller subproblems

### When Stuck
1. Try a smaller version of the problem
2. Work backwards from the answer
3. Consider extreme cases (0, 1, very large)
4. Challenge your assumptions
5. Ask for a hint after 2-3 minutes

---

**Next:** [Psychometric Test]({{ site.baseurl }}/aptitude/psychometric-test) - Personality and cognitive assessments
