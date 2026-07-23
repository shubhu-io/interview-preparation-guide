---
layout: default
title: Python
parent: Programming Languages
---

# Python

Python programming for technical interviews — clean syntax, rich libraries, and Pythonic idioms.

## Introduction

Python is one of the most popular languages for technical interviews due to its clean syntax, rich standard library, and readability. It's the primary language for data science, machine learning, and scripting.

Python's conciseness allows you to focus on algorithmic thinking rather than language boilerplate. However, Python has unique behaviors that interviewers love to test — variable scoping, mutable default arguments, the GIL, and Pythonic idioms.

## Key Concepts

### Data Structures

| Structure | Mutable | Ordered | Duplicates | Lookup | Insert |
|-----------|---------|---------|------------|--------|--------|
| list | Yes | Yes | Yes | O(n) | O(1) amortized |
| dict | Yes | Yes* | No keys | O(1) | O(1) |
| set | Yes | No | No | O(1) | O(1) |
| tuple | No | Yes | Yes | O(n) | N/A |

*Python 3.7+ guarantees dict insertion order*

### List Comprehensions

```python
# Basic
squares = [x**2 for x in range(10)]

# With condition
evens = [x for x in range(20) if x % 2 == 0]

# Flatten
nested = [[1, 2], [3, 4], [5, 6]]
flat = [x for sublist in nested for x in sublist]

# Dict comprehension
word_lengths = {word: len(word) for word in ["hello", "world"]}
```

### Generators and Iterators

```python
# Generator function (lazy evaluation)
def fibonacci():
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b

# Generator expression (memory efficient)
sum_of_squares = sum(x**2 for x in range(1000000))
```

### Decorators

```python
import functools
import time

def timer(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        print(f"{func.__name__} took {time.time() - start:.4f}s")
        return result
    return wrapper

@timer
def slow_function():
    time.sleep(1)
```

### Collections Module

```python
from collections import Counter, defaultdict, deque, namedtuple

# Counter
words = ["apple", "banana", "apple"]
word_count = Counter(words)  # Counter({'apple': 2, 'banana': 1})

# defaultdict
graph = defaultdict(list)
graph['A'].append('B')  # No KeyError

# deque (O(1) append/pop from both ends)
queue = deque([1, 2, 3])
queue.appendleft(0)  # [0, 1, 2, 3]

# namedtuple
Point = namedtuple('Point', ['x', 'y'])
p = Point(3, 4)
print(p.x, p.y)  # 3 4
```

### Python Gotchas

```python
# Mutable default arguments
def append_to(item, lst=[]):  # BUG: shared across calls
    lst.append(item)
    return lst

def append_to(item, lst=None):  # CORRECT
    if lst is None:
        lst = []
    lst.append(item)
    return lst

# Late binding closures
funcs = [lambda x: x + i for i in range(5)]  # All return x + 4
funcs = [lambda x, i=i: x + i for i in range(5)]  # Correct

# Float precision
0.1 + 0.2 == 0.3  # False!
```

## FAQ

**Q1: What is the difference between a list and a tuple?**
Lists are mutable and use square brackets. Tuples are immutable and use parentheses. Tuples are faster, use less memory, and can be dictionary keys.

**Q2: What are Python decorators?**
Functions that modify the behavior of other functions. They wrap a function and extend its functionality without modifying the original code.

**Q3: What is the GIL and why does it matter?**
The Global Interpreter Lock allows only one thread to execute Python bytecode at a time. It limits CPU-bound parallelism in threading but doesn't affect multiprocessing.

**Q4: What is the difference between `is` and `==`?**
`==` checks value equality. `is` checks identity (whether two references point to the same object). Always use `is None` instead of `== None`.

**Q5: What are list comprehensions vs generator expressions?**
List comprehensions create lists in memory. Generator expressions yield items lazily. Use generators for large datasets to save memory.

**Q6: What is the difference between `deepcopy` and `copy`?**
`copy` creates a shallow copy (new object but references to same inner objects). `deepcopy` creates a deep copy (recursively copies all nested objects).

**Q7: What are *args and **kwargs?**
`*args` collects positional arguments into a tuple. `**kwargs` collects keyword arguments into a dictionary.

**Q8: What is the difference between `__str__` and `__repr__`?**
`__str__` returns a human-readable string. `__repr__` returns an unambiguous string for developers/debugging.

**Q9: What is the difference between `@staticmethod` and `@classmethod`?**
`@staticmethod` doesn't receive the class or instance. `@classmethod` receives the class as the first argument. Use classmethod for factory methods.

**Q10: What is the difference between `yield` and `return`?**
`return` exits the function and returns a value. `yield` produces a value and pauses execution, allowing the function to resume.

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Mutable default arguments | Use `None` as default |
| Late binding closures | Capture value at definition time |
| `==` instead of `is` for None | Use `is None` |
| Modifying list while iterating | Use list comprehension or reversed() |
| Forgetting `self` parameter | Always include self in instance methods |
| Mutable class attributes | Initialize in `__init__` |
| Not using `with` for files | Always use context managers |

## Best Practices

1. Use list/dict/set comprehensions over map/filter when readable
2. Use `enumerate()` instead of manual index tracking
3. Use `zip()` to iterate over multiple sequences
4. Use `collections` module (Counter, defaultdict, deque)
5. Use f-strings for string formatting
6. Use context managers (`with` statement) for resource management
7. Use generators for large datasets (lazy evaluation)
8. Use `set` for O(1) membership testing instead of `list`
9. Use built-in functions (`sum`, `max`, `min`, `sorted`)
10. Profile before optimizing (`cProfile`, `timeit`)

## Quick Reference

```python
# Common patterns
Two pointers:     i, j = 0, len(arr)-1
Sliding window:   window = arr[i:i+k]
BFS:              deque, visited set
DFS:              recursive or stack
Binary search:    lo, hi = 0, len(arr)-1

# Useful imports
from collections import Counter, defaultdict, deque, namedtuple
from itertools import chain, product, permutations, combinations
from functools import reduce, lru_cache
from bisect import bisect_left, bisect_right
```
