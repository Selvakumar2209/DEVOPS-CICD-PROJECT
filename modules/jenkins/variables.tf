variable "key_name" {
  description = "The name of the AWS Key Pair to use for SSH"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to associate with Jenkins SG"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch Jenkins instance"
  type        = string
}