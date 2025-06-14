module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.31"
  cluster_name    = var.cluster_name
  cluster_version = "1.31"

  subnet_ids = var.subnet_ids
  vpc_id     = var.vpc_id

  eks_managed_node_groups = {
    devops-node-group = {
      desired_size   = 2
      max_size       = 2
      min_size       = 1
      instance_types = ["t3.medium"]
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
    Name        = "eks"
  }
}
