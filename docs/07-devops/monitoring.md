---
layout: default
title: Monitoring & Observability
parent: DevOps & Cloud
---

# Monitoring & Observability
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Introduction

Monitoring and observability are essential practices for understanding system behavior, detecting issues, and ensuring reliability. Monitoring involves collecting and analyzing metrics, logs, and traces, while observability enables understanding system internal state from external outputs.

Modern distributed systems require comprehensive monitoring to maintain reliability, performance, and security. The three pillars of observability—metrics, logs, and traces—provide complete visibility into system behavior.

---

## Key Concepts

### Three Pillars of Observability

| Pillar | Description | Example Tools |
|--------|-------------|---------------|
| **Metrics** | Numerical measurements over time (CPU, memory, request count) | Prometheus, Grafana, Datadog |
| **Logs** | Discrete event records with timestamps and context | ELK Stack, Fluentd, Loki |
| **Traces** | Request flow through distributed systems | Jaeger, Zipkin, OpenTelemetry |

### SLAs, SLOs, SLIs

- **SLI (Service Level Indicator)**: Metric measuring service performance (e.g., latency, availability)
- **SLO (Service Level Objective)**: Target value for SLI (e.g., 99.9% availability)
- **SLA (Service Level Agreement)**: Contract defining consequences of missing SLO

### Four Golden Signals (Google SRE)

1. **Latency**: Time to serve a request
2. **Traffic**: Demand placed on system
3. **Errors**: Rate of failed requests
4. **Saturation**: How full service is

### RED Method (Weaveworks)

- **Rate**: Requests per second
- **Errors**: Errors per second
- **Duration**: Distribution of request latencies

### USE Method (Brendan Gregg)

- **Utilization**: Percentage of resource used
- **Saturation**: Degree of queued work
- **Errors**: Error count

### Metric Types

| Type | Description | Example |
|------|-------------|---------|
| Counter | Monotonically increasing value | Request count |
| Gauge | Value that can increase or decrease | Temperature |
| Histogram | Distribution of values | Request latency |
| Summary | Calculated quantiles | p99 latency |

---

## FAQ (Top 10)

### Q1: What is the difference between monitoring and observability?
**A:** Monitoring tells you what's broken; observability tells you why. Monitoring uses predefined metrics and alerts; observability enables ad-hoc exploration of system state.

### Q2: What are SLAs, SLOs, and SLIs?
**A:** SLI: Metric measuring performance. SLO: Target value for SLI. SLA: Contract with consequences for missing SLO. Example: 99.9% availability SLO with financial penalties.

### Q3: What is the difference between Prometheus and Grafana?
**A:** Prometheus collects and stores metrics. Grafana visualizes metrics with dashboards. Prometheus includes Alertmanager for alerting.

### Q4: What is structured logging?
**A:** Logging in a structured format (JSON) with consistent fields. Enables easier parsing, filtering, and analysis compared to unstructured text logs.

### Q5: What is distributed tracing?
**A:** Tracking requests as they flow through multiple services. Provides visibility into service dependencies and performance bottlenecks.

### Q6: What is the ELK Stack?
**A:** Elasticsearch (search/analytics), Logstash (log processing), Kibana (visualization). Popular centralized logging solution.

### Q7: What is OpenTelemetry?
**A:** Vendor-neutral standard for collecting telemetry data (metrics, logs, traces). Provides SDKs and collectors for instrumentation.

### Q8: What is alert fatigue?
**A:** Condition where too many alerts cause responders to ignore or delay responding. Caused by noisy, non-actionable alerts.

### Q9: What is a runbook?
**A:** Step-by-step procedures for responding to specific alerts. Helps responders handle incidents consistently and quickly.

### Q10: What is the difference between pull and push metrics?
**A:** Pull: Prometheus scrapes metrics from endpoints. Push: Applications push metrics to collector (Pushgateway, StatsD).

---

## Common Mistakes

1. **Too many alerts** - Creating noisy alerts that cause alert fatigue
2. **Not having runbooks** - No documentation for responding to alerts
3. **Ignoring log levels** - Not using appropriate log levels, making debugging difficult
4. **No retention policies** - Keeping all data forever, increasing costs
5. **Missing dashboards** - No visibility into system health and performance
6. **Not monitoring dependencies** - External services not monitored
7. **Alerting on symptoms, not causes** - Alerting on CPU instead of user-facing issues
8. **No synthetic monitoring** - Not proactively testing user-facing services
9. **Ignoring distributed tracing** - Not implementing tracing in microservices
10. **No postmortem process** - Not learning from incidents

---

## Best Practices

### Metrics
- Follow RED/USE methods
- Use meaningful labels
- Set appropriate retention
- Implement recording rules for expensive queries
- Use histograms for latency

### Logging
- Use structured logging (JSON)
- Include context (request ID, user ID)
- Set appropriate log levels
- Implement log aggregation
- Use correlation IDs

### Tracing
- Implement distributed tracing
- Use sampling strategies
- Propagate context across services
- Instrument critical paths

### Alerting
- Alert on symptoms, not causes
- Make alerts actionable
- Include runbook links
- Implement escalation policies
- Regular alert review

### Dashboards
- Follow four golden signals
- Include service dependencies
- Show error rates and latency
- Add business metrics
- Keep dashboards simple

---

## Quick Reference

### Prometheus Queries
```promql
# Request rate
rate(http_requests_total[5m])

# Error rate
sum(rate(http_requests_total{status=~"5.."}[5m])) / sum(rate(http_requests_total[5m]))

# 99th percentile latency
histogram_quantile(0.99, sum(rate(http_request_duration_seconds_bucket[5m])) by (le))

# Top 5 services by error rate
topk(5, sum(rate(http_requests_total{status=~"5.."}[5m])) by (service))

# CPU usage per instance
100 - (avg by(instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
```

### Log Analysis Commands
```bash
grep "ERROR" /var/log/app.log           # Search logs
grep -c "ERROR" /var/log/app.log        # Count errors
tail -f /var/log/app.log                # Tail logs
cat log.json | jq '.message'            # Parse JSON logs
```

### Alert Rules Example
```yaml
groups:
  - name: application
    rules:
      - alert: HighErrorRate
        expr: |
          sum(rate(http_requests_total{status=~"5.."}[5m])) by (service)
          /
          sum(rate(http_requests_total[5m])) by (service)
          > 0.05
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "High error rate for {{ $labels.service }}"

      - alert: HighLatency
        expr: |
          histogram_quantile(0.99,
            sum(rate(http_request_duration_seconds_bucket[5m])) by (le, service)
          ) > 1
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "High latency for {{ $labels.service }}"
```

### Docker Compose Monitoring Stack
```yaml
version: '3.8'
services:
  prometheus:
    image: prom/prometheus
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin
  alertmanager:
    image: prom/alertmanager
    ports:
      - "9093:9093"
```
