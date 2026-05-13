data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical ID
}

resource "aws_instance" "public_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public_subnet.id
  private_ip = var.public_instance_ip_address
  vpc_security_group_ids = [aws_security_group.public_instance.id]

  associate_public_ip_address = true

  key_name = aws_key_pair.ssh_key_pair.key_name
}

resource "aws_instance" "private_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  subnet_id = aws_subnet.private_subnet.id
  private_ip = var.private_instance_ip_address
  vpc_security_group_ids = [aws_security_group.private_instance.id]

  key_name = aws_key_pair.ssh_key_pair.key_name
}

resource "aws_key_pair" "ssh_key_pair" {
  key_name = "ssh-key"
  public_key = file(var.ssh_public_key_path)
}
