module "vpc" {
  source = "./Modules/vpc"
}

module "rds" {
  source          = "./Modules/RDS"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  count           = 1
}

module "IAM_Role" {
  source = "./Modules/IAM_Role"
  count  = 1

}

module "Security_Group" {
  source     = "./Modules/Security_Group"
  count      = 0
  vpc_id     = module.vpc.vpc_id
  depends_on = [module.vpc]

}


module "Instance" {
  source            = "./Modules/Instance"
  count             = 1
  vpc_id            = module.vpc.vpc_id
  private_subnets   = module.vpc.private_subnets
  public_subnets    = module.vpc.public_subnets
  # security_group_id = module.Security_Group[0].security_group_id
  depends_on = [
    module.IAM_Role, module.vpc
  ]
}

module "frontend" {
  source = "./Modules/frontend"
  count  = 1
}

module "opensearch" {
  source = "./Modules/OpenSearch"
  count  = 1
  vpc_id = module.vpc.vpc_id
  # public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  depends_on      = [module.vpc]

}



terraform {
backend "s3" {
bucket = "xxxxx"
key = "terraform.tfstate"
region = "eu-west-2"
encrypt = true
}
}


