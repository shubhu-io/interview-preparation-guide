---
layout: default
title: Frontend Development
parent: Development
---

# Frontend Development

## Introduction

Frontend development is building user interfaces that users see and interact with. It encompasses HTML, CSS, JavaScript, and modern frameworks like React, Vue, and Angular. Frontend engineers balance visual design, performance, accessibility, cross-browser compatibility, and developer experience.

---

## Key Concepts

### Framework Comparison

| Aspect | React | Vue | Angular |
|--------|-------|-----|---------|
| Type | Library | Progressive Framework | Full Framework |
| Language | JavaScript/JSX | JavaScript/Template | TypeScript |
| Learning Curve | Medium | Gentle | Steep |
| State Management | Redux, Zustand, Context | Pinia, Vuex | NgRx |
| SSR | Next.js | Nuxt | Angular Universal |
| Best For | Flexible ecosystem | Approachable, versatile | Enterprise apps |

### React Hooks

```jsx
const [count, setCount] = useState(0);           // Local state
useEffect(() => { /* effect */ }, [deps]);        // Side effects
const inputRef = useRef(null);                     // Mutable reference
const memoized = useMemo(() => expensive(a, b), [a, b]); // Memoize computation
const handler = useCallback(() => doSomething(id), [id]); // Memoize function
const [state, dispatch] = useReducer(reducer, init);       // Complex state
const theme = useContext(ThemeContext);                      // Consume context
```

### Component Design Patterns

**Compound Components** — Parent manages shared state via Context; children consume it.

**Render Props** — Pass a function as a prop to customize rendering:
```jsx
<MouseTracker render={({ x, y }) => <p>Mouse at ({x}, {y})</p>} />
```

**Custom Hooks** — Extract reusable logic:
```jsx
function useFetch(url) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  useEffect(() => {
    const controller = new AbortController();
    fetch(url, { signal: controller.signal })
      .then(r => r.json()).then(setData).catch(setError)
      .finally(() => setLoading(false));
    return () => controller.abort();
  }, [url]);
  return { data, loading, error };
}
```

### Performance Optimization

- **React.memo** — Prevent re-renders if props unchanged (shallow comparison)
- **useMemo** — Cache expensive computations
- **useCallback** — Cache function references for memoized children
- **Code Splitting** — `React.lazy()` + `<Suspense>` for route-based splitting
- **Virtualization** — Render only visible items in long lists (react-window)

### State Management

- **Local State**: `useState` for component-level state
- **Context API**: Infrequently changing global data (theme, auth)
- **Redux Toolkit**: Complex state with many updates, middleware, time-travel debugging
- **Zustand/Jotai**: Lightweight alternatives to Redux

### Testing

- **Unit**: Jest + React Testing Library — test user behavior, not implementation
- **E2E**: Cypress/Playwright — test complete user flows
- **Visual**: Storybook — develop and test components in isolation
- Use `data-testid` selectors, mock APIs with MSW (Mock Service Worker)

### CSS Approaches

- **CSS Modules** — Scoped class names per component
- **Styled Components / Emotion** — CSS-in-JS with dynamic styling
- **Tailwind CSS** — Utility-first CSS framework
- **Sass/SCSS** — CSS preprocessor with variables, nesting, mixins

---

## FAQ

### Q1: What is the virtual DOM?
**A:** A lightweight JavaScript representation of the real DOM. On state changes, the new virtual tree is diffed with the previous one, and only minimal actual DOM updates are applied.

### Q2: What is prop drilling?
**A:** Passing props through multiple component layers to reach a deeply nested component. Solutions: Context API, state management libraries, or composition patterns.

### Q3: What is the difference between controlled and uncontrolled components?
**A:** Controlled: React state manages the input value via `value` and `onChange`. Uncontrolled: DOM manages its own state via `defaultValue` and `ref`.

### Q4: What is React.memo?
**A:** A higher-order component that prevents re-renders if props haven't changed (shallow comparison). Use for expensive child components that receive stable props.

### Q5: What are React keys?
**A:** Keys help React identify which items changed in lists. Must be unique and stable among siblings. Never use array indices for dynamic lists.

### Q6: What is the useEffect cleanup function?
**A:** The return function runs before unmount and before the effect re-runs. Use for cancelling subscriptions, aborting fetches, clearing timers.

### Q7: What is the difference between useMemo and useCallback?
**A:** `useMemo` memoizes a computed value (returns the result). `useCallback` memoizes a function (returns the function reference).

### Q8: What is SSR?
**A:** Server-Side Rendering renders components on the server, sending fully rendered HTML to the client. Benefits: faster initial load, better SEO. Frameworks: Next.js, Nuxt.

### Q9: What is hydration?
**A:** Client-side JavaScript takes over server-rendered HTML, attaching event listeners and restoring component state. Mismatches cause warnings.

### Q10: What is the difference between Redux and Context API?
**A:** Context API for infrequently changing global data. Redux for complex state with many updates, middleware, time-travel debugging, and predictable transitions.

### Q11: What are custom hooks?
**A:** Functions that extract reusable logic from components. Follow `use` prefix convention and can call other hooks. Share stateful logic without changing component hierarchy.

### Q12: What is the difference between SPA and MPA?
**A:** SPA loads one HTML page, dynamically updating via JavaScript. MPA loads a new HTML page per navigation. SPAs have better UX; MPAs are simpler and better for SEO without SSR.

### Q13: What are React Portals?
**A:** Render children into a different DOM node outside the parent hierarchy. Useful for modals, tooltips, and dropdowns that need to escape overflow hidden.

### Q14: What is code splitting?
**A:** Dividing your bundle into smaller chunks loaded on demand. In React: `React.lazy()` + `Suspense`. Reduces initial load time.

### Q15: What is Storybook?
**A:** A tool for developing UI components in isolation. Write "stories" showing components in different states. Helps with visual testing and documentation.

---

## Common Mistakes

1. Not memoizing expensive computations — use `useMemo` to prevent recalculation
2. Missing dependency arrays — `useEffect` without proper deps runs every render
3. Not using keys properly — array indices cause bugs when list order changes
4. Over-using state — derived values should be computed, not stored separately
5. Not cleaning up effects — subscriptions and timers leak memory
6. Prop drilling deep — use Context or state management for deeply shared data
7. Blocking the main thread — heavy computation in render blocks UI
8. Ignoring accessibility — missing ARIA labels, keyboard navigation, color contrast
9. Not testing edge cases — loading, error, empty states should all be tested
10. Bundle size bloat — importing entire libraries for single functions

---

## Best Practices

- Keep components small and focused (single responsibility)
- Lift state up when siblings need to share data
- Use composition over inheritance
- Extract reusable logic into custom hooks
- Prefer controlled components for forms
- Use TypeScript for type safety
- Measure before optimizing (React DevTools Profiler)
- Code-split routes and heavy components
- Test user behavior, not implementation details
- Use semantic HTML elements and ARIA labels
- Use ESLint and Prettier for consistent code style

---

## Quick Reference

### React Hooks
```
useState          — Local component state
useEffect         — Side effects (mount, update, cleanup)
useContext        — Consume context values
useRef            — Mutable DOM reference
useMemo           — Memoize computed values
useCallback       — Memoize function references
useReducer        — Complex state logic
useDeferredValue  — Defer non-urgent updates
useTransition     — Mark non-urgent state updates
```

### CSS Specificity
```
Inline style (style="")  — 0,1,0,0
ID (#id)                  — 0,0,1,0
Class / Attribute         — 0,0,0,1
Element                   — 0,0,0,0,1
```

### JavaScript Array Methods
```
map()      — Transform each element
filter()   — Keep matching elements
reduce()   — Accumulate into single value
find()     — First matching element
some()     — Any match?
every()    — All match?
sort()     — Sort in place
slice()    — Extract portion
```
