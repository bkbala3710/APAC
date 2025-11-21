output "instance_id" {
  value = aws_instance.bastion_host_1.id
}

output "public_ip_1" {
  value = aws_instance.bastion_host_1.public_ip
}

output "private_ip_1" {
  value = aws_instance.bastion_host_1.private_ip
}
