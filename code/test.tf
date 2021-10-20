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

resource "aws_instance" "test_terrform_ec2" {
  ami = "ami-0cff8a37cfecca308"
  instance_type = "t3.micro"
  security_groups = [
    #I had to use .name below as this is part of the default VPC.  If this was in a different VPC, I would have to use the security groups id (.id)
    "${aws_security_group.test_terraform_sg.name}"
  ]
  key_name = var.keyname
  tags = {
    Name = "test_terraform_ec2"
  }
}