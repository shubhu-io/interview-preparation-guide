---
layout: default
title: Whiteboard Coding
parent: Coding
---

# Whiteboard Coding

{: .note }
Whiteboard coding tests your ability to think clearly, communicate visually, and write code without the aid of an IDE or compiler.

---

## Introduction

Whiteboard coding is an interview format where candidates solve programming problems by writing code, drawing diagrams, and explaining their approach on a physical or virtual whiteboard. It strips away IDE support, testing raw coding ability, communication, and problem-solving under observation.

Used in onsite interviews at FAANG, university campus placements, consulting firms, and increasingly via virtual whiteboard tools for remote interviews.

---

## Board Layout Strategy

```
+------------------------------------------+
|  Problem: [Title]                        |
|                                          |
|  +------+  +------+------+  +--------+  |
|  | Code |  |Diagram/Trace|  | Testing|  |
|  |      |  |             |  |        |  |
|  |      |  |             |  |        |  |
|  +------+  +------+------+  +--------+  |
|                                          |
|  Complexity: Time O(n), Space O(n)       |
+------------------------------------------+
```

**Key Principles:**
1. Divide the board into sections (approach, code, diagrams, testing)
2. Leave space between sections for clarity
3. Write large enough for the interviewer to read
4. Use consistent notation (arrows, boxes, circles)
5. Number your steps for easy reference

---

## Key Concepts

### Pseudocode Strategy

```
FUNCTION twoSum(nums, target):
    CREATE empty hash map "seen"
    FOR each index i, value num in nums:
        CALCULATE complement = target - num
        IF complement IN seen:
            RETURN [seen[complement], i]
        ADD num -> i to seen
    RETURN empty list
```

**When to use pseudocode:** Complex logic, uncertain syntax, explaining recursive algorithms, or when the interviewer asks for a high-level approach.

### Data Structure Diagrams

```
Array:       [2, 7, 11, 15]
              ↑  ↑
             i  j (two pointers)

Linked List: 1 -> 2 -> 3 -> NULL
               ↑
              head

Hash Map:    {2:0, 7:1}  (value:index)

Tree:         1
            / \
           2   3
          / \
         4   5
```

### Physical vs. Virtual Whiteboards

| Aspect | Physical | Virtual |
|--------|----------|---------|
| Writing | Handwriting | Mouse/keyboard |
| Erasing | Easy with eraser | Undo/redo |
| Diagrams | Freehand drawing | Templates and shapes |
| Sharing | In-person | Screen share |
| Practice | Buy a whiteboard | Miro, FigJam, Excalidraw |

---

## FAQ

### Q1: What should I write on the whiteboard first?
Problem name and key requirements at the top. Then your approach in 2-3 sentences. Then diagrams. Then code. This gives the interviewer a roadmap.

### Q2: Should I write pseudocode or actual code?
Start with pseudocode if the logic is complex, then fill in actual code. For simple problems, go directly to code.

### Q3: What if my handwriting is bad?
Practice writing clearly and largely. Use block letters. Write slowly enough to be legible. Use abbreviations for common words.

### Q4: How do I organize the whiteboard?
Divide into sections: top (problem), left (approach), center (code), right (diagrams), bottom (testing). Use boxes or lines to separate.

### Q5: What if I make a mistake?
Cross it out clearly and continue. Don't waste time erasing perfectly. Say "Let me correct this" and move on.

### Q6: Should I draw diagrams?
Yes! Diagrams help explain data structures and algorithms visually. Draw arrays, linked lists, trees, graphs, hash maps, and stacks when relevant.

### Q7: How do I explain while writing?
Talk through what you're writing: "I'm creating a function that takes an array and target..." Don't write in silence.

### Q8: What if I need more space?
Physical: ask for another board or move to a clean section. Virtual: scroll to create more space. Organize to maximize space.

### Q9: How do I trace through an example?
Draw the data structure, then use arrows or annotations to show each step. Write variable values at each step.

### Q10: How do I end a whiteboard session?
Summarize your solution. State the complexity. Mention optimizations. Ask if there are any questions.

---

## Common Mistakes

| Mistake | How to Avoid |
|---------|--------------|
| Poor organization | Divide board into sections |
| Illegible writing | Write large and clear |
| Not drawing diagrams | Always draw relevant diagrams |
| Silent writing | Think aloud constantly |
| Not enough space | Plan layout before writing |
| Erasing too much | Cross out and continue |
| Not testing | Trace through example on board |
| Rushing | Slow down, prioritize clarity |

---

## Best Practices

1. **Plan before writing** — Spend 30 seconds deciding layout
2. **Write large and clear** — Interviewer must read from a distance
3. **Use sections** — Divide the board logically
4. **Draw diagrams** — Visual representations clarify concepts
5. **Explain while writing** — Never write in silence
6. **Number your steps** — Makes it easy to reference
7. **Use pseudocode for complex parts** — Focus on logic over syntax
8. **Trace through examples** — Show the algorithm step by step
9. **Practice on a whiteboard** — Buy one and use it regularly
10. **Be adaptable** — Incorporate interviewer suggestions

---

## Quick Reference

```
BOARD LAYOUT
+------------------------------------------+
| Problem: [Title]                         |
|                                          |
| Approach:  | Code:          | Diagrams:  |
| [2-3 lines]| [clean code]  | [drawings] |
|                                           |
| Testing: [test cases]   Complexity: O(n)  |
+------------------------------------------+

WRITING TIPS
- Write large and clear
- Use block letters for readability
- Number your lines
- Leave space between sections

COMMUNICATION
- "Let me write the approach first..."
- "I'm creating a hash map to store..."
- "Let me trace through this example..."
- "The time complexity is O(...) because..."

WHEN STUCK
1. Draw the data structure
2. Trace through a small example
3. Think of similar problems
4. Ask the interviewer
```

---

## FAANG Interview Examples

| Company | Problem | Duration |
|---------|---------|----------|
| Google | Longest Substring Without Repeating | 45 min |
| Amazon | Number of Islands | 45 min |
| Meta | Valid Palindrome | 30 min |
| Apple | Reverse Linked List | 30 min |
| Microsoft | Merge K Sorted Lists | 60 min |

---

*Last Updated: July 2026*
