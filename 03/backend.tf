terraform {
   backend "s3" {
      bucket      = "tf-backend-aventura-tech"
      key         = "terraform/production/terraform.tfstate"
      region      = "us-east-2"
      encrypt     = true
      kms_key_id  = "arn:aws:kms:us-east-2:767167112715:key/8735bec3-adab-41a1-a96c-9ed5559f6d81"
   }
}