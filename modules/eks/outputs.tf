output "cluster_id" {
  description = "The EKS cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_certificate_authority_data" {
  description = "Certificate Authority data for the EKS cluster"
  value       = module.eks.cluster_certificate_authority_data
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS Kubernetes API server."
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "The Cluster Name"
  value       = module.eks.cluster_name
}
