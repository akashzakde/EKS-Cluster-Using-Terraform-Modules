module "vpc" {
  source = "./modules/vpc"
  project_name                 = var.project_name
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
}

module "security-group" {
    source = "./modules/security-group"
    vpc_id = module.vpc.vpc_id
    project_name = var.project_name
    env = var.env
    type = var.type
}

module "keypair" {
    source = "./modules/keypair"
    key_name = var.key_name
}

module "eks" {
  source = "./modules/eks"
  public_subnet_az1_id = "${module.vpc.public_subnet_az1_id}"
  public_subnet_az2_id = "${module.vpc.public_subnet_az2_id}"
  private_app_subnet_az1_id = "${module.vpc.private_app_subnet_az1_id}"
  private_app_subnet_az2_id = "${module.vpc.private_app_subnet_az2_id}"
  key_name = var.key_name
  source_security_group_ids = ["${module.security-group.eks_security_group_id}"]
}