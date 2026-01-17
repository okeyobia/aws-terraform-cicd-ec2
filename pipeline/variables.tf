variable "project_name" {
  type = string
}

variable "region" {
  type = string
}

variable "artifact_bucket" {
  type        = string
  description = "S3 bucket for CodePipeline artifacts"
}

variable "terraform_state_bucket" {
  type        = string
  description = "S3 bucket where infrastructure Terraform state is stored"
  default     = "terraform-state-bucket-okeyobia-cicd"
}

variable "github_repo" {
  type = string
}

variable "github_owner" {
  type = string
}

variable "github_branch" {
  type    = string
  default = "main"
}

variable "codedeploy_app_name" {
  type = string
}

variable "codedeploy_deployment_group" {
  type = string
}
variable "github_connection_arn" {
  type = string
}
