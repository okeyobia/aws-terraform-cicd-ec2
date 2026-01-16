variable "project_name" {
  type = string
}

variable "region" {
  type = string
}

variable "artifact_bucket" {
  type = string
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
