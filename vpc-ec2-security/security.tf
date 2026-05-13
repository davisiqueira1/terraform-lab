resource "aws_security_group" "public_instance" {
  vpc_id      = aws_vpc.main.id
  description = "Public EC2 security group. Allows HTTP and HTTPS traffic from all sources and SSH from a trusted CIDR block."
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.public_instance.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.public_instance.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.public_instance.id
  cidr_ipv4         = var.trusted_ssh_cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "public_allow_all" {
  security_group_id = aws_security_group.public_instance.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_security_group" "private_instance" {
  vpc_id      = aws_vpc.main.id
  description = "Private EC2 security group. Allows SSH access from instances using the public security group."
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_from_public_sg" {
  security_group_id            = aws_security_group.private_instance.id
  referenced_security_group_id = aws_security_group.public_instance.id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_egress_rule" "private_allow_all" {
  security_group_id = aws_security_group.private_instance.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
