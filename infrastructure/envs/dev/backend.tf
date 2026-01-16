terraform {
    backend "s3" {
        bucket = "terraform-state-bucket-okeyobia"
        key = "dev/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
        use_lockfile = true
    }
}