terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "networking" {
  source = "../../modules/networking"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
  pipeline_role_name          = "${var.project_name}-codepipeline-role"
  codestar_connection_arn     = var.codestar_connection_arn
  github_connection_arn = var.github_connection_arn
  codestar_pass_connection_arn = var.codestar_pass_connection_arn
  codestar_pass_connection_policy_arn = var.codestar_pass_connection_policy_arn
}

module "ec2" {
  source = "../../modules/ec2"

  project_name          = var.project_name
  region                = var.region
  vpc_id                = module.networking.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  alb_security_group_id = module.networking.alb_security_group_id
  ec2_security_group_id = module.networking.ec2_security_group_id
  ec2_instance_profile  = module.iam.ec2_instance_profile
  codedeploy_role_arn   = module.iam.codedeploy_role_arn
  enable_codedeploy     = var.enable_codedeploy
}
