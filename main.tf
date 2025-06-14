module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "eks" {
  source       = "./modules/eks"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnets
  cluster_name = var.cluster_name
}

module "jenkins" {
  source    = "./modules/jenkins"
  key_name  = var.key_name
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnets[0]
}
