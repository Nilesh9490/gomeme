

variable "allocated_storage" {
  description = "The amount of storage to allocate to the RDS instance (in GB)"
  type        = number
  default = 30
}

variable "engine" {
  description = "The database engine to use for the RDS instance"
  type        = string
  default = "postgres"
}

variable "engine_version" {
  description = "The version of the database engine to use for the RDS instance"
  type        = string
  default = "14.7"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default = "db.t3.small"
}


variable "db_username" {
  description = "The username for the RDS database"
  type        = string
  default = "postgres"
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  default = "VpRsU214q"
}

# variable "rds_sg_name"{
#   type = string 
#   default = "rds-security-group"
#   description = "RDS Name"
# }


# variable "db_name" {
#   description = "The name of the RDS database"
#   type        = string
#   default = "demotest"
# }
# variable "aws_db_subnet_group_name"{
#   default = "rds-subnet-group"
#   type = string 
# }

variable "vpc_id" {
  description = "VPC ID"
}

variable "private_subnets" {
  description = "Private subnet IDs"
  type        = list(string)
}