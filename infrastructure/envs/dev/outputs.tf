# IAM Role Outputs (for use by pipeline via remote state)
output "codebuild_role_arn" {
  description = "ARN of the CodeBuild service role"
  value       = module.iam.codebuild_role_arn
}

output "codepipeline_role_arn" {
  description = "ARN of the CodePipeline service role"
  value       = module.iam.codepipeline_role_arn
}

output "codedeploy_role_arn" {
  description = "ARN of the CodeDeploy service role"
  value       = module.iam.codedeploy_role_arn
}

# EC2 Outputs
output "ec2_instance_profile" {
  description = "Name of the EC2 instance profile"
  value       = module.iam.ec2_instance_profile
}

# Networking Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.networking.public_subnet_ids
}

# Load Balancer Outputs
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.ec2.alb_dns_name
}

output "target_group_name" {
  description = "Name of the target group"
  value       = module.ec2.target_group_name
}
