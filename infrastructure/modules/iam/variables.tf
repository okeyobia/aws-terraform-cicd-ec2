variable "project_name" {
  description = "Project name used for IAM resource naming"
  type        = string
}

variable "codestar_connection_arn" {
  description = "ARN of the CodeStar GitHub connection to attach PassConnection policy"
  type        = string
}

# modules/iam/variables.tf
variable "pipeline_role_name" {
  description = "The name of the CodePipeline execution role"
  type        = string
}

variable "codestar_pass_connection_policy_arn" {
  description = "ARN of the CodeStar PassConnection policy"
  type        = string
}

variable "github_connection_arn" {
  description = "ARN of the GitHub connection to attach PassConnection policy"
  type        = string
}

variable "codestar_pass_connection_arn" {
  description = "ARN of the CodeStar PassConnection policy"
  type        = string
}