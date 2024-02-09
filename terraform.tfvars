# Region Name for creating AWS resource
region="ap-south-1"
# Project Name
project_name="myapp-project"
# CIDR block for VPC 
vpc_cidr="10.0.0.0/16"
# CIDR block for Public Subnet AZ 1 
public_subnet_az1_cidr="10.0.0.0/24"
# CIDR block for Public Subnet AZ 2
public_subnet_az2_cidr="10.0.1.0/24"
# CIDR block for Private Application Subnet AZ 1
private_app_subnet_az1_cidr="10.0.2.0/24"
# CIDR block for Private Application Subnet AZ 2
private_app_subnet_az2_cidr="10.0.3.0/24"
# Desired EKS worker nodes size 
desired_worker_size=1
# Maximum EKS worker nodes size
maximum_worker_size=1
# Minimum EKS worker nodes size
minimum_worker_size=1