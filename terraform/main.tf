terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.region  # Replace with your desired AWS region
  profile = "default"    # Replace with your AWS CLI profile name
}

resource "aws_instance" "master_node" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  key_name      = "karthik"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.master_node.id]
  associate_public_ip_address = true
  tags = {
    Name = "${var.name}-mater_node"
  }
}
resource "aws_instance" "worker_node" {
  count         = 2
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  key_name      = "karthik"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.worker_node.id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.name}-worker_node-${count.index + 1}"
  }
}
