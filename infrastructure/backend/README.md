# Terraform Remote Backend Setup

This directory contains Terraform configuration to create the remote backend infrastructure needed for state management.

## Resources Created

- **S3 Bucket**: Stores Terraform state files with versioning and encryption enabled
- **DynamoDB Table**: Provides state locking to prevent concurrent modifications

## Deployment

Since this is the bootstrap infrastructure, it must be initialized with a local backend first:

```bash
cd infrastructure/backend

# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply the configuration
terraform apply
```

After the backend resources are created, you can then update your environment-specific `backend.tf` files to use the remote backend.

## Variables

- `aws_region`: AWS region (default: us-east-1)
- `state_bucket_name`: S3 bucket name (default: terraform-state-bucket-okeyobia)
- `dynamodb_table_name`: DynamoDB table name (default: terraform-state-lock)

## Security Features

- Server-side encryption enabled on S3 bucket
- Public access blocked on S3 bucket
- Versioning enabled for state file recovery
- Lifecycle policy to clean up old versions after 90 days
