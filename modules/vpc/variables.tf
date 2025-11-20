variable "vpc_name" {
  type        = string
  default     = "my-vpc"
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "subnet_cidrs_1" {
  type        = list(string)
  description = "List of subnet CIDRs"
}

variable "azs_1" {
  type        = list(string)
  description = "List of availability zones for the subnets"
}

variable "subnet_cidrs_2" {
  type        = list(string)
  description = "List of subnet CIDRs"
}

variable "azs_2" {
  type        = list(string)
  description = "List of availability zones for the subnets"
}

variable "map_public_ip_1" {
  type        = bool
  default     = true
  description = "Assign public IP on launch?"
}

variable "map_public_ip_2" {
  type        = bool
  default     = false
  description = "Assign public IP on launch?"
}


