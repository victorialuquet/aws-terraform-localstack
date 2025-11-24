terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    # Configuration provided via backend.hcl
  }
}

provider "aws" {
  region = "us-east-1"
  # Uses AWS credentials from environment or ~/.aws/credentials
}
