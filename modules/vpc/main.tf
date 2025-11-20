resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.env}-VPC"
  }
}

resource "aws_subnet" "public" {
  for_each = toset(var.public_subnets)
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = each.value
  availability_zone = element(var.availability_zones, index(var.public_subnets, each.value))
  map_public_ip_on_launch = true
  tags = { Name = "public-${each.value}" }
}

