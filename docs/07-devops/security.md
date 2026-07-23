---
layout: default
title: Security
parent: DevOps & Cloud
---

# Security
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Introduction

Application security encompasses the practices, tools, and processes used to protect software applications from threats and vulnerabilities. It involves identifying, fixing, and preventing security issues throughout the software development lifecycle.

Modern application security follows a "shift-left" approach, integrating security practices early in development rather than as an afterthought. This includes secure coding practices, automated security testing, and security architecture design.

---

## Key Concepts

### OWASP Top 10 (2021)

| Rank | Risk | Description |
|------|------|-------------|
| 1 | Broken Access Control | Unauthorized access to resources |
| 2 | Cryptographic Failures | Weak or missing encryption |
| 3 | Injection | SQL, NoSQL, OS command injection |
| 4 | Insecure Design | Missing security architecture |
| 5 | Security Misconfiguration | Default or weak configurations |
| 6 | Vulnerable Components | Using known-vulnerable libraries |
| 7 | Authentication Failures | Weak authentication mechanisms |
| 8 | Data Integrity Failures | Unsigned updates, insecure CI/CD |
| 9 | Logging Failures | Insufficient logging and monitoring |
| 10 | SSRF | Server-Side Request Forgery |

### CIA Triad

- **Confidentiality**: Protect data from unauthorized access
- **Integrity**: Ensure data accuracy and consistency
- **Availability**: Ensure systems are accessible when needed

### Security Principles

- **Defense in Depth**: Multiple layers of security
- **Least Privilege**: Minimum necessary permissions
- **Separation of Duties**: Divide critical tasks
- **Fail-Safe Defaults**: Deny by default
- **Complete Mediation**: Check every access

### Authentication Methods

| Method | Factor | Example |
|--------|--------|---------|
| Passwords | Knowledge (what you know) | User credentials |
| MFA | Multiple factors | Password + TOTP |
| Biometrics | Inherence (what you are) | Fingerprint, face |
| Certificate | Possession (what you have) | X.509 certificates |
| OAuth 2.0 | Delegated | Third-party login |

### Authorization Models

| Model | Description |
|-------|-------------|
| RBAC | Role-Based Access Control |
| ABAC | Attribute-Based Access Control |
| ACL | Access Control Lists |
| OAuth Scopes | Delegated permissions |
| Policy Engines | OPA, Cedar |

### Encryption Types

| Type | Algorithm | Use Case |
|------|-----------|----------|
| Symmetric | AES | Data at rest |
| Asymmetric | RSA | Key exchange, signatures |
| Hashing | SHA-256 | Password storage, integrity |
| HMAC | HMAC-SHA256 | Message authentication |
| TLS | TLS 1.3 | Data in transit |

---

## FAQ (Top 10)

### Q1: What is the difference between authentication and authorization?
**A:** Authentication verifies identity (who you are). Authorization determines permissions (what you can do). Authentication comes first, then authorization checks access.

### Q2: What is OWASP Top 10?
**A:** List of top 10 web application security risks published by Open Web Application Security Project. Updated regularly based on industry data.

### Q3: What is SQL injection?
**A:** Attack inserting malicious SQL code into queries through user input. Can read, modify, or delete data. Prevented by parameterized queries and input validation.

### Q4: What is XSS?
**A:** Cross-Site Scripting injects malicious scripts into web pages viewed by users. Types: Stored, Reflected, DOM-based. Prevented by output encoding and CSP.

### Q5: What is CSRF?
**A:** Cross-Site Request Forgery tricks users into performing actions on unintended sites. Prevented by CSRF tokens, SameSite cookies, and origin checks.

### Q6: What is the difference between encryption at rest and in transit?
**A:** At rest: Encrypting stored data (databases, files). In transit: Encrypting data moving between systems (TLS). Both are essential for data protection.

### Q7: What is OAuth 2.0?
**A:** Authorization framework allowing third-party applications limited access to user resources without exposing credentials. Uses access tokens for authentication.

### Q8: What is JWT?
**A:** JSON Web Token for securely transmitting information between parties. Contains header, payload, and signature. Used for stateless authentication.

### Q9: What is SAST vs DAST?
**A:** SAST (Static) analyzes source code without executing. DAST (Dynamic) analyzes running application. SAST catches issues early; DAST finds runtime vulnerabilities.

### Q10: What is least privilege?
**A:** Principle that users and systems should have minimum necessary permissions. Reduces attack surface and potential damage from breaches.

---

## Common Mistakes

1. **Storing passwords in plaintext** - Never store passwords without hashing
2. **Using weak hashing algorithms** - MD5 and SHA-1 are insufficient; use bcrypt, Argon2
3. **Not validating input** - Trusting user input without validation leads to injection attacks
4. **Exposing sensitive data in logs** - Logging passwords, API keys, or personal data
5. **Using default credentials** - Not changing default passwords for databases and services
6. **Ignoring security updates** - Not patching known vulnerabilities in dependencies
7. **Hard-coding secrets** - Storing API keys and passwords in source code
8. **No HTTPS** - Transmitting data over unencrypted connections
9. **Missing security headers** - Not implementing CSP, HSTS, and other protective headers
10. **Insufficient logging** - Not logging security events for detection and forensics

---

## Best Practices

### Authentication
- Use strong password hashing (bcrypt, Argon2)
- Implement multi-factor authentication
- Use secure session management
- Implement account lockout policies
- Support OAuth 2.0 for third-party auth

### Authorization
- Implement least privilege principle
- Use RBAC or ABAC
- Validate permissions server-side
- Audit access logs

### Data Protection
- Encrypt sensitive data at rest
- Use TLS for data in transit
- Implement proper key management
- Use data masking where appropriate

### Secure Development
- Input validation on all inputs
- Output encoding to prevent XSS
- Parameterized queries for databases
- Security headers implementation
- Regular security training

### DevSecOps
- Integrate security in CI/CD
- Automated security scanning (SAST, DAST)
- Container security scanning
- Infrastructure as code security
- Regular penetration testing

---

## Quick Reference

### Security Headers
```
Content-Security-Policy: default-src 'self'
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Strict-Transport-Security: max-age=31536000; includeSubDomains
Referrer-Policy: strict-origin-when-cross-origin
Permissions-Policy: camera=(), microphone=()
```

### Password Hashing
```javascript
// bcrypt
const bcrypt = require('bcrypt');
const hash = await bcrypt.hash(password, 12);
const isValid = await bcrypt.compare(password, hash);

// Argon2
const argon2 = require('argon2');
const hash = await argon2.hash(password);
const isValid = await argon2.verify(hash, password);
```

### JWT Best Practices
```javascript
// Generate with short expiry and RS256
const token = jwt.sign(
  { userId: user.id },
  process.env.JWT_SECRET,
  { expiresIn: '1h', algorithm: 'RS256' }
);

// Verify specifying algorithm
jwt.verify(token, process.env.JWT_PUBLIC_KEY, { algorithms: ['RS256'] });
```

### SQL Injection Prevention
```javascript
// BAD - Vulnerable
const query = `SELECT * FROM users WHERE id = '${userId}'`;

// GOOD - Parameterized query
const query = 'SELECT * FROM users WHERE id = ?';
connection.query(query, [userId], callback);

// GOOD - ORM
const user = await User.findOne({ where: { id: userId } });
```

### Rate Limiting
```javascript
const rateLimit = require('express-rate-limit');

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  message: 'Too many requests'
});

app.use('/api/', limiter);
```

### Security Testing Tools

| Type | Tools |
|------|-------|
| SAST | SonarQube, Checkmarx, Fortify |
| DAST | OWASP ZAP, Burp Suite |
| SCA | Snyk, Dependabot, npm audit |
| Container | Trivy, Docker Scout |
| Secrets | git-secrets, truffleHog |
