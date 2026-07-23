---
layout: default
title: Jenkins
parent: DevOps & Cloud
---

# Jenkins
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Introduction

Jenkins is an open-source automation server used for building, testing, and deploying software. It's one of the most widely used CI/CD tools, with a rich ecosystem of plugins that extend its functionality for virtually any software development workflow.

Jenkins supports Pipeline as Code through Jenkinsfiles, enabling version-controlled CI/CD configurations. It integrates with virtually every tool in the software development lifecycle, from version control to deployment platforms.

---

## Key Concepts

### Jenkins Architecture

- **Jenkins Master (Controller)**: Schedules builds, provides web UI, manages plugins
- **Jenkins Agent (Slave)**: Executes builds on remote machines
- **Plugin System**: Extends Jenkins functionality (1800+ available)
- **Job/Project**: Configuration for a single automation task
- **Build**: Single execution of a job

### Pipeline Types

| Type | Syntax | Flexibility | Recommendation |
|------|--------|-------------|----------------|
| Declarative | Structured, easier to read/write | Limited | Recommended |
| Scripted | Groovy-based, more flexible | Full Groovy | Advanced use |

### Declarative Pipeline Structure

```groovy
pipeline {
    agent any

    parameters { ... }
    environment { ... }
    options { ... }
    triggers { ... }

    stages {
        stage('Build') { steps { ... } }
        stage('Test') { steps { ... } }
        stage('Deploy') { steps { ... } }
    }

    post {
        always { ... }
        success { ... }
        failure { ... }
    }
}
```

### Build Triggers

1. **Poll SCM**: Check for changes on schedule
2. **GitHub hook trigger**: Trigger on GitHub push
3. **Build periodically**: Schedule builds
4. **Upstream projects**: Trigger after upstream build
5. **Remote API**: Trigger via HTTP request

### Credentials Types

| Type | Use Case |
|------|----------|
| Username/Password | Basic authentication |
| SSH Key | SSH private key |
| Secret Text | Single secret value |
| Secret File | File containing secrets |
| Certificate | PKCS#12 certificate |

---

## FAQ (Top 10)

### Q1: What is the difference between declarative and scripted pipelines?
**A:** Declarative: Structured, easier to read/write, restricted Groovy syntax. Scripted: Full Groovy, more flexible, steeper learning curve. Declarative is recommended for most use cases.

### Q2: What is a Jenkinsfile?
**A:** Text file containing pipeline definition, committed to version control. Enables Pipeline as Code, version-controlled CI/CD configuration.

### Q3: What are Jenkins agents?
**A:** Agents (formerly slaves) are machines that execute builds. They offload work from master and provide build environments with specific tools.

### Q4: How do credentials work in Jenkins?
**A:** Credentials are stored encrypted and referenced by ID in pipelines. Jenkins handles decryption at runtime. Never hard-code secrets in Jenkinsfiles.

### Q5: What is the difference between agent any and agent none?
**A:** agent any: Pipeline can run on any available agent. agent none: Pipeline doesn't specify agent; each stage specifies its own agent.

### Q6: What is Jenkins shared library?
**A:** Reusable pipeline code stored in a separate repository. Allows sharing common pipeline logic across multiple Jenkinsfiles.

### Q7: How do you implement parallel execution in Jenkins?
**A:** Use parallel step in declarative pipeline or parallel() in scripted pipeline. Parallel stages run concurrently.

### Q8: What is the difference between polling SCM and webhook?
**A:** Polling: Jenkins checks for changes periodically. Webhook: Server notifies Jenkins of changes immediately. Webhooks are more efficient.

### Q9: How do you implement approval gates in Jenkins?
**A:** Use input step in pipeline. Requires manual approval before proceeding. Configure with message, submitter, and timeout.

### Q10: How do you secure Jenkins?
**A:** Enable authentication, configure authorization (RBAC), use credentials plugin, restrict script execution, keep Jenkins updated.

---

## Common Mistakes

1. **Storing secrets in Jenkinsfile** - Hard-coding credentials instead of using credentials plugin
2. **Not using Pipeline as Code** - Configuring jobs through UI instead of Jenkinsfiles
3. **Ignoring pipeline best practices** - Not implementing error handling, parallel execution, or proper logging
4. **Over-relying on plugins** - Using too many plugins without evaluating necessity
5. **Not securing Jenkins** - Default admin credentials, no authentication, exposed API
6. **Ignoring build artifact management** - Not archiving artifacts or using artifact repositories
7. **No test reporting** - Not publishing test results or code coverage reports
8. **Hard-coding environment-specific values** - Using parameters instead of environment-specific configuration
9. **Not monitoring Jenkins** - No monitoring for build failures, queue length, or resource usage
10. **Poor agent management** - Not using distributed builds or not isolating build environments

---

## Best Practices

### Pipeline Design
- Use declarative syntax
- Implement proper error handling
- Use shared libraries for common logic
- Minimize external script dependencies
- Use meaningful stage names

### Security
- Use credentials plugin for secrets
- Implement RBAC
- Keep Jenkins and plugins updated
- Use agent isolation
- Enable audit logging

### Performance
- Use distributed builds
- Implement parallel execution
- Cache dependencies
- Use Docker agents for isolation
- Monitor and optimize build times

---

## Quick Reference

### Pipeline Syntax
```groovy
pipeline {
    agent any

    parameters {
        string(name: 'PARAM', defaultValue: 'value')
        choice(name: 'CHOICE', choices: ['a', 'b'])
        booleanParam(name: 'BOOL', defaultValue: true)
    }

    environment {
        VAR = 'value'
        CRED = credentials('credential-id')
    }

    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
    }

    stages {
        stage('Stage Name') {
            steps {
                sh 'command'
                echo 'message'
                input message: 'Proceed?'
            }
        }

        stage('Parallel') {
            parallel {
                stage('A') { steps { echo 'A' } }
                stage('B') { steps { echo 'B' } }
            }
        }
    }

    post {
        always { echo 'Always runs' }
        success { echo 'On success' }
        failure { echo 'On failure' }
    }
}
```

### Docker Pipeline
```groovy
pipeline {
    agent {
        docker {
            image 'maven:3.8-openjdk-11'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
```

### Kubernetes Pipeline
```groovy
pipeline {
    agent {
        kubernetes {
            yaml '''
                apiVersion: v1
                kind: Pod
                spec:
                  containers:
                    - name: maven
                      image: maven:3.8-openjdk-11
                      command: ['cat']
                      tty: true
            '''
        }
    }
    stages {
        stage('Build') {
            steps {
                container('maven') {
                    sh 'mvn clean package'
                }
            }
        }
    }
}
```

### Jenkins System Commands
```bash
sudo systemctl restart jenkins       # Restart Jenkins
sudo systemctl status jenkins        # Check status
tail -f /var/log/jenkins/jenkins.log # View logs
tar -czvf jenkins-backup.tar.gz /var/lib/jenkins  # Backup
```
