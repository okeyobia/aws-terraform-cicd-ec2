############################################
# CodeDeploy Application
############################################
resource "aws_codedeploy_app" "this" {
  count            = var.enable_codedeploy ? 1 : 0
  name             = "${var.project_name}-app"
  compute_platform = "Server"
}

############################################
# CodeDeploy Deployment Group
############################################
resource "aws_codedeploy_deployment_group" "this" {
  count                = var.enable_codedeploy ? 1 : 0
  app_name             = aws_codedeploy_app.this[0].name
  deployment_group_name = "${var.project_name}-dg"
  service_role_arn     = var.codedeploy_role_arn

  deployment_config_name = "CodeDeployDefault.OneAtATime"

  autoscaling_groups = [aws_autoscaling_group.this.name]

  load_balancer_info {
    target_group_info {
      name = aws_lb_target_group.this.name
    }
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "IN_PLACE"
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
}
