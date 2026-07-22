---
layout: default
title: Networking
parent: Data & Analytics
---

# Networking

## Introduction

Networking is the foundation of modern IT infrastructure, enabling communication between devices, systems, and services across the globe. Understanding networking is essential for system administrators, cloud engineers, DevOps, and cybersecurity professionals.

Networking covers the OSI model, TCP/IP protocols, routing, switching, DNS, DHCP, and security concepts. Strong networking knowledge enables effective troubleshooting, secure infrastructure design, and reliable system deployment.

---

## Key Concepts

| Concept | Description |
|---------|-------------|
| OSI Model | 7-layer networking reference model |
| TCP | Connection-oriented, reliable transport |
| UDP | Connectionless, fast transport |
| DNS | Domain name to IP address translation |
| DHCP | Dynamic IP address assignment |
| NAT | Private to public IP translation |
| VLAN | Virtual LAN for network segmentation |
| Subnetting | Dividing networks into smaller segments |
| BGP | Internet backbone routing protocol |
| Load Balancing | Distributing traffic across servers |
| ARP | Maps IP addresses to MAC addresses |
| ICMP | Diagnostics and error reporting |
| TLS/SSL | Encrypted communication protocols |
| SDN | Software-Defined Networking |

---

## FAQ

### Q1: What is the difference between TCP and UDP?
**A:** TCP is connection-oriented with reliable, ordered delivery. UDP is connectionless, faster, without guarantees. Use TCP for HTTP, email; UDP for DNS, streaming, gaming.

### Q2: What happens when you type a URL in a browser?
**A:** DNS resolution, TCP handshake, TLS handshake (HTTPS), HTTP request/response, browser renders page. Involves DNS, TCP, TLS, HTTP protocols across multiple layers.

### Q3: What is subnetting?
**A:** Dividing a network into smaller sub-networks. Uses subnet mask to separate network and host portions of IP addresses. Improves security, performance, and organization.

### Q4: What is DNS and how does it work?
**A:** Translates domain names to IP addresses. Recursive process: local cache, recursive resolver, root servers, TLD servers, authoritative servers. Results are cached at each level.

### Q5: What is the OSI model?
**A:** 7-layer reference model: Physical, Data Link, Network, Transport, Session, Presentation, Application. Each layer has specific functions and communicates with adjacent layers.

### Q6: What is DHCP?
**A:** Dynamic Host Configuration Protocol automatically assigns IP addresses and network configuration to devices. Process: Discover, Offer, Request, Acknowledge (DORA).

### Q7: What is NAT?
**A:** Network Address Translation maps private IP addresses to public. Conserves IPv4 addresses and adds security. PAT (Port Address Translation) maps multiple private IPs to one public IP using ports.

### Q8: What is the difference between a hub, switch, and router?
**A:** Hub: broadcasts to all ports (Layer 1). Switch: forwards to specific MAC address (Layer 2). Router: forwards between networks using IP addresses (Layer 3).

### Q9: What is a VLAN?
**A:** Virtual LAN segments a physical network into logical broadcast domains. Improves security, reduces broadcast traffic, and enables flexible network design without physical rewiring.

### Q10: What is a load balancer?
**A:** Distributes incoming traffic across multiple servers. Improves availability, scalability, and reliability. Algorithms: round-robin, least connections, IP hash. Can be hardware or software.

---

## Common Mistakes

1. Not understanding subnetting
2. Confusing TCP and UDP use cases
3. Ignoring DNS as a critical component
4. Not implementing proper network segmentation
5. Skipping basic troubleshooting steps
6. Not monitoring network performance
7. Ignoring security in network design
8. Not planning for redundancy
9. Confusing Layer 2 and Layer 3 concepts
10. Not documenting network architecture

---

## Best Practices

1. Document network architecture thoroughly
2. Implement defense in depth
3. Use network segmentation for security
4. Monitor network performance continuously
5. Plan for redundancy and failover
6. Regular security audits and penetration testing
7. Implement proper logging and alerting
8. Use configuration management for network devices
9. Keep firmware and software updated
10. Follow industry standards and best practices

---

## Quick Reference

### Common Ports

| Port | Protocol | Service |
|------|----------|---------|
| 20/21 | TCP | FTP |
| 22 | TCP | SSH |
| 23 | TCP | Telnet |
| 25 | TCP | SMTP |
| 53 | TCP/UDP | DNS |
| 67/68 | UDP | DHCP |
| 80 | TCP | HTTP |
| 443 | TCP | HTTPS |
| 3389 | TCP | RDP |

### Subnet Quick Reference

| CIDR | Mask | Hosts |
|------|------|-------|
| /24 | 255.255.255.0 | 254 |
| /25 | 255.255.255.128 | 126 |
| /26 | 255.255.255.192 | 62 |
| /27 | 255.255.255.224 | 30 |
| /28 | 255.255.255.240 | 14 |
| /30 | 255.255.255.252 | 2 |

### OSI Layer Reference

| Layer | Name | Protocols | Devices |
|-------|------|-----------|---------|
| 7 | Application | HTTP, DNS, SMTP | - |
| 6 | Presentation | SSL/TLS | - |
| 5 | Session | NetBIOS | - |
| 4 | Transport | TCP, UDP | - |
| 3 | Network | IP, ICMP | Router |
| 2 | Data Link | Ethernet | Switch |
| 1 | Physical | - | Hub, Cable |

### Troubleshooting Commands

| Command | Purpose | Example |
|---------|---------|---------|
| ping | Test connectivity | `ping 8.8.8.8` |
| traceroute | Trace packet path | `traceroute google.com` |
| nslookup | DNS resolution | `nslookup example.com` |
| netstat | Network statistics | `netstat -tuln` |
| ipconfig/ifconfig | IP configuration | `ipconfig /all` |
| arp | ARP table | `arp -a` |

---

## Learning Roadmap

### Phase 1: Fundamentals (Week 1-2)
- OSI model and TCP/IP stack
- IP addressing and subnetting
- Ethernet and switching basics

### Phase 2: Core Protocols (Week 3-4)
- TCP vs UDP
- DNS, DHCP, HTTP/HTTPS
- ARP, ICMP

### Phase 3: Routing and Switching (Week 5-6)
- Routing protocols (OSPF, BGP, RIP)
- VLANs and trunking
- NAT and PAT

### Phase 4: Security (Week 7-8)
- Firewalls
- VPN (IPsec, SSL)
- Network monitoring

### Phase 5: Advanced (Week 9-12)
- SDN and network virtualization
- Load balancing
- Cloud networking
- Troubleshooting methodology
