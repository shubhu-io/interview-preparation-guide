---
layout: default
title: Cybersecurity
parent: Specialized Domains
---

# Cybersecurity

## Introduction

Cybersecurity protects systems, networks, and data from attacks. Roles: Security Engineer, SOC Analyst, Penetration Tester, Application Security Engineer, Security Analyst, GRC Analyst.

## What the Role Does

- Test applications for vulnerabilities (OWASP Top 10) and fix them.
- Monitor and respond to security incidents (SOC).
- Perform penetration testing, vulnerability assessment, red teaming.
- Implement IAM, encryption, and secure configurations.
- Manage compliance (ISO 27001, GDPR, SOC 2, PCI-DSS).
- Threat modeling and security architecture review.

## Hiring Companies

Dedicated security teams at banks and fintech (JPMorgan, Razorpay, PhonePe), tech (Google, Microsoft, CrowdStrike, Palo Alto), and IT services (TCS Cyber, IBM Security, Accenture Security), plus government (CERT-In ecosystem).

## Core Topics

| Topic | What to Know |
|-------|--------------|
| Networking & OS | TCP/IP, DNS, HTTP(S), Linux/Windows security ([76-Networking](../../76-Networking/)) |
| Web Security | OWASP Top 10, XSS, SQLi, CSRF, SSRF, auth flaws ([58-Security](../../58-Security/)) |
| Cryptography | Hashing, symmetric/asymmetric, PKI, TLS, key management |
| Network Security | Firewalls, IDS/IPS, VPN, zero trust |
| Pentesting | Burp Suite, Nmap, Metasploit, reconnaissance → exploitation → report |
| Incident Response | Detection, containment, eradication, recovery, forensics |
| IAM | Authentication, authorization, MFA, RBAC, SSO/SSO protocols |
| Compliance | ISO 27001, SOC 2, GDPR, PCI-DSS, HIPAA basics |
| Cloud Security | IAM, hardening, misconfig scans (AWS/GCP/Azure) |
| Malware & Forensics | Basic analysis, logs, memory/disk forensics concepts |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   Networking, OS commands, Linux hardening basics
Weeks 3-4:   Web security: OWASP Top 10 + hands-on (TryHackMe/PortSwigger labs)
Weeks 5-6:   Cryptography + auth & IAM concepts
Weeks 7-8:   Pentesting methodology + Burp Suite/Nmap practice
Weeks 9-10:  Incident response + cloud security + compliance basics
Weeks 11-12: Mock scenario rounds + capture-the-flag practice
```

## Sample Interview Questions

- Explain how XSS works and how to prevent it.
- A user reports their account was hacked. Walk me through your response.
- How does TLS work (handshake)?
- What is the difference between hashing and encryption?
- How would you harden a public-facing Linux web server?
- What is SSRF and why is it dangerous? How do you fix it?
- Explain least privilege and how you'd enforce it in AWS.

## Projects for Portfolio

- Write-up of a responsible-disclosure / CTF / TryHackMe room walkthrough.
- A web app security assessment report (Scope → Findings → Fixes).
- A hardened Linux/Docker baseline with security checklist.
- A home-lab SIEM (e.g., pfSense/Wazuh) with alert rules.

## Tools to Learn

- Web: Burp Suite, OWASP ZAP, PortSwigger Web Security Academy
- Network: Nmap, Wireshark, Netcat, firewall config
- Pentest: Metasploit, John-the-Ripper, SQLMap
- OS: Kali Linux, Linux hardening basics
- Cloud: ScoutSuite, Prowler (AWS misconfig scanning)
- Practice: TryHackMe, HackTheBox, PortSwigger Academy, CTFtime

## Key Links

- Security folders: [58-Security](../../58-Security/), [75-Cybersecurity](../../75-Cybersecurity/)
- Networking: [76-Networking](../../76-Networking/), [34-Computer-Networks](../../34-Computer-Networks/)
- Linux: [40-Linux](../../40-Linux/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Knowing attack names but not the fix (defenders must fix).
2. No hands-on practice — CTF/lab experience is mandatory.
3. Ignoring incident response process (detection → containment).
4. Weak networking and OS fundamentals.
5. Treating compliance as separate from engineering — it's integrated.