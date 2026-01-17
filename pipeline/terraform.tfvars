project_name = "aws-terraform-cicd-ec2-dev"
region       = "us-east-1"

# S3 bucket for CodePipeline artifacts (must be created separately)
artifact_bucket = "terraform-state-bucket-okeyobia-cicd"

# GitHub Configuration
github_owner = "okeyobia"
github_repo  = "aws-terraform-cicd-ec2"
github_branch = "main"

github_connection_arn = "arn:aws:codestar-connections:us-east-1:430367037730:connection/b28638a5-7626-46db-8e40-b2d3f977c4f4"


# CodeDeploy Configuration (must match values from infrastructure deployment)
codedeploy_app_name         = "aws-terraform-cicd-ec2-dev-app"
codedeploy_deployment_group = "aws-terraform-cicd-ec2-dev-dg"
