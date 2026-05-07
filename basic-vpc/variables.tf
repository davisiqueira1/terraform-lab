variable "aws_region" {
  description = "AWS region where resources will be created"
  default     = "us-east-1"
  type        = string
  nullable    = false
}

variable "vpc_cidr_block" {
  description = "CIDR range used by the VPC"
  default  = "10.0.0.0/16"
  type     = string
  nullable = true
}

variable "public_subnet_cidr_block" {
  description = "CIDR range for the public subnet"
  default  = "10.0.1.0/24"
  type     = string
  nullable = true
}

variable "private_subnet_cidr_block" {
  description = "CIDR range for the private subnet"
  default  = "10.0.2.0/24"
  type     = string
  nullable = true
}

variable "public_subnet_az" {
  description = "Availability zone for the public subnet"
  default  = "us-east-1a"
  type     = string
  nullable = false
}

variable "private_subnet_az" {
  description = "Availability zone for the private subnet"
  default  = "us-east-1a"
  type     = string
  nullable = false
}
