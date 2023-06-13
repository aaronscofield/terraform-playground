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
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"

  tags = {
    Name = "TaylorIsMyFriend"
  }
}

resource "aws_ec2_instance_state" "app_server" {
  instance_id = aws_instance.app_server.id
  state       = "running"
}
