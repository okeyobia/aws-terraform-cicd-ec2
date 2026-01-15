terraform {
    backend "s3" {
        bucket = "terraform-state-bucket-okeyobia"
        key = "prod/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
        use_lockfile = true # This is to prevent race conditions when multiple Terraform processes try to access the same state file concurrently
    }
}