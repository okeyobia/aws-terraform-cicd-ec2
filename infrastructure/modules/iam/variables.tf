variable "project_name" {
  description = "Project name used for IAM resource naming"
  type        = string
}

variable "codestar_connection_arn" {
  description = "ARN of the CodeStar GitHub connection to attach PassConnection policy"
  type        = string
}
