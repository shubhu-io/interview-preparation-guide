---
layout: default
title: Machine Coding
parent: Coding
---

# Machine Coding

{: .note }
Machine coding bridges the gap between system design (architecture) and coding (implementation), testing both simultaneously.

---

## Introduction

Machine coding (also called "low-level design" or "LLD") is an interview format where candidates design and implement a complete, working system or component within a limited time (typically 45-90 minutes). Unlike algorithm problems that focus on isolated functions, machine coding tests your ability to design classes, define APIs, handle state, and write production-quality code.

Used by FAANG companies, product companies (Flipkart, Uber, Netflix), and startups for mid-to-senior level roles.

---

## Interview Timeline (60 min)

| Phase | Time | Activity |
|-------|------|----------|
| Requirements | 0-10 min | Clarify requirements, list features |
| Design | 10-20 min | Class diagrams, API design, relationships |
| Implementation | 20-50 min | Core classes → features → edge cases |
| Testing | 50-55 min | Test with examples |
| Discussion | 55-60 min | Trade-offs, improvements |

---

## Key Concepts

### SOLID Principles

| Principle | Description | Example |
|-----------|------------|---------|
| **S**ingle Responsibility | Each class has one job | ParkingLot manages spots, Ticket manages payment |
| **O**pen/Closed | Open for extension, closed for modification | Use interfaces for different payment methods |
| **L**iskov Substitution | Subtypes must be substitutable | Any Vehicle can be parked in any Spot |
| **I**nterface Segregation | Many specific interfaces over general ones | IParkable, IPayable separately |
| **D**ependency Inversion | Depend on abstractions, not concretions | ParkingLot depends on ISpot interface |

### Design Patterns

| Pattern | Use Case | Example |
|---------|---------|---------|
| **Singleton** | Single instance | ParkingLot (one instance) |
| **Strategy** | Swappable algorithms | Different payment strategies |
| **Observer** | Event notification | Notify display on spot change |
| **Factory** | Object creation | Create different vehicle types |
| **State** | State-dependent behavior | Elevator states (moving, stopped) |

### Common Problems

| Problem | Key Classes | Difficulty |
|---------|------------|------------|
| Parking Lot | ParkingLot, Floor, Spot, Vehicle, Ticket | Medium |
| Elevator System | Elevator, Controller, Request, Direction | Hard |
| Vending Machine | VendingMachine, Product, Inventory, State | Medium |
| Tic-Tac-Toe | Board, Player, Game, Move | Easy |
| Chess | Board, Piece, Player, Game, Rules | Hard |

### Composition vs. Inheritance

- **Composition** ("has-a"): Car has an Engine — more flexible, preferred
- **Inheritance** ("is-a"): ElectricCar is a Car — use sparingly
- Prefer composition for most relationships

---

## FAQ

### Q1: How is machine coding different from system design?
System design focuses on high-level architecture (databases, APIs, scalability). Machine coding focuses on implementing specific components with actual code. More concrete, more implementation.

### Q2: What programming language should I use?
OOP languages preferred: Java, Python, C#, C++. Python for speed; Java/C# for structure. Use what you're most comfortable with.

### Q3: Do I need to write perfect code?
No, but it should be working, readable, and demonstrate good design. Clean, well-structured code is more important than optimal performance.

### Q4: How do I start?
(1) Clarify requirements. (2) Identify core classes. (3) Design relationships. (4) Define APIs. (5) Implement. (6) Test.

### Q5: What if I can't finish the entire implementation?
Prioritize core features. Implement the most important ones fully. State what you'd add with more time.

### Q6: How important is error handling?
Very. Handle invalid operations gracefully (e.g., parking a car in a full lot). Use exceptions or return error codes.

### Q7: Should I use design patterns?
Yes, when appropriate. Strategy (payment), Singleton (single instance), Observer (notifications), Factory (creation). Don't over-engineer.

### Q8: How do I handle state in an Elevator system?
Use the State pattern. Define states: Idle, MovingUp, MovingDown, DoorOpen. Each state handles requests differently.

### Q9: What if the interviewer asks for an unplanned feature?
Acknowledge the requirement, discuss how it fits, and implement it. Flexibility is valued.

### Q10: How do I handle concurrency?
For basic machine coding, usually not required. If asked, discuss thread safety: locks, synchronized blocks, immutable objects.

---

## Common Mistakes

| Mistake | How to Avoid |
|---------|--------------|
| Jumping into code | Spend 10-15 min on design first |
| Ignoring requirements | Ask questions before starting |
| Over-engineering | Start simple, add features incrementally |
| Poor API design | Use clear, descriptive method names |
| No error handling | Handle edge cases and invalid operations |
| Ignoring SOLID | Follow single responsibility principle |
| Not testing | Test with examples after implementing |
| Poor time management | Allocate time for each phase |

---

## Best Practices

1. **Clarify requirements first** — Ask what features are needed
2. **Design before coding** — 10-15 min on class diagrams and APIs
3. **Start simple** — Core features first, then complexity
4. **Follow SOLID principles** — Single responsibility, open/closed
5. **Use composition over inheritance** — More flexible
6. **Handle errors gracefully** — Clear feedback for invalid operations
7. **Meaningful names** — Classes, methods, variables self-documenting
8. **Manage state properly** — Use State pattern for complex transitions
9. **Test as you go** — Verify each feature before moving on
10. **Discuss trade-offs** — Explain why you chose one approach

---

## Quick Reference

```
SOLID PRINCIPLES
S - Single Responsibility (one class = one job)
O - Open/Closed (extend, don't modify)
L - Liskov Substitution (subtypes are substitutable)
I - Interface Segregation (many small interfaces)
D - Dependency Inversion (depend on abstractions)

CLASS DESIGN CHECKLIST
[ ] Identify core entities
[ ] Define responsibilities
[ ] Map relationships (has-a, is-a)
[ ] Design public APIs
[ ] Handle edge cases
[ ] Apply SOLID principles
[ ] Use appropriate design patterns

SUCCESS FORMULA
Machine Coding = Design Thinking + Clean Code + SOLID + Error Handling
```

---

## FAANG Interview Examples

| Company | Problem | Difficulty | Time |
|---------|---------|------------|------|
| Amazon | Design a Parking Lot | Medium | 60 min |
| Google | Design an Elevator System | Hard | 90 min |
| Meta | Design a Chat Application | Medium | 60 min |
| Apple | Design a Vending Machine | Medium | 60 min |
| Microsoft | Design a Chess Game | Hard | 90 min |

---

*Last Updated: July 2026*
