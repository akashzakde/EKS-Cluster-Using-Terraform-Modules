# Region Name for creating AWS resource
variable "region" {}
# Project Name
variable "project_name" {}
# Environment to be used for EKS cluster
variable "env" {}
# Type of cluster 
variable "type" {}
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
# Key Pair Name To be Used For Accessing EKS worker nodes
variable "key_name" {}