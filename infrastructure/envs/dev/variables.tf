variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for public subnets"
  type        = list(string)
}

variable "enable_codedeploy" {
  description = "Enable CodeDeploy application and deployment group"
  type        = bool
  default     = false
}

variable "codestar_connection_arn" {
  description = "ARN of the CodeStar GitHub connection to attach PassConnection policy"
  type        = string
}