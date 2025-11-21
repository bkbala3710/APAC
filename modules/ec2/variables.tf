variable "name_1" {
  type        = string
  description = "Name tag for EC2"
}

variable "ami_1" {
  type        = string
  description = "AMI ID"
}

variable "instance_type_1" {
  type        = string
  default     = "t2.micro"
}

variable "subnet_id_1" {
  type        = string
  description = "Subnet ID where EC2 should be launched"
}

variable "key_name_1" {
  type        = string
}

variable "security_group_ids_1" {
  type = list(string)
}

variable "associate_public_ip_1" {
  type    = bool
  default = true
}
