resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnets_1" {
  count = length(var.subnet_cidrs_1)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidrs_1[count.index]
  availability_zone       = var.azs_1[count.index]
  map_public_ip_on_launch = var.map_public_ip-1

  tags = {
    Name = "${var.vpc_name}-Public-subnet-${count.index + 1}"
  }
                      }

resource "aws_subnet" "subnets_2" {
  count = length(var.subnet_cidrs_2)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidrs_2[count.index]
  availability_zone       = var.azs_2[count.index]
  map_public_ip_on_launch = var.map_public_ip_2

  tags = {
    Name = "${var.vpc_name}-Private-subnet-${count.index + 1}"
  }
}




