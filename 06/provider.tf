# provider.tf
provider "aws" {
  # shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
  region                  = var.TF_VAR_aws_region
}