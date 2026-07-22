---
layout: default
title: Terraform
parent: DevOps & Cloud
---

# Terraform
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Introduction

Terraform is an Infrastructure as Code (IaC) tool created by HashiCorp that allows you to define and provision infrastructure using declarative configuration files. It supports multiple cloud providers (AWS, Azure, GCP, etc.) and can manage a wide range of resources including compute, storage, networking, and more.

Terraform uses HashiCorp Configuration Language (HCL) to describe desired infrastructure state. It plans changes before applying them, tracks state for drift detection, and enables collaboration through remote state management.

---

## Key Concepts

### Terraform Workflow

1. **Write**: Define infrastructure in HCL configuration files
2. **Plan**: Preview changes before applying (`terraform plan`)
3. **Apply**: Create or modify infrastructure (`terraform apply`)
4. **Destroy**: Tear down infrastructure (`terraform destroy`)

### HCL Syntax

```hcl
# Block structure
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

# Variables
variable "region" {
  type    = string
  default = "us-east-1"
}

# Outputs
output "instance_id" {
  value = aws_instance.example.id
}
```

### State Management

- **Purpose**: Maps real infrastructure to configuration
- **Structure**: JSON file tracking resource metadata and dependencies
- **Remote State**: Stored centrally (S3, Azure Blob, GCS, Terraform Cloud)
- **State Locking**: Prevents concurrent modifications

### Module System

- **Root Module**: Main configuration directory
- **Child Modules**: Reusable modules called from root
- **Module Registry**: Public/private module registry
- **Module Versioning**: Semantic versioning for modules

### Workspaces

- **Purpose**: Manage multiple environments with same configuration
- **Types**: Default, named, and remote workspaces
- **State**: Each workspace has separate state file
- **Use Case**: Dev/staging/prod environments

---

## FAQ (Top 10)

### Q1: What is the difference between Terraform and CloudFormation?
**A:** Terraform is multi-cloud, uses HCL, and has a state file. CloudFormation is AWS-only, uses JSON/YAML, and is managed by AWS. Terraform has larger community and more provider support.

### Q2: What is Terraform state and why is it important?
**A:** State is a JSON file mapping real infrastructure to configuration. It tracks metadata, dependencies, and enables drift detection. Without state, Terraform can't manage existing resources.

### Q3: What is the difference between terraform plan and terraform apply?
**A:** Plan previews changes without modifying infrastructure. Apply actually creates, modifies, or destroys resources. Always run plan before apply to review changes.

### Q4: What are Terraform modules?
**A:** Modules are reusable, encapsulated configurations. They promote code reuse, consistency, and maintainability. Modules can be shared via Terraform Registry or private registries.

### Q5: What is remote state and why use it?
**A:** Remote state stores state files centrally (S3, Azure Blob, Terraform Cloud). Benefits: team collaboration, state locking, backup, and access control.

### Q6: What is the difference between count and for_each?
**A:** Count creates multiple resources based on a number. for_each creates resources based on a map or set. for_each is more flexible and maintains resource identity better.

### Q7: What is terraform import?
**A:** Import brings existing infrastructure into Terraform state. It doesn't generate configuration; you must write configuration matching the imported resource.

### Q8: How do you manage secrets in Terraform?
**A:** Use environment variables, Terraform Cloud variables with sensitivity flag, or external secret management (Vault, AWS Secrets Manager). Never commit secrets to version control.

### Q9: What is drift detection?
**A:** Drift occurs when actual infrastructure diverges from Terraform configuration. `terraform plan` detects drift. Remediation: update configuration or import changes.

### Q10: What are data sources in Terraform?
**A:** Data sources query existing infrastructure for use in configuration. They don't create resources; they read and filter existing resources.

---

## Common Mistakes

1. **Not using remote state** - Local state causes collaboration issues and data loss risk
2. **Hard-coding secrets** - Storing sensitive data in configuration files or state
3. **Not using modules** - Duplicating code instead of creating reusable modules
4. **Ignoring state locking** - Concurrent modifications can corrupt state
5. **Not validating plans** - Applying without reviewing terraform plan output
6. **Using latest provider versions** - Not pinning versions can cause breaking changes
7. **Creating overly complex configurations** - Over-engineering simple deployments
8. **Not implementing drift detection** - Ignoring changes made outside Terraform
9. **Poor resource naming** - Inconsistent naming makes management difficult
10. **Not testing configurations** - Deploying without validation or testing

---

## Best Practices

### Code Organization
- Use modules for reusable components
- Separate environments with workspaces or directories
- Keep configurations simple and readable
- Document with comments and README files

### State Management
- Use remote state with locking
- Enable state encryption
- Implement access controls
- Regular state backups

### Security
- Use variables for sensitive data
- Enable encryption at rest
- Implement least privilege IAM
- Scan for secrets in code

### CI/CD Integration
- Automate plan and apply
- Use approval gates for production
- Implement policy as code
- Maintain audit trail

---

## Quick Reference

### Terraform CLI Commands
```bash
# Initialize
terraform init                    # Initialize working directory
terraform init -upgrade          # Update providers/modules

# Planning
terraform plan                    # Preview changes
terraform plan -out=tfplan       # Save plan to file
terraform plan -target=resource  # Target specific resource

# Applying
terraform apply                   # Apply changes
terraform apply tfplan            # Apply saved plan

# Destroying
terraform destroy                 # Destroy all resources

# State
terraform state list              # List resources in state
terraform state show resource     # Show resource details
terraform state mv src dst       # Move resource in state
terraform state rm resource       # Remove from state
terraform import resource id      # Import existing resource

# Formatting
terraform fmt                     # Format configuration
terraform validate                # Validate configuration
```

### Remote State Configuration
```hcl
# AWS S3
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# Azure Blob
terraform {
  backend "azurerm" {
    resource_group_name  = "my-rg"
    storage_account_name = "myterraformstate"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

# Google Cloud
terraform {
  backend "gcs" {
    bucket = "my-terraform-state"
    prefix = "prod"
  }
}
```

### Common HCL Patterns
```hcl
# Conditional
count = var.enabled ? 1 : 0

# For each
for_each = toset(["a", "b", "c"])

# Dynamic block
dynamic "ingress" {
  for_each = var.ports
  content {
    from_port = ingress.value
    to_port   = ingress.value
    protocol  = "tcp"
  }
}

# Conditional expressions
environment = var.is_prod ? "production" : "development"

# File function
user_data = file("${path.module}/userdata.sh")
```
