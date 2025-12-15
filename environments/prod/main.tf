

module "vpc" {
  source = "../../modules/vpc"  # update path based on your folder

  vpc_name       = "PROD-APAC-VPC"
  vpc_cidr       = "10.0.0.0/16"
  subnet_cidrs_1 = ["10.0.1.0/24", "10.0.2.0/24"]
  azs_1          = ["ap-southeast-1a", "ap-southeast-1b"]
  subnet_cidrs_2 = ["10.0.11.0/24", "10.0.12.0/24"]
  azs_2          = ["ap-southeast-1a", "ap-southeast-1b"]
}

resource "aws_s3_bucket" "importeds3bucket" {
  bucket = "103-terraform-import"
}

/*

module "ec2" {
  source = "../../modules/ec2"

  name_1                  = "APAC_PRODUCTION_Bastion_host_1"
  ami_1                   = "ami-093a7f5fbae13ff67"
  instance_type_1         = "t2.micro"
  subnet_id_1             = module.vpc.subnet_ids_1[0]
  key_name_1              = "20112025"
  name_sg_1               = "production_bastion_host_sg_1"
  associate_public_ip_1   = true
  vpc_id = module.vpc.vpc_id
}


resource "aws_ec2_instance_state" "stop_ec2" {
  instance_id = module.ec2.instance_id   # Or your instance ID variable
  state       = "stopped"
}


*/


















