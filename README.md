# Terraform Setup for CI/CD Project on AWS

This repository manages infrastructure for the CI/CD pipeline using Terraform. It provisions:

- EKS Cluster
- VPC and Subnets
- EC2 for Jenkins

## Directory Structure

DEVOPS-CICD-PROJECT/
├── modules/
│   ├── eks/
│   │   ├── eks.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── jenkins/
│   │   ├── jenkins.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc/
│       ├── outputs.tf
│       ├── variables.tf
│       └── vpc.tf
├── main.tf
├── outputs.tf
├── provider.tf
└── variables.tf

