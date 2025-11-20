module "vpc" {
  source = "../../modules/vpc"  # update path based on your folder

  vpc_name     = "PROD-APAC-VPC"
  vpc_cidr     = "10.0.0.0/16"
  subnet_cidrs_1 = ["10.0.1.0/24", "10.0.2.0/24"]
  azs_1         = ["ap-southeast-1a", "ap-southeast-1b"]
  subnet_cidrs_2 = ["10.0.11.0/24", "10.0.12.0/24"]
  azs_2         = ["ap-southeast-1a", "ap-southeast-1b"]
}







