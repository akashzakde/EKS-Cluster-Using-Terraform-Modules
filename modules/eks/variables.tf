# CIDR block for Public Subnet AZ 1 
variable "public_subnet_az1_id" {}
# CIDR block for Public Subnet AZ 2
variable "public_subnet_az2_id" {}
# CIDR block for Private Application Subnet AZ 1
variable "private_app_subnet_az1_id" {}
# CIDR block for Private Application Subnet AZ 2
variable "private_app_subnet_az2_id" {}
# Desired EKS worker nodes size 
variable "desired_worker_size" { type = number}
# Maximum EKS worker nodes size
variable "maximum_worker_size" { type = number}
# Minimum EKS worker nodes size
variable "minimum_worker_size" { type = number}