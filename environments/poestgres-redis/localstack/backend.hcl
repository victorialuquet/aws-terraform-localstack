bucket                      = "terraform-state"
key                         = "localstack/terraform.tfstate"
region                      = "us-east-1"
endpoints                   = { s3 = "http://localhost:4566" }
skip_credentials_validation = true
skip_metadata_api_check     = true
skip_region_validation      = true
skip_requesting_account_id  = true
force_path_style            = true
access_key                  = "test"
secret_key                  = "test"
