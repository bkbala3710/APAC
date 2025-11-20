module "vpc" {
  source = "../../modules/vpc"  # update path based on your folder

  vpc_name     = "PROD-APAC-VPC"
  vpc_cidr     = "10.0.0.0/16"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  azs          = ["ap-south-1a", "ap-south-1b"]
}

