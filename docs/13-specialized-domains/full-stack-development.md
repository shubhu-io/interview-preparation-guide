---
layout: default
title: Full Stack Development
parent: Specialized Domains
---

# Full Stack Development

## Introduction

Full stack developers own the entire product layer — frontend, backend, database, and often deployment. Roles: Full Stack Developer, MERN/MEAN Developer, Product Engineer. Expect breadth plus depth in one area.

## What the Role Does

- Build both UI (React/Vue/Angular) and APIs (Node/Python/Java).
- Design database schemas and write queries.
- Integrate services, auth, payments, notifications.
- Deploy to cloud (Vercel, Netlify, AWS, Docker) and set up CI/CD.
- Ship features end-to-end: requirement → DB → API → UI → deploy.

## Hiring Companies

Startups especially (they need breadth). Product companies: Flipkart, Swiggy, Zomato, Razorpay, CRED, Meesho; agencies and IT services too.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| Frontend | React + state + styling ([Frontend Development](frontend-development)) |
| Backend | Node/Express or Python FastAPI/Django ([Backend Development](backend-development)) |
| Database | Postgres/MySQL/Mongo, ORM, migrations |
| Auth | JWT, OAuth2, role-based access control |
| Dev Tools | Git, GitHub Actions ([54-Git](../../54-Git/), [55-GitHub](../../55-GitHub/)) |
| Deployment | Vercel, Netlify, Railway, AWS EC2/Lambda, Docker |
| Testing | Unit + integration + E2E |
| Basics | HTTP, rest APIs, state management, env/config |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Refresh HTML/CSS/JS + backend intro
Weeks 3-4:   Build a full app with React + Node + a database
Weeks 5-6:   Auth, routes, and state management
Weeks 7-8:   Deploy to production + CI/CD + testing
Weeks 9-10:  Optimize performance + security basics
Weeks 11-12: Mock system + live coding rounds; polish portfolio
```

## Sample Interview Questions

- Build a full-stack todo app: DB schema, API, and UI — walk me through it.
- How do you handle authentication end-to-end?
- Explain how you'd deploy a full-stack app and handle environment configs.
- How do you keep the frontend and backend in sync (types, contracts)?
- What are the security considerations when accepting file uploads?
- How would you scale a full-stack app as users grow?

## Projects for Portfolio

- A full-stack SaaS-style app: auth, CRUD, payments (Stripe test mode), deploy.
- A real-time collaboration app (websockets) with persistent DB.
- An e-commerce demo with cart, orders, and admin panel.
- Each with live URL, GitHub link, README, and demo video.

## Tools to Learn

- Stack: MERN (Mongo/Express/React/Node) or TS + tRPC/Next.js + Postgres
- Build: Vite, Next.js, Docker Compose
- Deploy: Vercel/Railway/AWS, GitHub Actions
- Testing: Jest, Playwright, Supertest

## Key Links

- Full Stack folder: [84-Full-Stack](../../84-Full-Stack/), [81-Web-Development](../../81-Web-Development/)
- Frontend: [Frontend Development](frontend-development)
- Backend: [Backend Development](backend-development)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Knowing frameworks but not the fundamentals underneath (HTTP, DB, security).
2. Building a demo without deploying it — a deployed app is 10x more impressive.
3. No testing at all in the portfolio.
4. Not being able to explain the frontend-backend contract.
5. Weak in one half (usually backend/database) — pick a primary strength.