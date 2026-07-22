---
layout: default
title: Azure
parent: System Design
---

# Microsoft Azure

## Introduction

Microsoft Azure is a comprehensive cloud computing platform offering over 200 services including compute, storage, networking, databases, AI/ML, DevOps, and more. Azure provides hybrid cloud capabilities through Azure Arc and seamless integration with Microsoft 365 and Active Directory.

---

## Key Concepts

### Azure Resource Manager (ARM)

ARM is the deployment and management service for Azure. Key concepts:
- **Resource Group**: Logical container for resources
- **Resource Provider**: Service that manages resources
- **Template**: Declarative JSON file for deploying resources
- **Tag**: Name-value pairs for organizing resources

### Compute Options

| Service | Use Case | Scaling | Management |
|---------|----------|---------|------------|
| VMs | Full OS control | Manual/VMSS | IaaS |
| App Service | Web apps, APIs | Auto-scale | PaaS |
| Functions | Event-driven code | Per-execution | Serverless |
| Container Instances | Simple containers | Manual | Serverless containers |
| AKS | Container orchestration | Cluster autoscaler | Managed Kubernetes |

### Storage Options

- **Blob Storage**: Object storage for unstructured data (images, documents, backups)
- **File Storage**: Managed file shares (SMB/NFS protocol)
- **Queue Storage**: Message queue for async communication
- **Table Storage**: NoSQL key-value store for semi-structured data
- **Disk Storage**: Managed disks for VMs

**Storage Redundancy:**
- **LRS**: 3 copies in one datacenter
- **ZRS**: 3 copies across availability zones
- **GRS**: LRS + async replication to paired region
- **RA-GRS**: GRS + read access to secondary region

### Databases

| Service | Description | Use Case |
|---------|-------------|----------|
| Azure SQL Database | Fully managed relational (PaaS) | Complex queries, ACID |
| Cosmos DB | Globally distributed multi-model NoSQL | Global apps, low latency |
| Azure Database for MySQL/PostgreSQL | Managed open-source | Standard relational |
| Azure Cache for Redis | In-memory cache | High-performance caching |

### Networking

| Service | Description |
|---------|-------------|
| Virtual Network (VNet) | Isolated network environment |
| Load Balancer | Layer 4 (TCP/UDP) load balancing |
| Application Gateway | Layer 7 (HTTP/HTTPS) with WAF |
| Azure Front Door | Global load balancing with CDN |
| Traffic Manager | DNS-based global load balancing |
| Azure CDN | Content delivery network |
| VPN Gateway | Encrypted connection to on-premises |
| ExpressRoute | Private dedicated connection |

### Identity and Security

- **Azure AD**: Cloud-based identity and access management
- **RBAC**: Role-Based Access Control for resource authorization
- **Managed Identity**: Eliminates credentials in code
- **Key Vault**: Secrets, keys, and certificates management
- **Azure Security Center**: Unified security management

### Azure DevOps

| Service | Description |
|---------|-------------|
| Azure DevOps | Git repos, CI/CD pipelines, Agile planning |
| Azure Pipelines | Build and release automation |
| ARM Templates | Infrastructure as Code (JSON) |
| Bicep | Simplified ARM template language |

### Monitoring

| Service | Description |
|---------|-------------|
| Azure Monitor | Metrics, logs, alerts |
| Application Insights | Application performance monitoring |
| Log Analytics | Query and analyze log data |

### Azure Policy and Governance

- **Azure Policy**: Evaluates resources against organizational standards
- **Azure Blueprints**: Repeatable environment definitions
- **Resource Locks**: Prevent accidental deletion/modification
- **Cost Management**: Budgets, alerts, and cost analysis

---

## FAQ (Top 10)

### Q1: What is the difference between Azure Load Balancer and Application Gateway?
**A:** Load Balancer operates at Layer 4 (TCP/UDP) for simple load balancing. Application Gateway operates at Layer 7 (HTTP/HTTPS) with SSL termination, URL-based routing, and WAF capabilities.

### Q2: How does Azure Cosmos DB differ from Azure SQL Database?
**A:** Cosmos DB is multi-model NoSQL with turnkey global distribution, unlimited scale, and single-digit ms latency. Azure SQL Database is relational (PaaS) with ACID transactions.

### Q3: What are Azure Availability Zones?
**A:** Physically separate locations within an Azure region with independent power, cooling, and networking. They protect applications from datacenter-level failures.

### Q4: Explain Azure Managed Disks and their types.
**A:** Ultra Disks (high IOPS), Premium SSD (production), Standard SSD (web servers), Standard HDD (backup). Sizes from 4 GiB to 64 TiB.

### Q5: What is Azure Functions and what are its hosting plans?
**A:** Serverless compute for event-driven code. Consumption (auto-scaling, pay-per-use), Premium (pre-warmed instances, vNet support), Dedicated (App Service plan).

### Q6: Explain Azure Blob Storage access tiers.
**A:** Hot: Frequent access, highest storage cost. Cool: Infrequent (30+ days). Archive: Rare access (180+ days), lowest storage cost, rehydration required.

### Q7: How do you secure an Azure SQL Database?
**A:** Azure AD authentication, Transparent Data Encryption, Always Encrypted, Dynamic Data Masking, Azure Defender for SQL, Private Endpoints, Azure Policy.

### Q8: What is Azure Virtual Network Peering?
**A:** Connects two VNets through Azure backbone. Enables resources in different VNets to communicate with low latency. Global peering connects VNets across regions.

### Q9: How does Azure Front Door differ from Traffic Manager?
**A:** Front Door: global HTTP load balancing with SSL offloading, caching, WAF. Traffic Manager: DNS-based load balancing. Front Door for web apps; Traffic Manager for non-HTTP.

### Q10: What are the built-in RBAC roles?
**A:** Owner (full access + role assignment), Contributor (full access except role assignment), Reader (view-only), User Access Administrator (manage user access).

---

## Common Mistakes

1. **Not using managed identities** — Hard-coding credentials instead of using Azure AD managed identities
2. **Ignoring resource tagging** — Not implementing consistent tagging for cost allocation
3. **Over-provisioning VMs** — Choosing VM sizes based on peak load without autoscaling
4. **Single-region deployments** — Deploying all resources in one region without geo-redundancy
5. **Not using Azure Policy** — Allowing non-compliant resources without policy enforcement
6. **Public endpoints for databases** — Exposing SQL Database to public internet instead of Private Endpoints

---

## Best Practices

### Security
- Enable Azure Defender for all resource types
- Use Private Endpoints for PaaS services
- Implement just-in-time VM access
- Enable MFA for all administrative accounts

### Performance
- Use proximity placement groups for latency-sensitive workloads
- Implement caching with Azure Cache for Redis
- Choose appropriate VM series for workload type
- Use Premium Storage for production workloads

### Cost Optimization
- Implement Azure Advisor recommendations
- Use Azure Reservations for predictable workloads
- Auto-shutdown development VMs
- Use Blob Storage lifecycle management

### Reliability
- Deploy across availability zones
- Implement health probes for load balancing
- Use Azure Site Recovery for disaster recovery
- Implement circuit breaker pattern for external dependencies

---

## Quick Reference

```
AZURE CLI QUICK COMMANDS:
az login                          # Login
az account list -o table          # List subscriptions
az resource list -o table         # List resources
az vm start -g myRG -n myVM      # Start VM
az vm stop -g myRG -n myVM       # Stop VM

COMPUTE: VMs (IaaS), App Service (PaaS), Functions (Serverless), AKS (Kubernetes)
STORAGE: Blob (Object), File (File share), Queue (Messages), Table (NoSQL)
DATABASES: Azure SQL, Cosmos DB, MySQL/PostgreSQL, Redis Cache
NETWORKING: VNet, Load Balancer (L4), Application Gateway (L7), Front Door (Global)
IDENTITY: Azure AD, Key Vault, RBAC, Managed Identity

ARM TEMPLATE STRUCTURE:
{
  "$schema": "...",
  "contentVersion": "1.0.0.0",
  "parameters": {},
  "variables": {},
  "resources": [],
  "outputs": {}
}
```
