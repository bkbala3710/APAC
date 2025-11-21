resource "aws_instance" "bastion_host_1" {
  ami                         = var.ami_1
  instance_type               = var.instance_type_1
  subnet_id                   = var.subnet_id_1
  key_name                    = var.key_name_1

  associate_public_ip_address = var.associate_public_ip_1

  tags = {
    Name = var.name_1
  }
}
