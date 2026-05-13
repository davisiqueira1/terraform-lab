# VPC EC2 Security Lab

AWS + Terraform hands-on lab focused on networking, routing and security fundamentals.

## Overview

This lab provisions a simple but realistic AWS infrastructure containing:

* Custom VPC
* Public and private subnets
* Internet Gateway
* NAT Gateway + Elastic IP
* Public and private route tables
* Security Groups
* Public EC2 instance
* Private EC2 instance
* Bastion-style SSH access

The public EC2 instance is accessible from the internet through SSH, while the private EC2 instance is only accessible internally from the public instance using Security Group referencing.

## Architecture

```text
Trusted CIDR block
   ↓ SSH
Public EC2 (Public Subnet)
   ↓ SSH
Private EC2 (Private Subnet)
```

The private instance can access the internet through the NAT Gateway, but it is not directly exposed to the internet.

## Required Variables

Two variables must be provided before running the lab:

### trusted_ssh_cidr_block

CIDR block allowed to access the public EC2 instance through SSH.

Example:

```hcl
trusted_ssh_cidr_block = "177.xxx.xxx.xxx/32"
```

---

### ssh_public_key_path

Path to the local SSH public key used to create the AWS key pair.

Example:

```hcl
ssh_public_key_path = "~/.ssh/id_ed25519.pub"
```

## Commands

Initialize Terraform:

```bash
terraform init
```

Preview infrastructure changes:

```bash
terraform plan
```

Apply infrastructure:

```bash
terraform apply
```

## Outputs

The lab exports:

* Public IP of the public EC2 instance
* Private IP of the private EC2 instance
