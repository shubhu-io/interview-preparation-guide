---
layout: default
title: Cybersecurity
parent: Data & Analytics
---

# Cybersecurity

## Introduction

Cybersecurity is the practice of protecting systems, networks, and data from digital attacks. It encompasses technologies, processes, and practices designed to safeguard confidentiality, integrity, and availability of information. As cyber threats grow in sophistication, cybersecurity professionals are in high demand across all industries.

The field spans network security, application security, cloud security, incident response, compliance, and risk management. Understanding both offensive (penetration testing) and defensive (security operations) aspects is valuable.

---

## Key Concepts

| Concept | Description |
|---------|-------------|
| CIA Triad | Confidentiality, Integrity, Availability |
| Defense in Depth | Multiple layers of security controls |
| Least Privilege | Minimum necessary access rights |
| Zero Trust | Never trust, always verify |
| Penetration Testing | Authorized simulated attacks |
| Vulnerability | Weakness that can be exploited |
| Threat | Potential cause of unwanted incident |
| Risk | Likelihood x Impact of threat exploiting vulnerability |
| Attack Surface | All points where unauthorized access can occur |
| Encryption | Converting data to unreadable form |
| Hashing | One-way function for integrity verification |
| Social Engineering | Manipulating humans to bypass security |

---

## FAQ

### Q1: What is the CIA Triad?
**A:** Confidentiality (only authorized access), Integrity (data accuracy), Availability (systems accessible). The three fundamental principles of information security.

### Q2: What is the difference between symmetric and asymmetric encryption?
**A:** Symmetric uses one shared key (fast, key distribution problem). Asymmetric uses public/private key pairs (solves key distribution, slower). Often combined: asymmetric for key exchange, symmetric for data.

### Q3: What is a firewall?
**A:** Network security device monitoring incoming/outgoing traffic based on rules. Types: packet filtering, stateful inspection, proxy, next-gen (NGFW). First line of defense.

### Q4: What is SQL injection?
**A:** Injecting malicious SQL code through user input fields to manipulate databases. Can extract, modify, or delete data. Prevention: parameterized queries, input validation, ORM.

### Q5: What is multi-factor authentication (MFA)?
**A:** Requiring two or more verification factors: something you know (password), have (token), are (biometric). Significantly reduces unauthorized access risk.

### Q6: What is a zero-day vulnerability?
**A:** A security flaw unknown to the vendor with no patch available. Highly valuable to attackers. Defense: defense in depth, behavioral monitoring, network segmentation.

### Q7: What is the principle of least privilege?
**A:** Giving users only the minimum access needed for their job. Limits damage from compromised accounts and reduces attack surface. Regularly review and revoke unnecessary access.

### Q8: What is SIEM?
**A:** Security Information and Event Management. Centralized platform collecting and analyzing log data from across the organization. Detects threats, generates alerts, supports incident response.

### Q9: What is a DDoS attack?
**A:** Distributed Denial-of-Service overwhelms systems with traffic from multiple sources. Makes services unavailable. Mitigation: CDN, rate limiting, traffic filtering, DDoS protection services.

### Q10: What is phishing?
**A:** Deceptive communications tricking people into revealing credentials or installing malware. Types: email, spear, whaling, vishing, smishing. Defense: awareness training, email filtering, MFA.

---

## Common Mistakes

1. Ignoring patch management
2. Not implementing MFA
3. Overly permissive access controls
4. Not logging and monitoring
5. Ignoring security training
6. Hardcoding secrets in code
7. Not encrypting sensitive data
8. Skipping regular backups
9. Not having incident response plans
10. Underestimating social engineering

---

## Best Practices

1. Implement defense in depth
2. Apply least privilege principle
3. Enable MFA everywhere
4. Keep systems patched and updated
5. Monitor and log all access
6. Encrypt data at rest and in transit
7. Regular security training
8. Test defenses regularly (pentesting)
9. Have incident response plan ready
10. Follow security frameworks (NIST, ISO)

---

## Quick Reference

### Security Controls

| Type | Purpose | Examples |
|------|---------|---------|
| Preventive | Stop incidents | Firewalls, MFA, encryption |
| Detective | Identify incidents | IDS, SIEM, log monitoring |
| Corrective | Fix after incident | Patches, backups, incident response |
| Deterrent | Discourage attackers | Policies, warnings, monitoring |

### Common Ports

| Port | Service |
|------|---------|
| 22 | SSH |
| 25 | SMTP |
| 53 | DNS |
| 80 | HTTP |
| 443 | HTTPS |
| 3306 | MySQL |
| 5432 | PostgreSQL |
| 3389 | RDP |

### Encryption Algorithms

| Type | Algorithms | Use |
|------|-----------|-----|
| Symmetric | AES-256, ChaCha20 | Data encryption |
| Asymmetric | RSA, ECC, Ed25519 | Key exchange, signatures |
| Hash | SHA-256, SHA-3, bcrypt | Passwords, integrity |

### OWASP Top 10

1. Broken Access Control
2. Cryptographic Failures
3. Injection
4. Insecure Design
5. Security Misconfiguration
6. Vulnerable Components
7. Authentication Failures
8. Software and Data Integrity Failures
9. Security Logging Failures
10. Server-Side Request Forgery (SSRF)

### Incident Response Phases

1. Preparation
2. Detection and Analysis
3. Containment
4. Eradication
5. Recovery
6. Lessons Learned

---

## Learning Roadmap

### Phase 1: Foundations (Week 1-2)
- CIA Triad, networking fundamentals
- Cryptography fundamentals
- OS security basics

### Phase 2: Network Security (Week 3-4)
- Firewalls and IDS/IPS
- VPN and encryption
- Network monitoring

### Phase 3: Application Security (Week 5-6)
- OWASP Top 10
- Secure coding practices
- Penetration testing basics

### Phase 4: Operations (Week 7-8)
- Incident response procedures
- Vulnerability management
- SIEM and log analysis

### Phase 5: Advanced (Week 9-12)
- Cloud security
- Compliance frameworks (NIST, ISO 27001, SOC 2)
- Risk management
- Security architecture
