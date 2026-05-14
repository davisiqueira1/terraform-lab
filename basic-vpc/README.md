# VPC Basic Lab

AWS + Terraform hands-on lab focused on learning the core networking components of a basic AWS VPC architecture.

## Overview

This lab provisions the foundational infrastructure required for public and private networking inside AWS.

Resources created:

* Custom VPC
* Public subnet
* Private subnet
* Internet Gateway
* NAT Gateway + Elastic IP
* Public route table
* Private route table
* Route table associations

## Architecture

```text
Internet
   ↓
Internet Gateway
   ↓
Public Subnet
   ↓
NAT Gateway
   ↓
Private Subnet
```

The public subnet has direct internet access through the Internet Gateway.

The private subnet does not receive inbound internet traffic, but can access the internet outbound through the NAT Gateway.

## Concepts Practiced

This lab was built to practice and better understand:

* Terraform infrastructure organization
* VPC networking
* Subnets
* Route tables
* Internet Gateway behavior
* NAT Gateway behavior
* Internal VPC communication

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

The lab exports the VPC ARN as output.
