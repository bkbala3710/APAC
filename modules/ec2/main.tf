resource "aws_instance" "bastion_host_1" {
  ami                         = var.ami_1
  instance_type               = var.instance_type_1
  subnet_id                   = var.subnet_id_1
  key_name                    = var.key_name_1
  vvpc_security_group_ids     = [aws_security_group.prod_bastion_host_sg_1.id]
  associate_public_ip_address = var.associate_public_ip_1

  tags = {
    Name = var.name_1
  }
}

resource "aws_security_group" "prod_bastion_host_sg_1" {
  name        = var.name_sg_1
  description = "Security group for web server"
  vpc_id      = var.vpc_id

  ingress {
    content {
      description      = "Allow SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    for_each = var.egress_rules
    content {
      description      = "Allow SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  tags = {
    Name = var.name_sg_1
  }
}

