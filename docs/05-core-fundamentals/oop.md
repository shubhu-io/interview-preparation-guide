---
layout: default
title: Object-Oriented Programming
parent: Core CS Fundamentals
---

# Object-Oriented Programming

OOP is a programming paradigm based on objects containing data (attributes) and code (methods). It organizes software design around objects rather than functions and logic.

## Key Concepts

| Concept | Description |
|---------|-------------|
| Encapsulation | Bundling data and methods, restricting direct access to components |
| Abstraction | Hiding complex implementation, showing only necessary features |
| Inheritance | Creating new classes from existing ones, promoting code reuse |
| Polymorphism | One interface, multiple implementations (overloading + overriding) |
| SOLID | Five design principles: SRP, OCP, LSP, ISP, DIP |
| Composition | Objects containing other objects ("has-a" relationship) |
| Design Pattern | Reusable solution to common design problems |

## Four Pillars of OOP

| Pillar | Definition | Example |
|--------|-----------|---------|
| Encapsulation | Data hiding via access modifiers | Private fields with getters/setters |
| Abstraction | Abstract classes/interfaces define contracts | Shape with abstract `area()` method |
| Inheritance | Child class inherits parent's properties | Dog extends Animal |
| Polymorphism | Same method name, different behavior | `draw()` for Circle vs Rectangle |

## SOLID Principles

| Principle | Rule |
|-----------|------|
| **S**ingle Responsibility | One class, one reason to change |
| **O**pen/Closed | Open for extension, closed for modification |
| **L**iskov Substitution | Subtypes must be substitutable for base types |
| **I**nterface Segregation | Many specific interfaces over one general |
| **D**ependency Inversion | Depend on abstractions, not concretions |

## Design Patterns Quick Reference

| Category | Patterns |
|----------|----------|
| Creational | Singleton, Factory, Abstract Factory, Builder, Prototype |
| Structural | Adapter, Decorator, Proxy, Facade, Composite |
| Behavioral | Observer, Strategy, Command, Iterator, Template, State |

## Composition vs Inheritance

| Aspect | Composition | Inheritance |
|--------|-------------|-------------|
| Relationship | "has-a" | "is-a" |
| Coupling | Loose | Tight |
| Flexibility | High (runtime) | Low (compile-time) |
| Testability | Easier | Harder |

## FAQ (Top 10)

**Q1: What is the difference between a class and an object?**
A class is a blueprint/template. An object is an instance of a class with actual values. Class = cookie cutter, object = cookie.

**Q2: What is the Liskov Substitution Principle?**
Objects of a superclass should be replaceable with objects of a subclass without breaking correctness. Example: Square extending Rectangle violates LSP when setWidth also changes height.

**Q3: What is the difference between overloading and overriding?**
Overloading: same name, different parameters, same class (compile-time). Overriding: same signature, subclass redefines parent method (runtime).

**Q4: What is the Strategy pattern?**
Defines a family of algorithms and makes them interchangeable. Encapsulates each algorithm in a separate class, allowing runtime switching.

**Q5: What is composition over inheritance?**
Prefer "has-a" over "is-a" relationships. Provides loose coupling, runtime flexibility, better testability, avoids fragile base class problem.

**Q6: What is the Factory pattern?**
Provides an interface for creating objects without specifying their exact class. Encapsulates object creation logic.

**Q7: What is Dependency Injection?**
An object receives its dependencies from external sources rather than creating them. Promotes loose coupling and easier testing.

**Q8: What is the difference between abstract class and interface?**
Abstract class: can have constructors, state, both abstract and concrete methods. Interface: traditionally only method signatures. Multiple interfaces allowed.

**Q9: What are access modifiers?**
public (everywhere), protected (class + subclasses + package), default (package only), private (class only).

**Q10: What is the Observer pattern?**
Defines a one-to-many dependency: when one object changes state, all dependents are notified automatically. Example: event systems, pub/sub.

## Common Mistakes

| Mistake | Solution |
|---------|----------|
| Tight coupling between classes | Use dependency injection and interfaces |
| God classes (too many responsibilities) | Apply Single Responsibility Principle |
| Overusing inheritance | Prefer composition over inheritance |
| Ignoring access modifiers | Always use appropriate encapsulation |
| Deep inheritance hierarchies | Keep hierarchies shallow (max 2-3 levels) |

## Best Practices

1. Program to an interface, not an implementation
2. Favor composition over inheritance
3. Encapsulate what varies
4. Keep classes small and focused
5. Use dependency injection for loose coupling
6. Apply SOLID principles consistently

## Quick Reference

```
Encapsulation: data + methods in one unit, access via public API
Abstraction: abstract class/interface defines contract
Inheritance: "is-a" relationship, code reuse
Polymorphism: compile-time (overloading) + runtime (overriding)
Singleton: one instance, global access
Factory: create objects without specifying class
Strategy: interchange algorithms at runtime
Observer: one-to-many notification
```
