---
layout: default
title: Networking & Network Engineering
parent: Specialized Domains
---

# Networking & Network Engineering

## Introduction

Network engineers design, build, and maintain enterprise and telecom networks. Roles: Network Engineer, Network Administrator, Cisco Engineer, NOC Engineer, Network Security Engineer, Telecom/RF Engineer.

## What the Role Does

- Configure routers, switches, firewalls, and wireless.
- Implement routing (OSPF, BGP) and switching (VLANs, STP).
- Troubleshoot connectivity and performance issues.
- Design LAN/WAN, network topologies, and redundancy.
- Automate network configs (Python, Ansible).
- Monitor and secure the network edge.

## Hiring Companies

ISPs and telecoms (Airtel, Jio, Vi, BSNL), cloud providers (AWS, GCP, Azure), large enterprises, banks, and network vendors (Cisco, Juniper, Arista, HPE), plus system integrators.

## Core Topics

| Topic | What to Know |
|-------|--------------|
| OSI/TCP-IP | Layers, encapsulation, addressing, TCP/UDP ([34-Computer-Networks](../../34-Computer-Networks/)) |
| Routing | Static, OSPF, BGP, EIGRP; route selection |
| Switching | VLANs, trunking, STP, link aggregation, MAC tables |
| Addressing | IPv4/IPv6, subnetting, NAT, DHCP, DNS |
| Security | Firewalls, ACLs, VPN/IPsec, 802.1X, zero trust ([75-Cybersecurity](../../75-Cybersecurity/)) |
| Wireless | WiFi standards, controllers, RF basics |
| Monitoring | SNMP, NetFlow, packet analysis (Wireshark) |
| Automation | Python scripts, Ansible, NETCONF/YANG, APIs |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   OSI model, subnetting, IPv4/IPv6 mastery
Weeks 3-4:   Switching: VLANs, STP, trunking (labs)
Weeks 5-6:   Routing: static, OSPF, BGP (labs)
Weeks 7-8:   Network security: ACLs, firewalls, VPNs
Weeks 9-10:  Troubleshooting labs + packet analysis
Weeks 11-12: Automation basics + mock troubleshooting rounds
```

## Sample Interview Questions

- Troubleshoot: users in building A can't reach the internet. Walk me through it.
- Explain subnetting — split a /24 into 4 subnets.
- What's the difference between OSPF and BGP? When do you use each?
- Explain STP and why it exists.
- How does DHCP work end-to-end?
- A VIP is unreachable; how do you differentiate network vs application issue?
- How would you secure a branch office connection to HQ?

## Projects for Portfolio

- Lab: Cisco/FRR/Packet Tracer multi-site network with OSPF+BGP and VLANs.
- Packet capture analysis write-up (Wireshark) for a real issue.
- Ansible/Python script that automates device config backups.
- Network diagram + runbook for a medium enterprise.

## Tools to Learn

- Simulators: Cisco Packet Tracer, GNS3, EVE-NG
- Real gear or virtualization: FRRouting (FRR), VyOS, pfSense
- Monitoring: Wireshark, tcpdump, NetFlow, PRTG/Zabbix
- Automation: Python (netmiko, napalm), Ansible
- Certifications (bonus): CCNA, Network+, Juniper JNCIA

## Key Links

- Networking folders: [34-Computer-Networks](../../34-Computer-Networks/), [76-Networking](../../76-Networking/)
- Linux: [40-Linux](../../40-Linux/)
- Cyber: [Cybersecurity](cybersecurity)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. No hands-on labs — theory alone won't pass.
2. Skipping subnetting practice (a guaranteed question).
3. Ignoring troubleshooting flow (layer by layer).
4. Not knowing routing vs switching fundamentals.
5. Weak on security and automation, both huge topics now.