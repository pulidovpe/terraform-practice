# provider.tf
provider "aws" {
   profile                 = "default"
   region                  = var.TF_VAR_region
}