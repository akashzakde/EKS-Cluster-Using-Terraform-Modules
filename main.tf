# Calling VPC module for creating VPC on AWS
module "vpc" {
  source = "./modules/vpc"
  project_name                 = var.project_name
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
}
# Calling EKS module for creating EKS cluster
module "eks" {
  source = "./modules/eks"
  public_subnet_az1_id = "${module.vpc.public_subnet_az1_id}"
  public_subnet_az2_id = "${module.vpc.public_subnet_az2_id}"
  private_app_subnet_az1_id = "${module.vpc.private_app_subnet_az1_id}"
  private_app_subnet_az2_id = "${module.vpc.private_app_subnet_az2_id}"
  desired_worker_size = var.desired_worker_size
  maximum_worker_size = var.maximum_worker_size
  minimum_worker_size = var.minimum_worker_size
}