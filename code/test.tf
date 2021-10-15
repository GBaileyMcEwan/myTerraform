terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.63.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "af-south-1"
}

resource "aws_security_group" "test_terraform_sg" {
  name        = "test_terraform_sg"
  description = "Test Terraform SG"

  ingress = [
    {
      description      = "Allow port ${var.port}"
      from_port        = var.port
      to_port          = var.port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null
      security_groups  = null
      self             = null
      prefix_list_ids  = null
    }
  ]

  tags = {
    Name = "test_terraform_sg"
  }
}