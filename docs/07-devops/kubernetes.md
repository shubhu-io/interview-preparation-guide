---
layout: default
title: Kubernetes
parent: DevOps & Cloud
---

# Kubernetes
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Introduction

Kubernetes (K8s) is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. Originally developed by Google and now maintained by the Cloud Native Computing Foundation (CNCF), Kubernetes has become the industry standard for container orchestration.

Kubernetes provides self-healing, horizontal scaling, service discovery, load balancing, automated rollouts and rollbacks, secret and configuration management, and storage orchestration.

---

## Key Concepts

### Kubernetes Architecture

- **Control Plane**: Manages cluster state (API Server, etcd, Scheduler, Controller Manager)
- **Worker Nodes**: Run application workloads (kubelet, kube-proxy, container runtime)
- **etcd**: Distributed key-value store for cluster state
- **API Server**: Entry point for all cluster communication
- **Scheduler**: Assigns pods to nodes based on constraints
- **Controller Manager**: Maintains desired state through reconciliation loops

### Core Resource Relationships

```
Deployment → ReplicaSet → Pod
Service → Endpoints → Pods
ConfigMap → Pods
Secret → Pods
PersistentVolumeClaim → PersistentVolume
```

### Service Types

| Type | Access | Use Case |
|------|--------|----------|
| ClusterIP | Internal only | Default, service-to-service |
| NodePort | External via node IP | Development, simple exposure |
| LoadBalancer | Cloud load balancer | Production external access |
| ExternalName | DNS alias | External service mapping |

### Pod Lifecycle

```
Pending → Running → Succeeded/Failed
     ↑
     └── CrashLoopBackOff (if failing repeatedly)
```

### Key Objects

| Object | Purpose |
|--------|---------|
| Pod | Smallest deployable unit, one or more containers |
| Deployment | Manages ReplicaSets, declarative updates |
| StatefulSet | Stateful applications with stable identities |
| DaemonSet | Pod runs on all (or selected) nodes |
| Job | Pods that run to completion |
| CronJob | Creates Jobs on a schedule |

---

## FAQ (Top 10)

### Q1: What is the difference between a Pod and a container?
**A:** A pod is the smallest deployable unit that can contain one or more containers. Containers in a pod share network namespace and storage volumes.

### Q2: Explain the difference between a Deployment and a StatefulSet.
**A:** Deployment manages stateless applications with ReplicaSets, providing rolling updates and rollbacks. StatefulSet manages stateful applications with stable network identities, persistent storage, and ordered deployment/scaling.

### Q3: What is a Service in Kubernetes?
**A:** A Service provides a stable network endpoint (IP address and DNS name) for a set of pods. It enables load balancing and service discovery, abstracting away pod IP addresses that change frequently.

### Q4: What is an Ingress?
**A:** Ingress exposes HTTP/HTTPS routes to services within the cluster. It provides URL-based routing, SSL termination, and virtual hosting. Requires an Ingress Controller (Nginx, Traefik, etc.).

### Q5: What is the difference between ConfigMap and Secret?
**A:** ConfigMap stores non-sensitive configuration. Secret stores sensitive data (passwords, keys) with base64 encoding (not encryption). Use external secrets management for production.

### Q6: What are PersistentVolumes and PersistentVolumeClaims?
**A:** PV is a piece of storage in the cluster. PVC is a request for storage by a user. PVCs bind to PVs based on size, access mode, and storage class. Dynamic provisioning creates PVs automatically.

### Q7: What is the difference between liveness and readiness probes?
**A:** Liveness probe checks if container is running; restarts if failed. Readiness probe checks if container can accept traffic; removes from service endpoints if failed.

### Q8: What is Horizontal Pod Autoscaler?
**A:** HPA automatically scales pod replicas based on metrics like CPU utilization, memory usage, or custom metrics. It adjusts replica count to maintain target metrics.

### Q9: What is RBAC?
**A:** Role-Based Access Control authorizes users and service accounts. Roles define permissions; RoleBindings grant roles to subjects. ClusterRoles/ClusterRoleBindings for cluster-wide permissions.

### Q10: What is Helm?
**A:** Helm is a package manager for Kubernetes. It uses Charts (templates) to define, install, and upgrade Kubernetes applications. Charts are configurable and versioned.

---

## Common Mistakes

1. **Not setting resource requests/limits** - Pods can consume unlimited resources, affecting other workloads
2. **Using latest tag** - Unpinned image tags lead to unpredictable deployments
3. **Ignoring pod health checks** - No liveness/readiness probes means traffic goes to unhealthy pods
4. **Not using namespaces** - All resources in default namespace causes naming conflicts
5. **Hard-coding secrets** - Storing sensitive data in ConfigMaps or environment variables
6. **Missing network policies** - Default allows all traffic; should implement deny-by-default
7. **Not implementing RBAC** - Using default service accounts with cluster-admin privileges
8. **Ignoring pod anti-affinity** - Pods ending up on same node, reducing availability
9. **No monitoring or logging** - Deploying without observability tools
10. **Not backing up etcd** - Risk of losing entire cluster state

---

## Best Practices

### Pod Design
- Set resource requests and limits
- Use liveness and readiness probes
- Implement pod anti-affinity for HA
- Use init containers for setup tasks

### Security
- Implement RBAC with least privilege
- Use dedicated service accounts
- Enable pod security standards
- Use network policies

### Operations
- Use Helm for package management
- Implement GitOps workflows
- Monitor with Prometheus and Grafana
- Regular cluster upgrades

---

## Quick Reference

### kubectl Commands
```bash
# Basic Commands
kubectl get pods/services/deployments -A    # List resources
kubectl describe pod/service NAME            # Resource details
kubectl logs pod-name                       # View logs
kubectl exec -it pod-name -- bash           # Shell into pod
kubectl apply -f file.yaml                  # Apply manifest

# Deployment
kubectl create deployment NAME --image=IMG  # Create deployment
kubectl scale deployment NAME --replicas=3  # Scale
kubectl rollout status deployment NAME      # Check rollout
kubectl rollout undo deployment NAME        # Rollback

# Debugging
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl top pods                           # Resource usage
kubectl port-forward pod-name 8080:80       # Port forward
```

### Deployment Manifest
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-app
          image: registry.example.com/my-app:1.0
          ports:
            - containerPort: 8080
          resources:
            requests:
              memory: "256Mi"
              cpu: "250m"
            limits:
              memory: "512Mi"
              cpu: "500m"
          livenessProbe:
            httpGet:
              path: /health
              port: 8080
            initialDelaySeconds: 30
            periodSeconds: 10
          readinessProbe:
            httpGet:
              path: /ready
              port: 8080
            initialDelaySeconds: 5
            periodSeconds: 5
```
