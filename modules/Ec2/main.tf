# ec2_module.tf

variable "project_name" {
  description = "The name of the project"
}

variable "vpc_id" {
  description = "The ID of the VPC where EC2 instances will be launched"
}

variable "subnet_id" {
  description = "The ID of the subnet where EC2 instances will be launched"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
}

variable "ami" {
  description = "The AMI to use for the EC2 instances"
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instances"
}

#variable "count" {
 # description = "The number of EC2 instances to launch"
  #default     = 1
#}

resource "aws_instance" "ec2_instances" {
  count = var.count

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = ["${aws_security_group.default.id}"] # Include your security group(s) here

  subnet_id = var.subnet_id

  tags = {
    Name        = "${var.project_name}-ec2-${count.index + 1}"
    Environment = "Production"  # You can customize tags as needed
  }
}

output "ec2_instance_ids" {
  value = aws_instance.ec2_instances[*].id
}
