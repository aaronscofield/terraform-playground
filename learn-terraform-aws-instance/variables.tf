variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "ami" {
  description = "The AMI to use for any EC2 instances"
  type        = string
  default     = "ami-04a0ae173da5807d3"
}

variable "instance_type" {
  description = "The instance type to use for any EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "instance_state" {
  description = "The state of the EC2 instance"
  type        = string
  default     = "running"

  validation {
    condition     = can(regex("^(running|stopped)$", var.instance_state))
    error_message = "Must be either running or stopped"
  }
}