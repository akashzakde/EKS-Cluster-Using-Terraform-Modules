# Project Name
variable "project_name" {}
# CIDR block for VPC 
variable "vpc_cidr" {}
# CIDR block for Public Subnet AZ 1 
variable "public_subnet_az1_cidr" {}
# CIDR block for Public Subnet AZ 2
variable "public_subnet_az2_cidr" {}
# CIDR block for Private Application Subnet AZ 1
variable "private_app_subnet_az1_cidr" {}
# CIDR block for Private Application Subnet AZ 2
variable "private_app_subnet_az2_cidr" {}
# CIDR block for Private Database Subnet AZ 1
variable "private_data_subnet_az1_cidr" {}
# CIDR block for Private Database Subnet AZ 2
variable "private_data_subnet_az2_cidr" {}