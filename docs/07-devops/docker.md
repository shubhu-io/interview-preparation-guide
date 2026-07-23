---
layout: default
title: Docker
parent: DevOps & Cloud
---

# Docker
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Introduction

Docker is a platform for developing, shipping, and running applications in isolated environments called containers. Containers package an application with all its dependencies, libraries, and configuration files, ensuring consistent behavior across development, testing, and production environments.

Docker revolutionized software deployment by solving the "it works on my machine" problem. It provides lightweight, portable, and self-sufficient containers that run anywhere Docker is installed.

---

## Key Concepts

### Containerization vs Virtualization

| Aspect | Containers | Virtual Machines |
|--------|------------|------------------|
| OS | Shared host kernel | Full guest OS |
| Size | Megabytes | Gigabytes |
| Startup | Seconds | Minutes |
| Isolation | Process-level | Hardware-level |
| Performance | Near-native | Overhead |
| Density | Hundreds per host | Tens per host |

### Dockerfile Instructions

| Instruction | Purpose |
|-------------|---------|
| FROM | Base image for the build |
| RUN | Execute commands during build |
| COPY | Copy files from host to container |
| WORKDIR | Set working directory |
| ENV | Set environment variables |
| EXPOSE | Document container's listening port |
| CMD | Default command when container starts |
| ENTRYPOINT | Configure container as executable |
| ARG | Build-time variables |

### Image Layering

Docker images consist of read-only layers. Each Dockerfile instruction creates a new layer:
```
Layer 1: Base image (e.g., ubuntu:22.04)
Layer 2: RUN apt-get update
Layer 3: COPY app code
Layer 4: RUN npm install
Layer 5: CMD ["node", "app.js"]
```

### Docker Networking Modes

1. **Bridge**: Default network, containers communicate through virtual bridge
2. **Host**: Container uses host's network stack (no isolation)
3. **Overlay**: Multi-host networking for Docker Swarm
4. **Macvlan**: Assigns MAC address to container
5. **None**: No networking

### Volume Types

1. **Named Volumes**: Managed by Docker, stored in Docker's storage directory
2. **Bind Mounts**: Map host directory to container directory
3. **tmpfs Mounts**: Stored in host memory only
4. **Volume Drivers**: Plugin-based storage solutions

---

## FAQ (Top 10)

### Q1: What is the difference between Docker and virtual machines?
**A:** Containers share the host OS kernel and are lightweight (MBs, seconds to start). VMs include a full guest OS, are heavier (GBs, minutes to start). Containers provide process-level isolation; VMs provide hardware-level isolation.

### Q2: What is a Docker image and how is it different from a container?
**A:** A Docker image is a read-only template with instructions for creating a container. A container is a runnable instance of an image with a writable layer. You can create multiple containers from one image.

### Q3: Explain Docker layer caching.
**A:** Docker caches each layer of an image. If a layer hasn't changed, Docker uses the cached version instead of rebuilding. Order Dockerfile instructions from least to most frequently changing to maximize cache hits.

### Q4: What is the difference between COPY and ADD?
**A:** COPY simply copies files from host to container. ADD can copy files, download URLs, and automatically extract tar files. Prefer COPY unless you need ADD's additional features, as COPY is more transparent.

### Q5: What is multi-stage build?
**A:** Multi-stage builds use multiple FROM statements to create smaller final images. Build stage includes all dependencies; final stage copies only necessary artifacts. Reduces image size significantly.

### Q6: What is the difference between CMD and ENTRYPOINT?
**A:** CMD provides default arguments that can be overridden. ENTRYPOINT configures the container as an executable. Use ENTRYPOINT for the main command and CMD for default arguments.

### Q7: What are Docker volumes and why use them?
**A:** Volumes store data outside containers, persisting data when containers stop. They're managed by Docker and can be shared between containers. Use volumes for databases, uploads, and any persistent data.

### Q8: How do you reduce Docker image size?
**A:** Use multi-stage builds, choose minimal base images (Alpine), combine RUN commands, remove unnecessary files, use .dockerignore, and avoid installing unnecessary packages.

### Q9: What is Docker Compose and when to use it?
**A:** Docker Compose defines and runs multi-container applications using a YAML file. Use it for development, testing, and single-host deployments. For production with multiple hosts, use Docker Swarm or Kubernetes.

### Q10: How do you debug a Docker container?
**A:** Use docker logs to view output, docker exec to shell into running container, docker inspect for details, and docker stats for resource usage. Check container exit codes for failure reasons.

---

## Common Mistakes

1. **Using latest tag** - Not pinning image versions leads to unexpected changes and broken deployments
2. **Running as root** - Containers running as root have elevated privileges and security risks
3. **Not using .dockerignore** - Including unnecessary files increases build context and image size
4. **Poor layer ordering** - Placing frequently changing instructions early breaks Docker layer caching
5. **No health checks** - Containers without health checks can't be monitored for proper functioning
6. **Ignoring security scanning** - Not scanning images for known vulnerabilities before deployment
7. **Using ADD instead of COPY** - ADD has extra features that can be unexpected; COPY is more explicit
8. **Not cleaning up in RUN commands** - Leaving package manager caches increases image size
9. **Storing state in containers** - Using containers as databases without proper volume management
10. **Exposing unnecessary ports** - Documenting ports that aren't actually used

---

## Best Practices

### Dockerfile
- Use multi-stage builds
- Order instructions from least to most frequently changing
- Combine RUN commands
- Use specific image tags (not `latest`)
- Run as non-root user
- Add HEALTHCHECK instructions
- Use .dockerignore

### Security
- Scan images regularly (Trivy, Snyk, Docker Scout)
- Use minimal base images (Alpine, distroless)
- Don't store secrets in images
- Use Docker secrets or external secret management
- Implement read-only file systems where possible
- Use capability dropping (cap-drop)

### Production
- Use container orchestration (Kubernetes, Docker Swarm)
- Implement monitoring and alerting
- Use centralized logging
- Set resource limits (CPU, memory)
- Plan backup and recovery strategies

---

## Quick Reference

### Docker CLI Commands
```bash
# Image Commands
docker build -t name:tag .        # Build image
docker images                     # List images
docker rmi image:tag              # Remove image
docker push name:tag              # Push to registry
docker pull name:tag              # Pull from registry

# Container Commands
docker run -d --name NAME IMAGE   # Run detached
docker run -it IMAGE bash         # Interactive run
docker ps                         # List running containers
docker stop CONTAINER             # Stop container
docker rm CONTAINER               # Remove container
docker logs CONTAINER             # View logs
docker exec -it CONTAINER bash    # Shell into container
docker stats                      # Resource usage

# Volume Commands
docker volume create NAME         # Create volume
docker volume ls                  # List volumes

# System Commands
docker system df                  # Disk usage
docker system prune -a            # Clean up everything
```

### Docker Compose Commands
```bash
docker-compose up -d              # Start services
docker-compose down               # Stop services
docker-compose ps                 # List services
docker-compose logs SERVICE       # View service logs
docker-compose exec SERVICE bash  # Shell into service
docker-compose build              # Build services
```

### Multi-Stage Build Example
```dockerfile
# Build stage
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production stage
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
USER node
EXPOSE 3000
CMD ["node", "dist/server.js"]
```
