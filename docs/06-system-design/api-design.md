---
layout: default
title: API Design
parent: System Design
---

# API Design

## Introduction

API (Application Programming Interface) Design is the process of defining how software components communicate. Good API design enables developers to build integrations efficiently, ensures consistency across services, and provides a contract between producers and consumers.

### API Types

| Type | Protocol | Use Case |
|------|----------|----------|
| REST | HTTP | Web APIs, CRUD operations |
| GraphQL | HTTP | Flexible data fetching |
| gRPC | HTTP/2 | Internal microservices |
| WebSocket | TCP | Real-time bidirectional |
| Webhook | HTTP | Event-driven notifications |

---

## Key Concepts

### REST Principles

1. **Client-Server** — Separation of concerns
2. **Stateless** — Each request contains all needed information
3. **Cacheable** — Responses must define cacheability
4. **Uniform Interface** — Consistent resource identification
5. **Layered System** — Client can't tell if connected to end server

### HTTP Methods

| Method | Purpose | Idempotent | Safe | Body |
|--------|---------|------------|------|------|
| GET | Retrieve resource | Yes | Yes | No |
| POST | Create resource | No | No | Yes |
| PUT | Replace resource | Yes | No | Yes |
| PATCH | Partial update | No* | No | Yes |
| DELETE | Remove resource | Yes | No | No |

### URL Design Rules

```
GET    /api/v1/users          # List users
GET    /api/v1/users/123      # Get user 123
POST   /api/v1/users          # Create user
PUT    /api/v1/users/123      # Update user 123
DELETE /api/v1/users/123      # Delete user 123
GET    /api/v1/users/123/orders  # List user 123's orders
```

- Use nouns, not verbs (`/users` not `/getUsers`)
- Use plural nouns (`/users` not `/user`)
- Use HTTP methods for actions
- Nest resources for relationships

### Status Codes

**Success (2xx):** 200 OK, 201 Created, 202 Accepted, 204 No Content

**Client Error (4xx):** 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 409 Conflict, 429 Too Many Requests

**Server Error (5xx):** 500 Internal Server Error, 502 Bad Gateway, 503 Service Unavailable

### Pagination

**Cursor-Based (Recommended):**
```json
{
  "data": [...],
  "pagination": {
    "next_cursor": "eyJpZCI6MTIzfQ==",
    "has_more": true,
    "limit": 10
  }
}
```

### Authentication Methods

| Method | Use Case | Security |
|--------|----------|----------|
| API Key | Server-to-server | Medium |
| OAuth 2.0 | Delegated authorization | High |
| JWT | Stateless tokens | High |
| Bearer Token | Token in header | High |

### Rate Limiting Headers

```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 42
X-RateLimit-Reset: 1625097600
Retry-After: 30
```

### Error Response Format (RFC 7807)

```json
{
  "type": "https://api.example.com/errors/validation",
  "title": "Validation Error",
  "status": 422,
  "detail": "The request body contains invalid fields",
  "instance": "/api/v1/users/123",
  "errors": [
    {
      "field": "email",
      "message": "Invalid email format",
      "code": "INVALID_FORMAT"
    }
  ]
}
```

### API Documentation (OpenAPI/Swagger)

YAML/JSON specification describing API endpoints, request/response schemas, and authentication. Key components: OpenAPI version, info (title, version), servers, paths (endpoints), components (schemas, parameters, responses), security schemes.

---

## FAQ (Top 10)

### Q1: Design a REST API for a blog platform.
**A:** Resources: users, posts, comments, tags. Use nested resources for relationships (`/posts/:id/comments`). Support filtering via query parameters (`?author=123&tag=python`). Always paginate collections.

### Q2: How do you handle pagination in a REST API?
**A:** Use cursor-based pagination for consistency. Response includes `data`, `pagination` object with `next_cursor` and `has_more`. Include `Link` header: `Link: <url?cursor=...&limit=10>; rel="next"`.

### Q3: What are idempotency keys?
**A:** Unique identifier sent with a request to ensure duplicate requests are processed only once. Important for: network retries, payment processing, create operations. Implementation: Client generates UUID; server checks cache/database.

### Q4: How do you handle API errors consistently?
**A:** Use RFC 7807 or consistent custom format with: machine-readable error codes, human-readable messages, field-level details for validation, request ID for debugging, documentation link.

### Q5: How do you version a REST API?
**A:** URI versioning is simplest: `/v1/users`, `/v2/users`. Strategy: major version in URI for breaking changes, additive changes don't require versioning, deprecation policy with migration guide.

### Q6: Explain OAuth 2.0 flow for a web application.
**A:** Authorization Code flow: Client redirects to Auth Server → User authenticates → Auth Server redirects back with code → Client exchanges code for access/refresh token → Client uses token for API calls.

### Q7: How do you implement rate limiting?
**A:** Identify clients by API key or IP. Choose algorithm (token bucket for burst, sliding window for smooth). Store state in Redis. Return standard headers. Return 429 with Retry-After when exceeded.

### Q8: How do you design an API that handles file uploads efficiently?
**A:** Use presigned URLs for direct upload to storage (S3). Chunked upload for large files. Separate metadata from file data. Use Tus protocol for resumable uploads. Scan after upload.

### Q9: What are the trade-offs between REST and GraphQL?
**A:** REST: simpler, cacheable, well-understood. GraphQL: reduces over/under-fetching, single endpoint, client-specified queries. REST for simple CRUD; GraphQL for complex data needs.

### Q10: How do you optimize API performance?
**A:** Caching (ETag, Cache-Control), pagination, field selection (`?fields=id,name`), compression (gzip), connection pooling, CDN, async processing, database optimization, HTTP/2.

---

## Common Mistakes

| Mistake | Problem | Solution |
|---------|---------|----------|
| Using verbs in URLs | Not RESTful | Use HTTP methods instead |
| Returning 200 for errors | Confuses clients | Use appropriate status codes |
| No pagination | Returns unbounded data | Always paginate collections |
| Exposing internal IDs | Security risk | Use opaque identifiers |
| Inconsistent error formats | Hard to parse | Standardize error responses |
| No versioning | Breaking changes break clients | Version from day one |

---

## Best Practices

1. **Design for the consumer** — Think about DX first
2. **Use consistent naming** — camelCase or snake_case, stick to one
3. **Document everything** — Use OpenAPI/Swagger
4. **Version from day one** — Even before you think you need it
5. **Validate inputs** — Reject invalid data early
6. **Use proper status codes** — Not everything is 200 or 500
7. **Implement idempotency** — For critical operations
8. **Log requests** — Include request IDs for debugging

---

## Quick Reference

```
HTTP METHODS: GET (Read), POST (Create), PUT (Full update), PATCH (Partial), DELETE (Remove)

STATUS CODES: 200 OK, 201 Created, 202 Accepted, 204 No Content
               400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found
               409 Conflict, 422 Unprocessable, 429 Too Many Requests

URL DESIGN: /api/v1/users          — List users
            /api/v1/users/123      — Get user 123
            /api/v1/users/123/orders — User's orders

PAGINATION: Offset: ?page=3&per_page=10
            Cursor:  ?cursor=abc&limit=10

ERROR FORMAT (RFC 7807):
{
  "type": "...",
  "title": "...",
  "status": 422,
  "detail": "...",
  "instance": "..."
}
```
