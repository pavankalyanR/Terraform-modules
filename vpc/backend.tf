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