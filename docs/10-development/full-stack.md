---
layout: default
title: Full Stack Development
parent: Development
---

# Full Stack Development

## Introduction

Full-stack development encompasses the entire web application stack — from the user interface to the server, database, and deployment infrastructure. Full-stack engineers bridge frontend and backend, understanding how each layer interacts to deliver complete products. This requires versatility across technologies, architectural thinking, and informed trade-off decisions.

---

## Key Concepts

### Architecture Patterns

**Traditional Monolith:**
```
Client (Browser) → Web Server (Nginx) → App Server (Node.js) → Database (PostgreSQL)
```

**Modern Full-Stack:**
```
Client (React/Next.js) → CDN → API Gateway → App Server(s) → Database + Cache
                                                              ↓
                                                   Message Queue → Worker Services
```

**Next.js Full-Stack:**
- Pages (SSR/SSG/ISR) + API Routes (Serverless Functions)
- Server Components for data fetching, Client Components for interactivity
- Prisma/Drizzle ORM → PostgreSQL + Redis cache + NextAuth.js

### SSR vs CSR

| Aspect | CSR | SSR |
|--------|-----|-----|
| Initial Load | Slow (downloads JS, then renders) | Fast (sends rendered HTML) |
| SEO | Poor without setup | Excellent |
| Server Cost | Low (static files) | Higher (per-request rendering) |
| Best For | SPAs, dashboards | Content-heavy, SEO-critical |

### Server Components vs Client Components (Next.js 13+)

- **Server Component** (default): Runs on server, can directly access DB, no client JS sent
- **Client Component** (`'use client'`): Interactive, uses hooks, runs in browser

### Authentication Flow

```
1. User submits credentials
2. Server validates against database
3. Server generates JWT (access + refresh tokens)
4. Client stores tokens (httpOnly cookie recommended)
5. Client sends JWT in Authorization header
6. Server validates JWT on each request
7. On access token expiry, client uses refresh token
8. Server issues new access token
```

### Database Selection

| Scenario | Recommended |
|----------|-------------|
| Relational data, ACID | PostgreSQL |
| Simple key-value | Redis |
| Document-oriented | MongoDB |
| Time-series | TimescaleDB / InfluxDB |
| Graph relationships | Neo4j |
| Search | Elasticsearch |
| Serverless | DynamoDB / PlanetScale |

### Caching Layers

- **Browser Cache**: HTTP headers (Cache-Control, ETag)
- **CDN Cache**: Edge caching for static assets
- **Application Cache**: In-memory (Node.js process)
- **Redis Cache**: Distributed caching layer
- **Database Cache**: Query result caching

### Error Handling Architecture

```
Frontend:  try/catch → Error Boundaries → Global Handler → Sentry
Backend:   Route Handler → Middleware Error Handler → Logger → Error Response
Database:  Transaction Rollback → Retry Logic → Circuit Breaker
```

### Deployment Pipeline

```
Code Push → CI Build → Tests → Lint → Build → Deploy Staging → Smoke Tests → Deploy Production
```

---

## FAQ

### Q1: What is the difference between a full-stack engineer and a specialist?
**A:** Full-stack engineers work across the entire stack (frontend, backend, database, deployment). Specialists focus deeply on one area. Full-stack engineers are generalists who can build complete features.

### Q2: What is the MERN stack?
**A:** MongoDB + Express.js + React + Node.js. Uses JavaScript/TypeScript across the entire stack, simplifying development and enabling code sharing.

### Q3: What is the JAMstack?
**A:** JavaScript (client-side) + APIs (serverless) + Markup (pre-built HTML). Pages are pre-rendered and served from CDN, with dynamic functionality via APIs.

### Q4: What is serverless architecture?
**A:** Run code without managing servers. Cloud provider handles scaling, patching, availability. Pay per execution. Examples: AWS Lambda, Vercel Functions, Cloudflare Workers.

### Q5: What is the difference between SSR and SSG?
**A:** SSR renders on every request (dynamic). SSG generates HTML at build time (fastest, static). ISR combines both: static with periodic regeneration.

### Q6: How do you handle authentication in a full-stack app?
**A:** Use JWT or session-based auth. Store tokens in httpOnly cookies. Implement refresh token rotation. Use middleware to protect routes. Consider OAuth 2.0 for third-party auth.

### Q7: What is the N+1 problem?
**A:** Fetching a list then making individual queries for related data. Solve with SQL JOINs, eager loading, DataLoader pattern, or batch queries.

### Q8: What is optimistic UI?
**A:** Updates the interface immediately before the server responds. If the request fails, the UI rolls back. Makes the app feel faster.

### Q9: How do you handle real-time features?
**A:** WebSockets for bidirectional communication, Server-Sent Events for server-to-client, or polling. Libraries: Socket.io, Pusher, Ably.

### Q10: What is a monorepo?
**A:** Stores multiple projects in a single repository. Benefits: shared code, atomic changes, consistent tooling. Tools: Turborepo, Nx, Lerna.

### Q11: How do you handle file uploads?
**A:** Small files: base64 in API request. Large files: presigned URLs (S3), multipart upload, or direct-to-storage upload. Always validate file types and sizes.

### Q12: What is rate limiting?
**A:** Restricts the number of requests a client can make. Implement with Redis (token bucket), middleware, or API gateway. Return 429 status code.

### Q13: What is CORS?
**A:** Cross-Origin Resource Sharing restricts cross-origin requests. Backend must send `Access-Control-Allow-Origin` header.

### Q14: What is the strangler fig pattern?
**A:** Incrementally replaces parts of a monolith with new services. New features built as services; old features gradually migrated.

### Q15: What is feature flagging?
**A:** Toggle features without deploying. Use for A/B testing, gradual rollouts, and dark launches. Tools: LaunchDarkly, Flagsmith, or custom.

---

## Common Mistakes

1. Not separating concerns — mixing business logic with route handlers
2. Ignoring security — no input validation, SQL injection, XSS vulnerabilities
3. No error handling — crashes without proper error responses
4. Missing loading/error states — users don't know what's happening
5. Not testing — no unit, integration, or E2E tests
6. Hardcoded values — magic numbers, hardcoded URLs, no config management
7. No caching strategy — everything hits the database directly
8. Ignoring performance — no pagination, no optimization, no monitoring
9. No deployment pipeline — manual deployments are error-prone
10. Over-engineering — building microservices when a monolith would suffice

---

## Best Practices

### Architecture
- Start with a monolith, extract services when needed
- Use layered architecture (Controller → Service → Repository)
- Separate business logic from HTTP concerns
- Design for failure (circuit breakers, retries, fallbacks)

### Database
- Design schema before writing code (use migrations)
- Use ORMs for CRUD; raw SQL for complex queries
- Add indexes for frequently queried columns
- Use connection pooling

### API
- Use consistent naming conventions and version APIs
- Implement cursor-based pagination for list endpoints
- Return meaningful error messages with request IDs
- Document with OpenAPI/Swagger

### Frontend
- Implement loading and error states
- Optimize images (WebP, lazy loading)
- Code-split routes
- Test user flows, not implementation

### DevOps
- Use CI/CD for automated deployments
- Containerize with Docker
- Use infrastructure as code (Terraform)
- Monitor with logging, metrics, and tracing

---

## Quick Reference

### Tech Stack Options
```
JavaScript:  React/Next.js + Node.js/Express + PostgreSQL + Redis + Prisma + Vercel
Python:      React/Vue + Django/FastAPI + PostgreSQL + SQLAlchemy + Render/Fly.io
TypeScript:  Next.js (full) + PlanetScale/Supabase + Prisma + Vercel
```

### HTTP Status Codes
```
200 OK | 201 Created | 204 No Content
301 Moved | 304 Not Modified
400 Bad Request | 401 Unauthorized | 403 Forbidden
404 Not Found | 409 Conflict | 422 Validation
429 Rate Limited | 500 Server Error
```

### Authentication Quick Reference
```
JWT Flow:
  Login → Server validates → Issues JWT → Client stores → Sends in header → Server validates

Token Storage (most to least secure):
  httpOnly cookie > localStorage (XSS vulnerable) > memory (lost on refresh)

Refresh Flow:
  Access token expires → Client sends refresh token → Server validates → New access token
```
