data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket = var.terraform_state_bucket
    key    = "dev/terraform.tfstate"
    region = var.region
  }
}



