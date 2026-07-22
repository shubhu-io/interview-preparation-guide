---
layout: default
title: C++
parent: Programming Languages
---

# C++

C++ programming for interviews — STL, smart pointers, move semantics, and RAII.

## Introduction

C++ is a powerful systems programming language widely used in competitive programming, game development, high-performance computing, and interview coding. Its combination of low-level control and high-level abstractions makes it a favorite for companies that need maximum performance.

C++ interviews test your understanding of memory management, pointers, the Standard Template Library (STL), object-oriented design, templates, and modern C++ features.

## Key Concepts

### STL Containers

| Container | Access | Insert/Delete | Underlying | Use When |
|-----------|--------|---------------|------------|----------|
| vector | O(1) | O(1)*/O(n) | Dynamic array | Random access |
| deque | O(1) | O(1) ends | Segmented array | Frequent insert at both ends |
| list | O(n) | O(1) | Doubly linked list | Frequent insert/delete anywhere |
| map | O(log n) | O(log n) | Red-black tree | Sorted key-value |
| set | O(log n) | O(log n) | Red-black tree | Sorted unique elements |
| unordered_map | O(1) avg | O(1) avg | Hash table | Fast key-value lookup |
| unordered_set | O(1) avg | O(1) avg | Hash table | Fast membership test |
| stack | Top only | O(1) | deque/vector | LIFO |
| queue | Front/back | O(1) | deque | FIFO |
| priority_queue | Top only | O(log n) | Heap | Min/max extraction |

### Smart Pointers

```cpp
#include <memory>

// unique_ptr: Exclusive ownership (preferred)
auto p1 = std::make_unique<MyClass>(args);
auto p2 = std::move(p1);  // Transfer ownership

// shared_ptr: Shared ownership (reference counted)
auto p3 = std::make_shared<MyClass>(args);
auto p4 = p3;  // Reference count = 2

// weak_ptr: Non-owning reference (breaks cycles)
std::weak_ptr<MyClass> wp = p3;
if (auto sp = wp.lock()) {
    // Use sp if object still exists
}
```

### Move Semantics

```cpp
class Buffer {
    int* data;
    size_t size;
public:
    // Move constructor
    Buffer(Buffer&& other) noexcept
        : data(other.data), size(other.size) {
        other.data = nullptr;
        other.size = 0;
    }
    
    // Move assignment
    Buffer& operator=(Buffer&& other) noexcept {
        if (this != &other) {
            delete[] data;
            data = other.data;
            size = other.size;
            other.data = nullptr;
            other.size = 0;
        }
        return *this;
    }
};
```

### RAII (Resource Acquisition Is Initialization)

```cpp
// Resources are tied to object lifetimes
{
    std::ifstream file("data.txt");  // Acquire resource
    std::string line;
    std::getline(file, line);
}   // Destructor automatically releases resource

// Mutex lock RAII
{
    std::lock_guard<std::mutex> lock(mtx);
    // Critical section
}   // Lock automatically released
```

### Lambda Expressions

```cpp
// Basic lambda
auto add = [](int a, int b) { return a + b; };

// With capture
int factor = 10;
auto multiply = [factor](int x) { return x * factor; };  // By value
auto increment = [&factor](int x) { factor++; return x + factor; };  // By reference

// Used with STL algorithms
std::vector<int> v = {5, 3, 1, 4, 2};
std::sort(v.begin(), v.end(), [](int a, int b) { return a > b; });
```

### Templates

```cpp
// Function template
template <typename T>
T max_val(T a, T b) {
    return (a > b) ? a : b;
}

// Class template
template <typename T, size_t N>
class Array {
    T data[N];
public:
    T& operator[](size_t i) { return data[i]; }
    constexpr size_t size() const { return N; }
};
```

## FAQ

**Q1: What is the difference between a pointer and a reference?**
A pointer is a variable that holds a memory address and can be null, reassigned, or used with pointer arithmetic. A reference is an alias for an existing variable that cannot be null or reseated.

**Q2: What is RAII?**
Resource Acquisition Is Initialization — a C++ idiom where resource management is tied to object lifetimes via constructors/destructors. Guarantees cleanup via stack unwinding.

**Q3: What is the difference between `new`/`delete` and smart pointers?**
`new`/`delete` require manual memory management. Smart pointers automate this: `unique_ptr` for exclusive ownership, `shared_ptr` for shared ownership. Always prefer smart pointers.

**Q4: What is move semantics?**
Allows transferring resources from one object to another instead of copying. Move constructor/assignment take rvalue references (`&&`), enabling efficient transfers.

**Q5: What is the Rule of Five?**
If you define any of: destructor, copy constructor, copy assignment, move constructor, move assignment — define all five to properly manage resources.

**Q6: What is the difference between `vector` and `array`?**
`std::array` is fixed-size (compile time). `std::vector` is dynamic-size (can grow/shrink). `array` is stack-allocated; `vector` uses heap.

**Q7: What is the difference between `map` and `unordered_map`?**
`map` uses a red-black tree (sorted, O(log n)). `unordered_map` uses a hash table (unsorted, O(1) avg).

**Q8: What is a virtual function?**
A member function declared `virtual` in a base class that can be overridden in derived classes. Enables polymorphism through base pointers/references.

**Q9: What is the difference between `struct` and `class`?**
Only the default access: `struct` members are public by default; `class` members are private by default.

**Q10: What is `const` correctness?**
Using `const` to indicate that a variable, pointer, or function doesn't modify state. Catches bugs at compile time.

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Forgetting virtual destructor | Always use virtual destructor in base classes |
| Dangling references/pointers | Return by value, use smart pointers |
| Not using move semantics | Use std::move for ownership transfer |
| Using raw new/delete | Use make_unique/make_shared |
| Not reserving vector capacity | Use reserve() when size is known |
| Using std::endl instead of '\n' | Use '\n' unless flush needed |

## Best Practices

1. Use `auto` when type is obvious or complex
2. Use range-based for loops: `for (const auto& x : container)`
3. Use lambdas for short callbacks and algorithms
4. Use `std::make_unique` and `std::make_shared`
5. Use `constexpr` for compile-time computation
6. Pass by const reference for large objects
7. Use `std::move` for transferring ownership
8. Prefer smart pointers over raw pointers
9. Use RAII for all resource management
10. Use `nullptr` instead of `NULL` or `0`

## Quick Reference

```
STL CONTAINERS:
  vector      — Dynamic array, O(1) access
  deque       — Double-ended, O(1) both ends
  list        — Doubly-linked, O(1) insert
  map         — Sorted tree, O(log n)
  set         — Sorted unique, O(log n)
  unordered_map — Hash table, O(1) avg

SMART POINTERS:
  unique_ptr  — Exclusive ownership, zero overhead
  shared_ptr  — Shared ownership, reference counted
  weak_ptr    — Non-owning, breaks cycles

KEYWORD MEANINGS:
  const      — Can't modify
  constexpr  — Compile-time evaluable
  static     — Static storage duration / class member
  volatile   — Don't optimize reads/writes
  explicit   — Disable implicit conversions
  noexcept   — Won't throw exceptions
  override   — Overriding virtual function
```
