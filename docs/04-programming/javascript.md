---
layout: default
title: JavaScript
parent: Programming Languages
---

# JavaScript

JavaScript programming for interviews — event loop, closures, prototypes, and async programming.

## Introduction

JavaScript is the language of the web and increasingly important in technical interviews. With the rise of full-stack development, Node.js, and modern frameworks, JavaScript proficiency is highly valued.

JavaScript has unique characteristics that interviewers love to test: its event loop, prototypal inheritance, closures, hoisting, the `this` keyword, and asynchronous programming model.

## Key Concepts

### Hoisting

- `var` declarations are hoisted and initialized to `undefined`
- `let`/`const` declarations are hoisted but NOT initialized (Temporal Dead Zone)
- Function declarations are fully hoisted (name + body)
- Function expressions are NOT fully hoisted

### The Event Loop

```
Call Stack → Microtask Queue → Macrotask Queue → Render
     ↓              ↓                  ↓
  Synchronous    Promise.then      setTimeout
  code           async/await       setInterval
                 queueMicrotask    I/O callbacks
```

Microtasks (Promises) have higher priority than macrotasks (setTimeout).

### Closures

A closure is a function that retains access to its lexical scope even when executed outside that scope.

```javascript
function outer() {
    let count = 0;
    return function inner() {
        count++;
        return count;
    };
}
const counter = outer();
counter(); // 1
counter(); // 2
```

### The `this` Keyword

| Context | `this` Value |
|---------|-------------|
| Global scope | `window` (browser) / `global` (Node) |
| Object method | The object |
| Regular function | `window`/`global` (or `undefined` in strict mode) |
| Arrow function | Lexical `this` (surrounding scope) |
| Constructor | New object being created |
| `call`/`apply`/`bind` | Explicitly specified object |

### Prototypal Inheritance

```javascript
const animal = {
    eat() { console.log("eating"); },
    sleep() { console.log("sleeping"); }
};

const dog = Object.create(animal);
dog.bark = function() { console.log("woof"); };

dog.bark(); // "woof"
dog.eat();  // "eating" (inherited from animal)

// ES6 Classes (syntactic sugar over prototypes)
class Animal {
    constructor(name) { this.name = name; }
    eat() { console.log(`${this.name} is eating`); }
}

class Dog extends Animal {
    bark() { console.log(`${this.name} says woof`); }
}
```

### Array Methods

```javascript
const numbers = [1, 2, 3, 4, 5];

numbers.map(n => n * 2);        // [2, 4, 6, 8, 10]
numbers.filter(n => n % 2 === 0); // [2, 4]
numbers.reduce((acc, n) => acc + n, 0); // 15
numbers.find(n => n > 3);       // 4
numbers.some(n => n > 3);       // true
numbers.every(n => n > 0);      // true
```

### Promises and Async/Await

```javascript
// Promise
function fetchData() {
    return new Promise((resolve, reject) => {
        setTimeout(() => resolve({ data: "result" }), 1000);
    });
}

// Async/Await
async function getData() {
    try {
        const result = await fetchData();
        console.log(result);
    } catch (error) {
        console.error(error);
    }
}

// Parallel execution
const [users, posts] = await Promise.all([
    fetchUsers(),
    fetchPosts()
]);
```

### ES6+ Features

```javascript
// Destructuring
const { name, age, ...rest } = user;
const [first, second, ...others] = array;

// Spread/Rest
const newArray = [...oldArray, newItem];
const merged = { ...obj1, ...obj2 };

// Optional chaining
const city = user?.address?.city;

// Nullish coalescing
const value = data ?? "default";
```

## FAQ

**Q1: What is the difference between `var`, `let`, and `const`?**
`var` is function-scoped and hoisted. `let` is block-scoped, hoisted but in TDZ. `const` is block-scoped, cannot be reassigned. Use `const` by default, `let` when reassignment is needed.

**Q2: What is the difference between `==` and `===`?**
`==` performs type coercion before comparison. `===` compares value and type without coercion. Always use `===`.

**Q3: What is a closure?**
A function that retains access to variables from its enclosing lexical scope, even when executed outside that scope.

**Q4: What is the event loop?**
JavaScript's concurrency model. The call stack executes synchronous code. Async operations are handled by the runtime. Callbacks are placed in microtask/macrotask queues when complete.

**Q5: What is hoisting?**
The behavior of moving variable and function declarations to the top of their scope during compilation.

**Q6: What is the difference between null and undefined?**
`undefined` means declared but not assigned. `null` is an intentional assignment of "no value".

**Q7: What is prototypal inheritance?**
Objects inherit from other objects via the prototype chain. Property lookup traverses up the chain until found or null.

**Q8: What is the `this` keyword in an arrow function?**
Lexically bound — inherited from the surrounding scope, not determined by how the function is called.

**Q9: What is the difference between `map` and `forEach`?**
`map` returns a new array. `forEach` returns `undefined` (used for side effects).

**Q10: What is event delegation?**
Attaching a single event listener to a parent element instead of individual child elements. Events bubble up from children to parents.

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Using `var` instead of `let`/`const` | Use `const` by default, `let` when needed |
| Forgetting `this` in event handlers | Use arrow functions or bind |
| Not handling promise rejections | Always add .catch() or try/catch |
| Async/await without try/catch | Wrap await calls in try/catch |
| Incorrect `this` with arrow functions | Arrow functions don't have own `this` |
| Mutating array references | Use spread operator for new arrays |

## Best Practices

1. Use `const` by default, `let` when needed, never `var`
2. Use `===` instead of `==`
3. Use arrow functions for callbacks (preserve `this`)
4. Use destructuring to extract values cleanly
5. Use optional chaining (`?.`) to avoid null errors
6. Use template literals instead of string concatenation
7. Debounce/throttle event handlers
8. Use `Map`/`Set` for frequent lookups (O(1) vs O(n) for arrays)

## Quick Reference

```javascript
// Data types
Primitives: string, number, boolean, null, undefined, symbol, bigint
Reference: object, array, function, Map, Set

// Array methods
map     → Transform each element
filter  → Select matching elements
reduce  → Accumulate to single value
find    → First matching element

// Promise methods
Promise.all      → Wait for all
Promise.race     → First to settle
Promise.any      → First to fulfill

// ES6+ features
Destructuring:  const { a, b } = obj
Spread:         [...arr]
Optional chain: obj?.prop?.nested
Arrow:          (a, b) => a + b
```
