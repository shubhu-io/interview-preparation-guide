---
layout: default
title: System Design
parent: System Design
---

# System Design (HLD & LLD)

## Introduction

System Design is the process of defining the architecture, components, modules, interfaces, and data flow of a system to satisfy specified requirements. It is critical for senior/staff engineer roles at top tech companies.

### HLD vs LLD

| Aspect | HLD (High-Level Design) | LLD (Low-Level Design) |
|--------|------------------------|----------------------|
| **Scope** | System-wide architecture | Component/class level design |
| **Audience** | Architects, stakeholders | Developers, engineers |
| **Focus** | Components, interactions, data flow | Classes, methods, algorithms |
| **Output** | Architecture diagrams, tech stack | Class diagrams, sequence diagrams |

---

## Key Concepts

### Load Balancing

Distributes incoming network traffic across multiple servers.

| Algorithm | Description | Use Case |
|-----------|-------------|----------|
| **Round Robin** | Distributes requests sequentially | Equal capacity servers |
| **Weighted Round Robin** | Distributes based on server capacity | Mixed capacity servers |
| **Least Connections** | Routes to server with fewest connections | Variable request durations |
| **IP Hash** | Routes based on client IP | Session persistence needed |
| **Least Response Time** | Routes to fastest responding server | Performance-critical apps |

### Caching

Stores frequently accessed data in fast storage layers to reduce database load and latency.

**Cache Strategies**:
- **Write-through**: Write to cache and DB simultaneously
- **Write-behind**: Write to cache, asynchronously flush to DB
- **Cache-aside (Lazy loading)**: App checks cache first, loads from DB on miss
- **Read-through**: Cache loads data from DB on miss

**Eviction Policies**: LRU, LFU, FIFO, TTL-based.

### Database Sharding

Splits a large database into smaller partitions (shards) distributed across multiple servers.

| Sharding Method | Description | Pros | Cons |
|----------------|-------------|------|------|
| **Range-based** | Shards by value ranges | Simple to implement | Hotspots, uneven distribution |
| **Hash-based** | Shards by hash of key | Even distribution | Hard to add new shards |
| **Directory-based** | Lookup table maps keys to shards | Flexible | Single point of failure |

### CAP Theorem

A distributed system can guarantee at most two of three properties:
- **Consistency (C)**: Every read receives the most recent write
- **Availability (A)**: Every request receives a response
- **Partition Tolerance (P)**: System operates despite network partitions

Since network partitions are unavoidable, systems choose between CP or AP.

### Consistent Hashing

Maps both servers and keys to a hash ring, minimizing redistribution when servers are added/removed. Critical for distributed caches (Redis Cluster), load balancing, and partitioning.

### Rate Limiting

Controls the number of requests a client can make in a given time window.

| Algorithm | Description |
|-----------|-------------|
| **Token Bucket** | Tokens added at fixed rate, consumed per request |
| **Sliding Window** | Counts requests in rolling time window |
| **Fixed Window** | Counts requests in fixed time periods |
| **Leaky Bucket** | Requests queued, processed at fixed rate |

### API Gateway

Single entry point for all client requests, handling routing, authentication, rate limiting, and protocol translation.

### Design Patterns (LLD)

| Pattern | Category | Description |
|---------|----------|-------------|
| **Singleton** | Creational | Ensures only one instance exists |
| **Factory** | Creational | Creates objects without specifying exact class |
| **Observer** | Behavioral | Defines subscription mechanism for events |
| **Strategy** | Behavioral | Defines family of algorithms, interchangeable |
| **Adapter** | Structural | Converts interface of one class to another |
| **Proxy** | Structural | Provides placeholder for another object |

### SOLID Principles

| Principle | Description |
|-----------|-------------|
| **S** - Single Responsibility | Class has one reason to change |
| **O** - Open/Closed | Open for extension, closed for modification |
| **L** - Liskov Substitution | Subtypes must be substitutable for base types |
| **I** - Interface Segregation | No client should depend on methods it doesn't use |
| **D** - Dependency Inversion | Depend on abstractions, not concretions |

### Microservices vs Monolith

| Aspect | Monolith | Microservices |
|--------|----------|---------------|
| **Deployment** | Single unit | Independent services |
| **Scaling** | Scale entire app | Scale individual services |
| **Technology** | Single tech stack | Polyglot |
| **Fault Isolation** | Failure affects whole app | Failure isolated to service |
| **Team Structure** | Centralized teams | Small, autonomous teams |

### Common System Designs

| System | Core Design | Key Concepts |
|--------|-------------|--------------|
| **URL Shortener** | Base62 encoding + key-value store | ID generation, caching, analytics |
| **Twitter Feed** | Fan-out on write vs read | Timeline merging, trending algorithm |
| **WhatsApp** | WebSocket + message queues | E2E encryption, presence, delivery receipts |
| **Netflix** | CDN + adaptive bitrate streaming | Transcoding pipeline, recommendations |
| **Uber** | Geospatial indexing + real-time matching | Geohash, ETA calculation, surge pricing |

---

## FAQ (Top 10)

### Q1: What is the difference between horizontal and vertical scaling?
**A:** Vertical scaling adds resources (CPU, RAM) to a single server. Horizontal scaling adds more servers. Vertical is simpler but has hardware limits; horizontal is more complex but virtually unlimited.

### Q2: What is a load balancer and why is it needed?
**A:** A load balancer distributes incoming traffic across multiple servers. It prevents server overload, improves availability, enables scaling, and provides failover.

### Q3: What is caching and what are common caching strategies?
**A:** Caching stores frequently accessed data in faster storage. Common strategies: Write-through, Cache-aside (lazy load), Read-through, Write-behind.

### Q4: What is the difference between SQL and NoSQL databases?
**A:** SQL databases are relational with ACID properties and fixed schema. NoSQL databases are non-relational with flexible schemas, optimized for specific data models (document, key-value, graph, columnar).

### Q5: What is a CDN?
**A:** Content Delivery Network caches static content at edge servers globally, reducing latency by serving content from the nearest location to users.

### Q6: Explain the CAP theorem.
**A:** A distributed system can provide at most two of three guarantees: Consistency, Availability, Partition Tolerance. Since partitions happen, systems choose CP or AP.

### Q7: What is database sharding and what are its challenges?
**A:** Sharding splits a database across multiple servers. Challenges include: cross-shard queries, hotspots, rebalancing when adding shards, maintaining referential integrity.

### Q8: Compare REST and GraphQL.
**A:** REST uses multiple endpoints with fixed data structures. GraphQL uses a single endpoint with client-specified queries. REST is simpler; GraphQL reduces over/under-fetching.

### Q9: What are message queues and when should you use them?
**A:** Message queues enable asynchronous communication between services. Use for: decoupling services, handling traffic spikes, reliable message delivery, background processing.

### Q10: Design a URL shortener.
**A:** Use a base62 encoder with a unique ID generator (snowflake or DB auto-increment). Store in key-value store (Redis for hot URLs, DynamoDB for persistence). Use 301 redirects. Scale with consistent hashing.

---

## Common Mistakes

| # | Mistake | Why It's Bad | What to Do |
|---|---------|--------------|------------|
| 1 | Jumping into solution without clarifying requirements | May solve the wrong problem | Spend 5 min clarifying scope |
| 2 | Ignoring non-functional requirements | Missing scalability, reliability | Explicitly discuss SLAs |
| 3 | Over-engineering | Wastes time, adds complexity | Start simple, iterate |
| 4 | Not considering failure modes | System fails in production | Discuss fault tolerance |
| 5 | Choosing wrong database | Performance issues later | Match DB to access patterns |
| 6 | No discussion of trade-offs | Shows shallow understanding | Always discuss pros/cons |
| 7 | Skipping capacity estimation | Can't justify architecture choices | Estimate QPS, storage, bandwidth |
| 8 | Not using diagrams | Hard to communicate design | Draw architecture diagrams |

---

## Best Practices

1. **Start with requirements**: Functional + Non-functional (SLA, scale, latency)
2. **Estimate capacity**: QPS, storage, bandwidth numbers
3. **Design data model first**: Schema drives architecture decisions
4. **Start high-level**: Draw boxes and arrows before details
5. **Discuss trade-offs**: Every decision has pros and cons
6. **Address bottlenecks**: Identify and solve hotspots
7. **Consider evolution**: How will the system grow?
8. **Think about operations**: Monitoring, logging, alerting
9. **Security by design**: Auth, encryption, rate limiting from start
10. **Communicate clearly**: Explain reasoning, ask for feedback

---

## Quick Reference

```
CAP: Consistency, Availability, Partition Tolerance (pick 2)
Scaling: Horizontal (more machines) vs Vertical (bigger)
Load Balancing: Round Robin, Least Connections, IP Hash
Caching: Write-through, Write-behind, Cache-aside
Sharding: Range, Hash, Directory-based
Replication: Master-Slave, Master-Master, Sync/Async
Queue: Kafka (streaming), RabbitMQ (traditional)
DB: SQL (ACID), NoSQL (BASE, scale)
Rate Limiting: Token Bucket, Sliding Window
Patterns: Singleton, Factory, Observer, Strategy, Adapter
Principles: SOLID (SRP, OCP, LSP, ISP, DIP)
```

### Key Formulas
- **Little's Law**: L = λW (concurrent users = arrival rate × avg response time)
- **Amdahl's Law**: Speedup = 1 / ((1-p) + p/s) where p = parallelizable fraction, s = speedup
