variable "instance_type" {
  type = string
  description = "Preferred type of instance for cluster"
  default = "t3.small.search"
}

variable "instance_count"{
  default = "1"
}

variable "ebs_options_volume_type"{
  default = "gp2"
}
variable "ebs_options_volume_size"{
  default = 30
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "private_subnets" {
  description = "private subnet IDs"
  type        = list(string)
}
