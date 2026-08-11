---
layout: default
title: Backend Development
parent: Specialized Domains
---

# Backend Development

## Introduction

Backend developers build the server-side logic, APIs, databases, and integrations that power apps. Roles: Backend Developer, API Engineer, Microservices Developer, Server Engineer.

## What the Role Does

- Design and build REST/GraphQL APIs.
- Implement business logic, authentication, and authorization.
- Design schemas and write efficient queries (SQL/NoSQL).
- Build microservices, queues, and background jobs.
- Ensure security, caching, logging, and observability.
- Scale services: load balancing, vertical/horizontal scaling.

## Hiring Companies

Every product and service company. Strong backend teams: Meta, Google, Amazon, Stripe, Uber, LinkedIn, and India: Flipkart, Swiggy, Zomato, PhonePe, Razorpay, CRED, plus IT services companies.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| Languages | Java (Spring), Python (FastAPI/Django), Node.js, Go ([27-Python](../../27-Python/), [28-Java](../../28-Java/)) |
| APIs | REST principles, versioning, GraphQL, gRPC ([43-API-Design](../../43-API-Design/)) |
| Databases | SQL modeling, indexes, transactions; NoSQL (Mongo, Redis) ([33-DBMS](../../33-DBMS/), [41-Databases](../../41-Databases/)) |
| Auth & Security | JWT, OAuth2, sessions, rate limiting, input validation |
| Caching | Redis, CDN, cache invalidation strategies |
| Concurrency | Threads, async/await, race conditions, idempotency |
| Messaging | Kafka, RabbitMQ, SQS; event-driven design |
| Deployment | Docker, CI/CD, environment configs ([49-DevOps](../../49-DevOps/)) |
| Observability | Logging, metrics, tracing, error tracking |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Language + SQL deep dive
Weeks 3-4:   Build REST APIs; HTTP, status codes, auth
Weeks 5-6:   Database design, indexing, transactions
Weeks 7-8:   Microservices, queues, caching
Weeks 9-10:  Security, deployment, observability
Weeks 11-12: Mock system-design-lite + live coding rounds
```

## Sample Interview Questions

- Design the backend of a URL shortener or an e-commerce cart.
- How do you handle database transactions and concurrency (lost updates)?
- Explain how you'd scale an API that's failing under load.
- JWT vs OAuth2 vs sessions — when do you use each?
- Write a query to find duplicate email addresses. How do indexes help?
- How do you make an API idempotent?
- What happens when a user hits a login endpoint? Walk through the flow.

## Projects for Portfolio

- A production-style REST API with auth, DB, caching, dockerization, and CI.
- An event-driven microservice that consumes a Kafka queue.
- A rate-limited, paginated API with OpenAPI docs.
- A service with monitoring (Prometheus/Grafana) and structured logs.

## Tools to Learn

- Backend: Spring Boot, FastAPI/Django, Node/Express, Go
- DB: Postgres, MySQL, MongoDB, Redis
- Messaging: Kafka, RabbitMQ, Redis streams, SQS
- Cloud/Deploy: Docker, AWS/GCP, Kubernetes basics
- Observability: Prometheus, Grafana, ELK, Sentry

## Key Links

- Backend file: [82-Backend](../../82-Backend/), [84-Full-Stack](../../84-Full-Stack/)
- Databases: [33-DBMS](../../33-DBMS/), [41-Databases](../../41-Databases/), [26-SQL](../../26-SQL/)
- System Design: [42-System-Design](../../42-System-Design/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Writing CRUD but not understanding database indexing/transactions.
2. Ignoring security basics (auth, validation, rate limiting).
3. No idea about concurrency and idempotency in APIs.
4. Being unable to explain how their API behaves under load.
5. Not knowing their deployed stack (Docker/CI) end-to-end.