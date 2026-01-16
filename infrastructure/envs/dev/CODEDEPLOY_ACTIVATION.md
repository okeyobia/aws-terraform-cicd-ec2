# CodeDeploy Activation Guide

## Error: SubscriptionRequiredException

If you're encountering the error:
```
SubscriptionRequiredException: The AWS Access Key Id needs a subscription for the service
```

This means CodeDeploy is not activated in your AWS account.

## Solution: Activate CodeDeploy in AWS Account

### Step 1: Verify Account Status

1. Log in to AWS Console as the **root user** (or user with full permissions)
2. Go to **Account Settings** → Verify:
   - ✅ Valid payment method is added
   - ✅ Phone number is verified
   - ✅ Support plan is selected (Basic/Free is sufficient)

### Step 2: Activate CodeDeploy

1. Navigate to **CodeDeploy** service in AWS Console
2. Go to the region where you're deploying (e.g., `us-east-1`)
3. If you see an "Activate" or "Subscribe" button, click it
4. Wait a few minutes for activation to propagate

### Step 3: Verify Activation

Run this AWS CLI command to verify:
```bash
aws deploy list-applications --region us-east-1
```

If it works without errors, CodeDeploy is activated.

### Step 4: Re-enable CodeDeploy in Terraform

Once CodeDeploy is activated, update your `terraform.tfvars`:

```hcl
enable_codedeploy = true
```

Then run:
```bash
terraform apply
```

## Temporary Workaround

If you need to deploy infrastructure without CodeDeploy first, set in `terraform.tfvars`:

```hcl
enable_codedeploy = false
```

This will skip CodeDeploy resources. You can enable them later after activating CodeDeploy in your AWS account.
