## configure aws provider
 terraform {
   required_providers {
     aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
     }
   }

    required_version = "~> 1.7.0"

  }

  provider "aws" {
     region             = "us-east-1"
     profile            = "Pavan-Terraform-user"
  }

  # store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "pavan-terraform-state"
    key       = "Dev-app.tfstate"
    region    = "us-east-1"
    profile   = "Pavan-Terraform-user"
    #dynamodb_table = "terraform-state-lock"
  }
}
# create vpc
module "vpc" {
    source                                    = "../modules/vpc"
    region                                    = var.region
    project_name                              = var.project_name
    vpc_cidr                                  = var.vpc_cidr
    public_subnet_az1_cidr                    = var.public_subnet_az1_cidr
    public_subnet_az2_cidr                    = var.public_subnet_az2_cidr
    private_app_subnet_az1_cidr               = var.private_app_subnet_az1_cidr
    private_app_subnet_az2_cidr               = var.private_app_subnet_az2_cidr
    private_data_app_subnet_az1_cidr          = var.private_data_app_subnet_az1_cidr
    private_data_app_subnet_az2_cidr          = var.private_data_app_subnet_az2_cidr
}