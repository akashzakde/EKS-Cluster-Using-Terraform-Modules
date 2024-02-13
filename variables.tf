# Cluster name
variable "cluster_name" {}
# Node Group name
variable "node_group_name" {}
# aws region
variable "region" {}
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
# Desired EKS worker nodes size 
variable "desired_worker_size" { type = number}
# Maximum EKS worker nodes size
variable "maximum_worker_size" { type = number}
# Minimum EKS worker nodes size
variable "minimum_worker_size" { type = number}