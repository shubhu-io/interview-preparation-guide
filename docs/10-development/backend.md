---
layout: default
title: Backend Development
parent: Development
---

# Backend Development

## Introduction

Backend development is the server-side of applications — the engine handling data storage, business logic, authentication, API design, and everything behind the scenes. A strong backend engineer understands distributed systems, database design, security, scalability, and architectural trade-offs.

---

## Key Concepts

### REST API Design

**Principles:** Stateless, Client-Server separation, Cacheable, Uniform Interface, Layered System.

**Resource Naming:**
```
GET    /api/v1/users              — List users
POST   /api/v1/users              — Create user
GET    /api/v1/users/:id          — Get user
PUT    /api/v1/users/:id          — Update (full)
PATCH  /api/v1/users/:id          — Update (partial)
DELETE /api/v1/users/:id          — Delete user
```

**Status Codes:**
```
200 OK | 201 Created | 204 No Content | 304 Not Modified
400 Bad Request | 401 Unauthorized | 403 Forbidden | 404 Not Found
409 Conflict | 422 Validation Error | 429 Rate Limited
500 Internal Server Error | 502 Bad Gateway | 503 Service Unavailable
```

### GraphQL

Single endpoint where clients specify exact data fields needed. Eliminates over-fetching and under-fetching but adds complexity vs. REST.

```graphql
type User { id: ID!, name: String!, email: String!, posts: [Post!]! }
type Query { user(id: ID!): User }
type Mutation { createUser(input: CreateUserInput!): User! }
```

### Authentication & Authorization

**JWT (JSON Web Tokens):** `Header.Payload.Signature` — stateless authentication where the server signs and clients verify tokens.

**OAuth 2.0 Flows:** Authorization Code (server apps), Authorization Code + PKCE (SPAs/mobile), Client Credentials (machine-to-machine), Device Code (IoT).

**Password Hashing:** Use bcrypt or Argon2 (never MD5/SHA-256). Include salt automatically. Use cost factor 12+ for bcrypt.

### Database Design

- **Normalization:** 1NF (atomic values), 2NF (no partial dependencies), 3NF (no transitive dependencies)
- **Indexing:** B-tree indexes for equality/range, composite indexes (order matters), partial indexes, covering indexes
- **SQL vs NoSQL:** SQL for complex queries and transactions; NoSQL for flexibility and scale

### Caching Strategies

- **Cache-Aside (Lazy Loading):** App checks cache first, falls back to DB
- **Write-Through:** Write to cache and DB simultaneously
- **Write-Behind:** Write to cache, async write to DB
- **Redis:** Session storage, rate limiting, leaderboards, pub/sub, job queues, distributed locks

### Message Queues

- **When to use:** Decoupling services, async processing, load leveling, event sourcing
- **Patterns:** Point-to-Point, Pub/Sub, Request-Reply, Dead Letter Queue

### Rate Limiting Algorithms

Fixed Window, Sliding Window Log, Sliding Window Counter, Token Bucket, Leaky Bucket.

### Scalability

- **Vertical scaling:** Add resources to one server (simpler, limited)
- **Horizontal scaling:** Add more servers (complex, better theoretical limits)
- **Connection Pooling:** Reuse database connections to reduce overhead
- **Health Checks:** Liveness (is it running?), Readiness (can it handle requests?)

---

## FAQ

### Q1: What is the difference between authentication and authorization?
**A:** Authentication verifies identity (who you are). Authorization determines permissions (what you can do). AuthN before AuthZ.

### Q2: What is the N+1 query problem?
**A:** Fetching a list of N items then making N additional queries for related data. Solution: use JOINs, eager loading, or data loaders.

### Q3: What is the CAP theorem?
**A:** A distributed system can guarantee only 2 of 3: Consistency, Availability, Partition Tolerance. In practice, partition tolerance is required, so systems choose CP or AP.

### Q4: What is idempotency?
**A:** An operation produces the same result regardless of how many times it's called. PUT and DELETE should be idempotent because clients may retry failed requests.

### Q5: What is the difference between SQL and NoSQL?
**A:** SQL databases are relational with fixed schemas, ACID transactions, and JOINs. NoSQL databases are non-relational with flexible schemas, horizontal scaling, and eventual consistency.

### Q6: What is connection pooling?
**A:** Maintains a pool of reusable database connections. Creating connections per request is expensive. Pooling reduces latency and database load.

### Q7: What is eventual consistency?
**A:** After a write, all replicas eventually converge to the same value, but reads may temporarily return stale data. A trade-off for higher availability.

### Q8: What is a circuit breaker?
**A:** Monitors calls to an external service. When failures exceed a threshold, it "opens" and fails fast. After a timeout, it "half-opens" to test recovery.

### Q9: What is database sharding?
**A:** Horizontally partitions data across multiple database servers. Each shard holds a subset. Enables scaling beyond a single server but adds join complexity.

### Q10: What is the purpose of a load balancer?
**A:** Distributes incoming requests across multiple servers. Improves availability, scalability, and fault tolerance. Algorithms: round-robin, least connections, IP hash.

### Q11: What is a microservices architecture?
**A:** Decomposes a monolith into small, independent services communicating via APIs or messages. Each service owns its data and can be developed, deployed, and scaled independently.

### Q12: What is event-driven architecture?
**A:** Services produce events to a message broker; other services consume and react. Decouples services and enables asynchronous processing.

### Q13: What is database replication?
**A:** Copies data from a primary to replicas. Read replicas distribute read load, provide redundancy, and serve geographically distributed users.

### Q14: What is ACID?
**A:** Atomicity (all-or-nothing), Consistency (valid state transitions), Isolation (concurrent transactions don't interfere), Durability (committed data survives crashes).

### Q15: What is a service mesh?
**A:** Infrastructure-level communication between microservices handling service discovery, load balancing, encryption, and observability without application code changes.

### Q16: What is observability?
**A:** Understanding a system's internal state from external outputs. Three pillars: Logs (discrete events), Metrics (numerical measurements), Traces (request flow across services).

---

## Common Mistakes

1. Over-fetching data — returning entire objects when only a few fields are needed
2. Ignoring rate limiting — APIs without limits are vulnerable to abuse
3. N+1 queries — fetching related data in loops instead of JOINs
4. No input validation — trusting client input without validation
5. Hardcoded secrets — storing API keys in source code
6. No pagination — returning unlimited results in list endpoints
7. Synchronous processing — doing slow operations in request handlers
8. No database indexing — missing indexes on frequently queried columns
9. Ignoring structured logging — no way to debug in production

---

## Best Practices

- Use nouns for resources, HTTP methods for actions
- Version APIs (`/api/v1/`)
- Consistent error response format with request IDs
- Implement cursor-based pagination for large datasets
- Hash passwords with bcrypt/Argon2; use HTTPS everywhere
- Validate and sanitize all input; use parameterized queries
- Cache aggressively at multiple levels; use async processing for slow operations
- Implement circuit breakers for external services
- Monitor and optimize database queries; use connection pooling
- Design for failure — retries with exponential backoff, graceful degradation

---

## Quick Reference

### HTTP Methods
```
GET     — Read (safe, idempotent)
POST    — Create (not idempotent)
PUT     — Replace (idempotent)
PATCH   — Partial update
DELETE  — Remove (idempotent)
```

### Database Query Optimization
```
EXPLAIN ANALYZE SELECT ...         — Analyze query plan
CREATE INDEX idx_name ON table(col) — Add index
SELECT col1, col2 FROM ...        — Avoid SELECT *
WHERE col = ? AND col2 > ?        — Use indexed columns
```

### Redis Commands
```
GET/SET key value        — Basic operations
EXPIRE key seconds       — Set TTL
INCR key                 — Atomic increment (rate limiting)
LPUSH/RPUSH              — Queue operations
ZADD/ZRANGE              — Sorted sets (leaderboards)
```
