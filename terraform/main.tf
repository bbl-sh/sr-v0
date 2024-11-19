# Provider Configuration
provider "aws" {
  region = var.aws_region
}

# Security Group to Allow SSH and HTTP Access
resource "aws_sr" "instance_sg" {
  name        = "instance-security-group"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "instance-aws_sr"
  }
}

# Key Pair for EC2 Instance
resource "aws_key_pair" "deployer_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer_key.key_name

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  tags = {
    Name = "web-server-instance"
  }
}

# Outputs
output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "instance_id" {
  value = aws_instance.web_server.id
}
