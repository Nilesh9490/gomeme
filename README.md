# Prerequisites
Before using this Terraform code, ensure that you have the following prerequisites installed on your local machine:

- Terraform (version 1.5.0 or later)
- Git

# terraform-aws-infra
terraform script for aws infrastructure

# GETTING STARTED 
* run `terraform init` 

# 1. Create Terraform Workspace 
* use terraform workspace to define name for specific resource / all the resouce will take worspace-name as prefix using following command

`terraform workspace new project-test`

* remember to create workspace only using lower case alphabets and hyphen 

# 2. Customize main.tf

* change count from 0 to desired number in each resource block for creating your desired infrastructure 

# 3. Add Your AWS Access Key-pair and Desired Region

* generate a set of unique access key-pair using AWS 
* Add access key and your desired region-code to variable.tf file 

# 4. Run Following Terraform Commands

`terraform init`
`terraform plan`
`terraform apply`
