# Region Name for creating AWS resource
region="ap-south-1"
# Project Name
project_name="myapp-project"
# Environment to be used for EKS cluster
env="DEV"
# Type of cluster 
type="TERRAFORM"
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
# CIDR block for Database Subnet AZ 1
private_data_subnet_az1_cidr="10.0.4.0/24"
# CIDR block for Database Subnet AZ 2
private_data_subnet_az2_cidr="10.0.5.0/24"
# Key Pair Name To be Used For Accessing EKS worker nodes
key_name="gitops-key"
