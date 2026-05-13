output "vpc_arn" {
  value = aws_vpc.main.arn
}

output "public_instance_public_ip_address" {
  value = aws_instance.public_instance.public_ip
}

output "private_instance_private_ip_address" {
  value = aws_instance.private_instance.private_ip
}
