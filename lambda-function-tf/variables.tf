variable "runtime" {
  description = "The runtime for the lambda function"
  type        = string
  default     = "python3.10"
}

variable "zipfile" {
  description = "The name of the zipfile for the lambda code"
  type        = string
  default     = "lambda.zip"
}

variable "architecture" {
  description = "The architecture to use for the lambda function"
  type        = string
  default     = "x86-64"
}

variable "handler" {
  description = "The handler for the lambda function"
  type        = string
  default     = "function.handler"
}

variable "lambda_name" {
  description = "the name of the lambda function"
  type        = string
}

variable "schedule_name" {
  description = "The name of the eventbridge schedule"
  type        = string
}

variable "schedule" {
  description = "the schedule to set for the eventbridge schedule"
  type        = string
}

variable "schedule_group" {
  description = "the group to associate with the schedule"
  type        = string
}

variable "iam_policy_name" {
  description = "the name of the inline iam policy"
  type        = string
}