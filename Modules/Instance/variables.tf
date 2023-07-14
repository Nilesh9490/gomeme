variable "key_name" {
default = "ssh_key"
}
variable "instance_names" {
  type    = list(string)
  default = ["dev-ec2", "qa-ec2"]
}

variable "ebs_names" {
  type    = list(string)
  default = ["dev-ebs", "qa-ebs"]
}

variable "AWS_REGION" {
default = "eu-west-2"
}

variable "instance_type2" {
type = string
default = "t2.micro"
description = "ec2 for ssh"
}

variable "ami2"{
  default = "ami-007ec828a062d87a5"
}

variable "instance_type" {
type = string
default = "t3.medium"
}

variable "ebs_block_device_size"{
  default = "30"
}

variable "AMIS" {
    type = map
    default = {
        eu-west-2 = "ami-007ec828a062d87a5"
    }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "ssh_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "ssh_key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "public_subnets" {
  description = "public subnet IDs"
  type        = list(string)
}

variable "private_subnets" {
  description = "private subnet IDs"
  type        = list(string)
}

# variable "security_group_id" {
#   description = "ID of the security group to associate with the instance"
# }
