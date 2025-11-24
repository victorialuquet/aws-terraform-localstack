#!/bin/bash
# Setup script for LocalStack environment

echo "Setting up LocalStack environment..."

# Check if LocalStack is running
if ! curl -s http://localhost:4566/_localstack/health > /dev/null 2>&1; then
    echo "WARNING: LocalStack is not running!"
    echo "Start it with: \`docker run -d -p 4566:4566 localstack/localstack\` or install it locally"
    exit 1
fi

echo "INFO: LocalStack is running"

# Create bucket conditionally
if aws --endpoint-url=http://localhost:4566 s3 ls | grep -q $BUCKET_NAME; then
    echo "INFO: S3 bucket '$BUCKET_NAME' already exists"
else
    # Create S3 bucket for Terraform state
    echo "INFO: Creating S3 bucket for Terraform state..."
    aws --endpoint-url=http://localhost:4566 s3 mb s3://$BUCKET_NAME 2>/dev/null

    echo "INFO: checking bucket setup..."
    sleep 2

    # Check if bucket was correctly created
    if aws --endpoint-url=http://localhost:4566 s3 ls | grep -q $BUCKET_NAME; then
        echo "INFO: S3 bucket '$BUCKET_NAME' is set up!"
    else
        echo "ERROR: failed to create bucket"
    fi
fi

echo ""
echo "> LocalStack setup complete!"
echo ""
echo "Next steps:"
echo "  1. terraform init -backend-config=backend.hcl -reconfigure"
echo "  2. terraform plan"
echo "  3. terraform apply"
