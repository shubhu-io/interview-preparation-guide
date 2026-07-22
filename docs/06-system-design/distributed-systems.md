---
layout: default
title: Distributed Systems
parent: System Design
---

# Distributed Systems

## Introduction

Distributed Systems are collections of independent computers that appear as a single coherent system to users. They enable scalability, reliability, and fault tolerance by distributing computation and data across multiple nodes.

### Key Challenges

| Challenge | Description |
|-----------|-------------|
| Partial Failure | Some nodes fail while others continue |
| Concurrency | Multiple nodes access shared resources |
| Network Unreliability | Messages can be lost, delayed, or duplicated |
| Consistency | Keeping data consistent across nodes |
| Ordering | Maintaining consistent order of events |

---

## Key Concepts

### CAP Theorem

In a distributed system, you can only guarantee two of three properties:
- **Consistency (C)** — Every read receives the most recent write
- **Availability (A)** — Every request receives a response
- **Partition Tolerance (P)** — System continues despite network partitions

**In practice:** Network partitions are inevitable, so you must choose between CP and AP:
- **CP systems** — Sacrifice availability for consistency (HBase, MongoDB)
- **AP systems** — Sacrifice consistency for availability (Cassandra, DynamoDB)

### Consistency Models

| Model | Description | Use Case |
|-------|-------------|----------|
| Strong | All nodes see same data at same time | Banking |
| Sequential | Operations appear in some sequential order | Most applications |
| Causal | Causally related operations seen in order | Collaborative editing |
| Eventual | All nodes converge to same state eventually | Social media |

### Consensus Algorithms

**Raft (Easier to understand):**
- Leader-based consensus
- Leader handles all client requests
- Log replication to followers
- Majority quorum for committing entries
- Used in etcd, CockroachDB

**Paxos:**
- Nodes propose values, majority must agree
- Complex but proven correct

### Replication Strategies

- **Synchronous**: Write confirmed after all replicas confirm. Strong consistency, higher latency.
- **Asynchronous**: Write confirmed immediately. Eventual consistency, lower latency, risk of data loss.
- **Semi-Synchronous**: Balance of consistency and latency.

### Partitioning/Sharding

**Strategies:**
- **Hash-based** — Hash(key) % num_shards
- **Range-based** — Divide key space into ranges
- **Directory-based** — Lookup service maps keys to shards

**Challenges:** Hotspots, rebalancing, cross-shard queries.

### Distributed Transactions

**Two-Phase Commit (2PC):**
1. Coordinator asks all participants to prepare
2. Participants vote yes/no
3. If all yes: coordinator sends commit; else: abort

**Saga Pattern:**
Series of local transactions with compensating actions for rollback. More scalable than 2PC, preferred in microservices.

### Fault Tolerance

**Fail-Stop:** Node halts and is detected by others.
**Crash Recovery:** Node fails and recovers; must handle state recovery.
**Byzantine:** Node can behave arbitrarily (malicious or buggy).

**Redundancy Types:**
- Replication — Multiple copies of data
- Redundant hardware — Backup servers
- Geographic distribution — Data centers in multiple regions

### Service Discovery

**Problem:** How do services find each other in a dynamic environment?

**Solutions:**
- DNS-based — DNS records point to service instances
- Service registry — Central registry (Consul, etcd)
- Peer-to-peer — Nodes discover each other directly

### Circuit Breaker Pattern

Prevents cascade failures by stopping calls to a failing service.

**States:**
1. **Closed** — Normal operation; requests pass through
2. **Open** — Failure detected; requests fail immediately
3. **Half-Open** — Test if service recovered; limited requests pass

### Load Balancing Algorithms

- **Round Robin** — Distribute sequentially
- **Least Connections** — Send to server with fewest connections
- **Weighted** — Distribute based on server capacity
- **IP Hash** — Hash client IP to determine server
- **Least Response Time** — Send to fastest responding server

---

## FAQ (Top 10)

### Q1: Explain the CAP theorem with real-world examples.
**A:** CP example: Banking system — must ensure consistency even if some nodes are unavailable. AP example: Social media feed — must remain available even if some nodes have slightly stale data.

### Q2: What is eventual consistency and when is it acceptable?
**A:** All nodes will converge to the same value if no new updates are made. Acceptable when: brief inconsistencies are tolerable, high availability is more important than immediate consistency (DNS, social media).

### Q3: How does Raft consensus work?
**A:** Raft elects a leader to coordinate. (1) Leader election — nodes start as followers; candidate requests votes; majority wins. (2) Log replication — leader receives requests, replicates to followers. (3) Commitment — once majority acknowledge, entry is committed.

### Q4: Design a distributed cache.
**A:** Use consistent hashing to distribute keys. Replicate each key on N nodes. LRU or LFU eviction. Configurable consistency (strong or eventual). Handle failures by routing to next node in hash ring.

### Q5: What is the difference between 2PC and Sagas?
**A:** 2PC: Atomic commit, blocking protocol. Sagas: Series of local transactions with compensating actions, non-blocking, eventually consistent. Sagas preferred in microservices.

### Q6: What is consistent hashing?
**A:** Maps servers and keys to a hash ring. When a server is added/removed, only neighboring keys are redistributed, minimizing data movement. Critical for distributed caches.

### Q7: What is a quorum?
**A:** Minimum number of nodes that must agree for an operation to succeed. Formula: W + R > N (W=write replicas, R=read replicas, N=total replicas).

### Q8: What is the circuit breaker pattern?
**A:** Prevents cascade failures by stopping calls to a failing service. States: Closed (normal), Open (failing), Half-Open (testing recovery).

### Q9: What is a vector clock?
**A:** Vector of timestamps tracking causal relationships between events across nodes. Used for conflict detection in distributed systems.

### Q10: What is the Gossip protocol?
**A:** Protocol where nodes exchange state information with random peers periodically. Used for membership detection and failure detection in distributed systems.

---

## Common Mistakes

| Mistake | Problem | Solution |
|---------|---------|----------|
| Ignoring network failures | Assumes perfect network | Handle timeouts, retries, circuit breakers |
| Assuming synchronous calls | Creates cascading failures | Use async messaging, timeouts |
| Single point of failure | Entire system fails | Redundancy at every level |
| Ignoring clock skew | Distributed timestamps unreliable | Use logical clocks, not wall time |
| Not handling partial failures | System in inconsistent state | Design for failure at every step |

---

## Best Practices

1. **Assume everything will fail** — Design for failure, not just success
2. **Use idempotent operations** — Safe to retry
3. **Implement circuit breakers** — Prevent cascade failures
4. **Monitor everything** — Distributed tracing, metrics, logs
5. **Use timeouts** — Don't wait forever
6. **Design for observability** — You can't fix what you can't see
7. **Test failure scenarios** — Chaos engineering
8. **Keep it simple** — Distributed systems are hard; minimize complexity

---

## Quick Reference

```
CAP THEOREM
C = Consistency (all nodes see same data)
A = Availability (every request gets response)
P = Partition Tolerance (works despite network failures)
Choose 2 of 3; in practice, always P, choose C or A

CONSENSUS (Raft)
Leader election → Log replication → Commitment
Majority quorum required for decisions

REPLICATION
Synchronous: Strong consistency, higher latency
Asynchronous: Eventual consistency, lower latency
Quorum: W + R > N for consistency

PARTITIONING
Hash-based: hash(key) % num_shards
Range-based: divide key space into ranges

FAULT TOLERANCE
Redundancy: Multiple copies
Failover: Automatic switch to backup

PATTERNS
Circuit Breaker: Stop calling failing service
Saga: Compensating transactions for distributed TX
CQRS: Separate read/write models
Event Sourcing: Store events, not state
```
