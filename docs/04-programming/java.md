---
layout: default
title: Java
parent: Programming Languages
---

# Java

Java programming for interviews — collections, concurrency, JVM internals, and Java 8+ features.

## Introduction

Java is one of the most widely used languages in enterprise software development and a staple of technical interviews at FAANG companies. Its strong type system, rich collections framework, and widespread use in backend systems make it a frequent choice for interviewers.

Java interviews test not only algorithmic thinking but also your understanding of the language's internals — the Collections Framework, generics, concurrency model, memory management, and modern features like lambdas and streams.

## Key Concepts

### Collections Framework

```
Collection
├── List (ordered, duplicates allowed)
│   ├── ArrayList (array-based, O(1) get)
│   └── LinkedList (doubly-linked, O(1) insert)
├── Set (no duplicates)
│   ├── HashSet (O(1) operations, unordered)
│   ├── LinkedHashSet (insertion order)
│   └── TreeSet (O(log n), sorted)
├── Queue (FIFO)
│   ├── PriorityQueue (heap-based)
│   └── ArrayDeque (faster than Stack/LinkedList)
└── Map (key-value pairs)
    ├── HashMap (O(1) operations)
    ├── LinkedHashMap (insertion order)
    ├── TreeMap (O(log n), sorted)
    └── ConcurrentHashMap (thread-safe)
```

### Time Complexity

| Operation | ArrayList | LinkedList | HashMap | TreeMap |
|-----------|-----------|------------|---------|---------|
| get(i) | O(1) | O(n) | N/A | N/A |
| add | O(1)* | O(1) | O(1) | O(log n) |
| remove | O(n) | O(1)† | O(1) | O(log n) |
| contains | O(n) | O(n) | O(1) | O(log n) |

*amortized; †given reference to node*

### Java 8+ Features

**Lambdas:**
```java
// Before
list.sort(new Comparator<String>() {
    @Override
    public int compare(String a, String b) {
        return a.length() - b.length();
    }
});

// After (lambda)
list.sort((a, b) -> a.length() - b.length());

// After (method reference)
list.sort(Comparator.comparingInt(String::length));
```

**Streams:**
```java
List<String> names = employees.stream()
    .filter(e -> e.getSalary() > 50000)
    .map(Employee::getName)
    .sorted()
    .collect(Collectors.toList());
```

**Optional:**
```java
String result = Optional.ofNullable(user)
    .map(User::getEmail)
    .orElse("unknown@email.com");
```

### Threading and Concurrency

```java
// Thread creation
Thread t = new Thread(() -> {
    System.out.println("Running in thread");
});
t.start();

// ExecutorService
ExecutorService executor = Executors.newFixedThreadPool(4);
Future<String> future = executor.submit(() -> "Result");

// CompletableFuture (Java 8+)
CompletableFuture.supplyAsync(() -> fetchData())
    .thenApply(data -> process(data))
    .thenAccept(result -> System.out.println(result));

// synchronized block
synchronized (lock) {
    // critical section
}
```

### Memory Management

```
JVM Memory Areas:
├── Heap (shared)
│   ├── Young Generation (Eden + Survivors)
│   └── Old Generation (long-lived objects)
├── Metaspace (class metadata)
├── Stack (per thread, local variables)
├── Program Counter Register (per thread)
└── Native Method Stack (per thread)
```

**Garbage Collectors:**
- **G1 GC**: Default since Java 9, balanced latency/throughput
- **ZGC**: Ultra-low latency (< 10ms pauses)

## FAQ

**Q1: What is the difference between ArrayList and LinkedList?**
ArrayList uses a resizable array — O(1) random access, O(n) insertion. LinkedList uses doubly-linked nodes — O(1) insertion at known positions, O(n) access. ArrayList is almost always preferred.

**Q2: What is the difference between HashMap and Hashtable?**
HashMap is not synchronized (faster). Hashtable is synchronized (slower). Use ConcurrentHashMap for thread-safe maps. HashMap allows null keys/values; Hashtable doesn't.

**Q3: What is the difference between == and .equals()?**
`==` compares references. `.equals()` compares values/content. Override `.equals()` and `.hashCode()` together.

**Q4: What is the purpose of hashCode()?**
Used by hash-based collections for bucket placement. Equal objects must have equal hash codes.

**Q5: What is the difference between abstract class and interface?**
Abstract class can have constructors, instance variables, and both abstract and concrete methods. Interface (Java 8+) can have default and static methods but no instance state.

**Q6: What are generics and type erasure?**
Generics provide compile-time type safety. Type erasure removes generic type information at runtime. `List<String>` becomes `List` at runtime.

**Q7: What is the difference between fail-fast and fail-safe iterators?**
Fail-fast throw ConcurrentModificationException if modified during iteration. Fail-safe work on a copy without exceptions.

**Q8: What is a volatile variable?**
Ensures reads/writes go directly to main memory, guaranteeing visibility across threads. Does NOT guarantee atomicity.

**Q9: What is the difference between String, StringBuilder, and StringBuffer?**
String is immutable. StringBuilder is mutable, not thread-safe (fastest). StringBuffer is mutable, thread-safe (slower).

**Q10: What is the difference between Comparable and Comparator?**
Comparable defines natural ordering (implements `compareTo()` on the class). Comparator defines external custom ordering.

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Not overriding hashCode with equals | Always override both together |
| Using raw types | Use parameterized types (generics) |
| Catching generic Exception | Catch specific exceptions |
| Not using try-with-resources | Use try-with-resources for AutoCloseable |
| String concatenation in loops | Use StringBuilder |
| Mutable shared state without synchronization | Use ConcurrentHashMap |
| Ignoring NPE from autoboxing | Use Optional or null checks |

## Best Practices

1. Declare variables with interface types (`List<String>` not `ArrayList<String>`)
2. Handle null cases explicitly
3. Use `Optional` instead of returning null
4. Use `try-with-resources` for AutoCloseable objects
5. Use `StringBuilder` for string concatenation
6. Choose the right collection (ArrayList over LinkedList in most cases)
7. Use `ConcurrentHashMap` instead of synchronized maps
8. Prefer immutability (final fields, unmodifiable collections)

## Quick Reference

```
COLLECTIONS CHOICE:
  Random access      → ArrayList
  Key-value          → HashMap
  Sorted key-value   → TreeMap
  Unique elements    → HashSet
  Queue/Stack        → ArrayDeque
  Thread-safe map    → ConcurrentHashMap

JAVA 8+ FEATURES:
  Lambda:     (params) -> expression
  Method ref: ClassName::methodName
  Stream:     collection.stream().filter().map().collect()
  Optional:   Optional.ofNullable(value).orElse(default)
```
