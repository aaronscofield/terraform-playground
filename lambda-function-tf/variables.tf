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