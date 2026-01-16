variable "project_name" {
  type = string
}

variable "region" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "desired_capacity" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 3
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_security_group_id" {
  type = string
}

variable "ec2_security_group_id" {
  type = string
}

variable "ec2_instance_profile" {
  type = string
}

variable "codedeploy_role_arn" {
  type = string
}

variable "enable_codedeploy" {
  description = "Enable CodeDeploy application and deployment group"
  type        = bool
  default     = true
}

