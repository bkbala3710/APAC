variable "env" {
  type        = string
  description = "What Env we are creating (dev, qa, prod)"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}
