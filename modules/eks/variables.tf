# CIDR block for Public Subnet AZ 1 
variable "public_subnet_az1_id" {}
# CIDR block for Public Subnet AZ 2
variable "public_subnet_az2_id" {}
# CIDR block for Private Application Subnet AZ 1
variable "private_app_subnet_az1_id" {}
# CIDR block for Private Application Subnet AZ 2
variable "private_app_subnet_az2_id" {}
# Security Group To be Used For accessing EKS Worker nodes
variable "source_security_group_ids" {}
# Key Pair Name To be Used For Accessing EKS worker nodes
variable "key_name" {}