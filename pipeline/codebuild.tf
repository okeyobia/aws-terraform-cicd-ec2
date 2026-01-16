resource "aws_codebuild_project" "terraform_plan" {
  name          = "${var.project_name}-tf-plan"
  service_role = data.terraform_remote_state.infra.outputs.codebuild_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = false
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspecs/terraform-plan.yml"
  }
}

resource "aws_codebuild_project" "terraform_apply" {
  name          = "${var.project_name}-tf-apply"
  service_role = data.terraform_remote_state.infra.outputs.codebuild_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:7.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspecs/terraform-apply.yml"
  }
}

resource "aws_codebuild_project" "app_build" {
  name          = "${var.project_name}-app-build"
  service_role = data.terraform_remote_state.infra.outputs.codebuild_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:7.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspecs/app-build.yml"
  }
}
