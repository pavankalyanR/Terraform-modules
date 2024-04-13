# main.tf
 terraform {
   required_providers {
     aws = {
      #source  = "terraform-provider-aws"
       # version = "~> 5.0"
     }
   }
 }

module "ec2_instances" {
  source = "../modules/Ec2"

  project_name   = "myproject"
  vpc_id         = aws_vpc.vpc.id
  subnet_id      = aws_subnet.public_subnet_az1.id
  instance_type  = "t2.micro"
  ami            = "ami-0440d3b780d96b29d"  # Replace with your AMI ID
  key_name       = "pavan"
  count          = 1  # Adjust the count as needed
}

# Add any additional configuration or modules as needed
