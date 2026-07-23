---
layout: default
title: Computer Networks
parent: Core CS Fundamentals
---

# Computer Networks

A computer network is a collection of interconnected computing devices that exchange data and share resources. Understanding networking is essential for backend development, system design, and infrastructure roles.

## Key Concepts

| Concept | Description |
|---------|-------------|
| OSI Model | 7-layer reference model: Physical → Data Link → Network → Transport → Session → Presentation → Application |
| TCP/IP Model | 4-layer practical model: Network Access → Internet → Transport → Application |
| TCP | Connection-oriented, reliable, ordered, flow/congestion control |
| UDP | Connectionless, unreliable, fast, low overhead (8-byte header) |
| DNS | Translates domain names to IP addresses using UDP port 53 |
| NAT | Maps private IPs to public IPs (PAT uses port numbers) |
| ARP | Maps IP addresses to MAC addresses on local network |

## TCP vs UDP

| Feature | TCP | UDP |
|---------|-----|-----|
| Connection | 3-way handshake | Connectionless |
| Reliability | ACKs, retransmission | No guarantee |
| Speed | Slower | Faster |
| Header | 20-60 bytes | 8 bytes |
| Use Cases | Web, email, file transfer | DNS, streaming, gaming |

## Common Ports

| Port | Service | Port | Service |
|------|---------|------|---------|
| 22 | SSH | 443 | HTTPS |
| 25 | SMTP | 3306 | MySQL |
| 53 | DNS | 5432 | PostgreSQL |
| 80 | HTTP | 6379 | Redis |

## FAQ (Top 10)

**Q1: What is the TCP 3-way handshake?**
Client sends SYN → Server responds SYN-ACK → Client sends ACK. Both sides now have agreed sequence numbers.

**Q2: What is TCP congestion control?**
Slow Start (exponential cwnd growth), Congestion Avoidance (linear growth), Fast Retransmit (3 duplicate ACKs), Fast Recovery. Algorithms: Tahoe, Reno, CUBIC, BBR.

**Q3: What is the difference between HTTP and HTTPS?**
HTTPS is HTTP encrypted with TLS/SSL. Provides confidentiality, authentication, and integrity. HTTP uses port 80; HTTPS uses port 443.

**Q4: What is a VLAN?**
Virtual LAN logically segments a physical network at Layer 2. Devices on different VLANs need a router to communicate. Uses 802.1Q tagging.

**Q5: What is the difference between IPv4 and IPv6?**
IPv4: 32-bit, ~4.3B addresses, uses NAT. IPv6: 128-bit, 3.4×10^38 addresses, no NAT needed, fixed 40-byte header, built-in IPsec.

**Q6: What is a CDN?**
Content Delivery Network caches content at edge servers globally. Reduces latency by serving users from nearby locations. Examples: Cloudflare, AWS CloudFront.

**Q7: What is a SYN flood attack?**
DDoS attack where attacker sends many SYN packets with spoofed IPs. Prevention: SYN cookies, rate limiting, firewalls.

**Q8: What is the difference between symmetric and asymmetric encryption?**
Symmetric: same key (AES), fast. Asymmetric: public/private key pair (RSA), slower but enables key exchange. TLS uses both.

**Q9: What is subnetting?**
Divides a network into smaller sub-networks. Number of subnets = 2^n (n = borrowed bits). Hosts per subnet = 2^h - 2.

**Q10: What is HTTP/3?**
Built on QUIC (UDP-based). Features: 0-RTT connection, built-in TLS 1.3, no head-of-line blocking, connection migration.

## Common Mistakes

1. Confusing TCP and UDP use cases
2. Forgetting TCP 3-way handshake order (SYN → SYN-ACK → ACK)
3. Mixing up MAC (Layer 2) and IP (Layer 3) addresses
4. Forgetting that DNS primarily uses UDP
5. Confusing NAT and PAT
6. Not understanding subnetting calculations

## Best Practices

1. Understand the "why" behind protocols, not just memorize them
2. Practice subnetting daily for quick mental math
3. Use Wireshark to see real packets
4. Know key numbers: TCP header (20-60 bytes), UDP header (8 bytes), MTU (1500)
5. Draw diagrams of the OSI model and TCP handshake

## Quick Reference

```
Socket = IP Address + Port Number
DNS: UDP port 53 (TCP for zone transfers)
DHCP DORA: Discover → Offer → Request → Acknowledge
TCP Flags: SYN (start), ACK (acknowledge), FIN (close), RST (abort)
Subnetting: /24 = 254 hosts, /25 = 126, /26 = 62, /30 = 2 (point-to-point)
```
