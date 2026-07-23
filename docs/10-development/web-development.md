---
layout: default
title: Web Development
parent: Development
---

# Web Development

## Introduction

Web development encompasses creating websites and web applications that run in browsers — from simple static pages to complex single-page applications. It rests on three pillars: HTML (structure), CSS (styling), and JavaScript (behavior). Modern web development also includes PWAs, performance optimization, security, and responsive design.

---

## Key Concepts

### HTML5 Semantic Elements

Semantic HTML improves accessibility, SEO, and code readability:

- `<header>` — Introductory content or navigation
- `<nav>` — Navigation links
- `<main>` — Dominant content of the document
- `<section>` — Thematic grouping of content
- `<article>` — Self-contained composition
- `<aside>` — Tangentially related content
- `<footer>` — Footer for its nearest sectioning ancestor
- `<figure>` / `<figcaption>` — Self-contained content with caption

### CSS Layout

**Flexbox** — one-dimensional (row or column):
```css
.container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 1rem;
}
```

**Grid** — two-dimensional (rows AND columns):
```css
.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1rem;
}
```

**Responsive Design** — mobile-first with media queries:
```css
.container { width: 100%; }
@media (min-width: 768px) { .container { width: 720px; margin: 0 auto; } }
@media (min-width: 1024px) { .container { width: 960px; } }
```

### JavaScript Fundamentals

- **Variables**: `const` (block-scoped, no reassign), `let` (block-scoped, reassignable), avoid `var`
- **Closures**: Functions that remember variables from their lexical scope
- **Prototypal Inheritance**: Objects link via `[[Prototype]]`; ES6 classes are syntactic sugar
- **Event Loop**: Synchronous code → Microtasks (Promises) → Macrotasks (setTimeout) → Render
- **Async/Await**: Modern asynchronous code with sequential-looking syntax
- **Promises**: `.then()` for success, `.catch()` for failure, `Promise.all()` for parallel execution

### Web APIs

- **Fetch API**: Modern promise-based HTTP requests
- **Service Workers**: Enable offline support and caching for PWAs
- **Web Workers**: Run JavaScript off the main thread
- **Web Storage**: `localStorage` (persistent), `sessionStorage` (per-tab)
- **IndexedDB**: Large structured data storage

### Web Security

- **CORS**: Server must explicitly allow cross-origin requests via headers
- **CSP**: Specify which resources can be loaded to prevent XSS
- **XSS Prevention**: Input sanitization, CSP, output encoding
- **CSRF Prevention**: CSRF tokens, SameSite cookies

### Progressive Web Apps (PWAs)

- Must be served over HTTPS
- Service Worker for offline support and caching
- Web App Manifest for installability
- Responsive design across all screen sizes

### Performance — Core Web Vitals

- **LCP** (Largest Contentful Paint): < 2.5s
- **INP** (Interaction to Next Paint): < 200ms
- **CLS** (Cumulative Layout Shift): < 0.1

Key optimizations: code splitting, lazy loading, image optimization (WebP), compression (Brotli), CDN, preloading critical resources.

---

## FAQ

### Q1: What is the difference between `==` and `===`?
**A:** `==` performs type coercion (loose equality). `===` compares value AND type (strict equality). Always use `===`.

### Q2: What is event delegation?
**A:** Event delegation uses event bubbling to handle events at a parent level instead of attaching handlers to each child. Efficient for dynamic content and reduces memory usage.

### Q3: What is the virtual DOM?
**A:** A lightweight JavaScript representation of the real DOM. On state changes, a new virtual tree is diffed with the previous one, and only minimal DOM updates are applied (reconciliation).

### Q4: What is the difference between Flexbox and Grid?
**A:** Flexbox is one-dimensional (row OR column). Grid is two-dimensional (rows AND columns). Use Flexbox for component layout; Grid for page layout. They work great together.

### Q5: What is CORS?
**A:** Cross-Origin Resource Sharing restricts web pages from making requests to a different origin. Servers must explicitly allow cross-origin requests via `Access-Control-Allow-Origin` headers.

### Q6: What are Web Components?
**A:** Web Components let you create reusable custom elements with encapsulated functionality: Custom Elements, Shadow DOM, HTML Templates, and ES Modules.

### Q7: What is the difference between `display: none`, `visibility: hidden`, and `opacity: 0`?
**A:** `display: none` removes from layout entirely. `visibility: hidden` hides but reserves space. `opacity: 0` makes invisible but it still participates in layout and events.

### Q8: What is `position: sticky`?
**A:** Behaves like `relative` until reaching a scroll threshold, then like `fixed`. It stays within its parent container. Requires `top`, `bottom`, `left`, or `right` to work.

### Q9: What is the `this` keyword?
**A:** In regular functions, `this` is determined by how the function is called. In methods, it's the owning object. In classes, it's the instance. Arrow functions inherit `this` from their enclosing scope.

### Q10: What is the difference between debounce and throttle?
**A:** **Debounce** delays execution until a pause in events (search input). **Throttle** limits execution to once per interval (scroll handler).

### Q11: What are CSS Custom Properties?
**A:** CSS variables defined with `--` prefix that cascade through the DOM. More powerful than preprocessor variables because they can change at runtime and are scoped to elements.

### Q12: What is hoisting?
**A:** JavaScript moves declarations to the top of their scope during compilation. `var` and function declarations are hoisted and initialized. `let`/`const` are hoisted but not initialized (Temporal Dead Zone).

---

## Common Mistakes

1. Not using semantic HTML — divs everywhere hurts accessibility and SEO
2. Ignoring mobile-first design — desktop-first leads to worse mobile experience
3. Not optimizing images — the #1 performance killer
4. Excessive JavaScript — blocks rendering and increases load time
5. Not handling errors — missing error states in API calls
6. Accessibility as an afterthought — should be considered from the start
7. Not using `box-sizing: border-box` — makes layout calculations complex
8. No loading states — users should always know something is happening
9. Over-relying on frameworks — not understanding vanilla HTML/CSS/JS fundamentals

---

## Best Practices

- Use semantic elements (`<nav>`, `<main>`, `<article>`)
- Mobile-first responsive design
- Use CSS Custom Properties for theming
- Use `const` by default, `let` when needed, never `var`
- Always use `===` instead of `==`
- Handle errors with try/catch for async code
- Prefer `async/await` over raw Promises
- Debounce/throttle expensive event handlers
- Lazy load images and non-critical resources
- Use `<link rel="preload">` for critical resources
- Use Brotli compression over Gzip
- Profile regularly with Lighthouse and Chrome DevTools

---

## Quick Reference

### Flexbox
```
display: flex
flex-direction: row | column
justify-content: flex-start | flex-end | center | space-between | space-around | space-evenly
align-items: flex-start | flex-end | center | stretch | baseline
flex-wrap: nowrap | wrap
gap: <length>
```

### CSS Grid
```
display: grid
grid-template-columns: repeat(n, 1fr) | repeat(auto-fill, minmax(Xpx, 1fr))
gap: <row-gap> <column-gap>
grid-area: <name>
```

### JavaScript Array Methods
```
map()      — transform each element
filter()   — select elements matching condition
reduce()   — accumulate into single value
find()     — first element matching condition
some()     — any element matches?
every()    — all elements match?
flat()     — flatten nested arrays
includes() — array contains value?
```

### HTTP Status Codes
```
200 OK | 201 Created | 204 No Content
301 Moved Permanently | 304 Not Modified
400 Bad Request | 401 Unauthorized | 403 Forbidden
404 Not Found | 429 Too Many Requests | 500 Server Error
```
