output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids_1" {
  value = aws_subnet.subnets-1[*].id
}

output "subnet_ids_2" {
  value = aws_subnet.subnets-2[*].id
}
