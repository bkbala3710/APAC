output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids_1" {
  value = aws_subnet.subnets_1[*].id
}

output "subnet_ids_2" {
  value = aws_subnet.subnets_2[*].id
}
