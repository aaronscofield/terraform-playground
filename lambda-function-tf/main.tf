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
  output_path = var.zipfile
}

resource "aws_lambda_function" "lambda" {
  provider      = aws.oregon
  function_name = var.lambda_name
  handler       = var.handler
  runtime       = var.runtime
  architectures = [var.architecture]

  filename = var.zipfile
  role     = aws_iam_role.function_role.arn

  tags = {
    test = "test"
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["lambda:InvokeFunction"]
    resources = ["*"]
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
          Service = ["lambda.amazonaws.com", "scheduler.amazonaws.com"]
        }
      },
    ]
  })
  inline_policy {
    name   = var.iam_policy_name
    policy = data.aws_iam_policy_document.policy.json
  }
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}

resource "aws_scheduler_schedule" "schedule" {
  provider   = aws.oregon
  name       = var.schedule_name
  group_name = var.schedule_group
  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = var.schedule

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = aws_iam_role.function_role.arn
  }
}