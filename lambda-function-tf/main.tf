terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "oregon"
  region = "us-west-2"
}

data "archive_file" "function_zip" {
  source_dir  = "${path.module}/lambda"
  type        = "zip"
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "lambda" {
  provider      = aws.oregon
  function_name = "aarons-tf-lambda"
  handler       = "function.handler"
  runtime       = "python3.10"
  architectures = ["arm64"]

  filename = "lambda.zip"
  role     = aws_iam_role.function_role.arn

  tags = {
    test = "test"
  }
}

resource "aws_iam_role" "function_role" {
  provider = aws.oregon
  name     = "aaron-iam-role"
  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}