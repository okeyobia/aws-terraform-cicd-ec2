project_name = "aws-terraform-cicd-ec2-dev"
region       = "us-east-1"

# VPC Configuration
vpc_cidr = "10.0.0.0/16"

# Public Subnets (2 subnets for high availability)
public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

# Availability Zones (must match the number of subnets)
availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

# CodeDeploy Configuration
# Set to false if CodeDeploy is not activated in your AWS account
# See CODEDEPLOY_ACTIVATION.md for activation instructions
enable_codedeploy = true

# CodeStar Connection ARN
codestar_connection_arn = "arn:aws:codestar-connections:us-east-1:430367037730:connection/b28638a5-7626-46db-8e40-b2d3f977c4f4"
# CodeStar PassConnection Policy ARN
