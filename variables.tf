variable "aws_region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  default = "devops-eks-cluster"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "key_name" {
  description = "The name of the AWS Key Pair to use for SSH"
  type        = string
}
