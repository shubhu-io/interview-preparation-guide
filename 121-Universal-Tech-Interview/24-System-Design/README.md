# 24 - System Design (High-Level)

> Designing scalable systems end-to-end — the make-or-break interview round.

## What It Covers

- **Core**: Requirements, Estimation (users/QPS/storage), API Design, Data Model
- **Building Blocks**: Load Balancer, Cache (Redis), DB (SQL/NoSQL), Message Queue, CDN, Search, Rate Limiter, CDN
- **Scaling**: Sharding, Replication, Partitioning, Caching Strategies, Consistent Hashing
- **Classics**: URL Shortener, Chat (WhatsApp), Social Feed, Video Streaming, E-commerce Checkout, Ride Hailing, Search, Rate Limiter, Notification Service, Web Crawler

## Sample Interview Questions

1. Design a URL shortener (storage, hashing, redirects).
2. Design WhatsApp — how do you handle millions of concurrent messages?
3. How do you shard a database? What are the trade-offs?
4. Design a notification service.
5. How do you ensure eventual consistency?
6. Design a rate limiter. Where does it live?
7. Design an e-commerce checkout with inventory consistency.

## Prep Tips

- Use one fixed structure every time: requirements → estimation → API → data model → components → deep dive → trade-offs.
- Practice 10 classic designs aloud until the structure is automatic.
- Always state trade-offs and what you'd do at 10x scale.

## Related Repo Folders

- [42-System-Design](../../42-System-Design/)
- [43-API-Design](../../43-API-Design/)
- [44-Distributed-Systems](../../44-Distributed-Systems/)
- [45-Cloud-Computing](../../45-Cloud-Computing/)
- [41-Databases](../../41-Databases/)
