# VPC Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}

# Jenkins Outputs
output "jenkins_instance_id" {
  description = "Jenkins EC2 instance ID"
  value       = module.jenkins.jenkins_instance_id
}

output "jenkins_public_ip" {
  description = "Jenkins EC2 Public IP"
  value       = module.jenkins.jenkins_public_ip
}

# EKS Outputs
output "eks_cluster_id" {
  description = "EKS Cluster name"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "EKS cluster API server endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_certificate_authority" {
  description = "EKS Cluster CA data"
  value       = module.eks.cluster_certificate_authority_data
}
