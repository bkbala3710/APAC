terraform {
  required_version = "~> 1.14.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
  }
  backend "s3" {
    bucket = "103-jenkins-terraform"
    key    = "environments/prod/terraform.tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "103-jenkins-terraform" 
  }
}

provider "aws" {
  region = var.aws_region1
}

provider "aws" {
  alias  = "secondary"
  region = var.aws_region2
}






