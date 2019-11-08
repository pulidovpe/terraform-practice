terraform {
   backend "s3" {
      bucket      = "tf-backend-aventura-tech"
      key         = "terraform/04/terraform.tfstate"
      region      = "sa-east-1"
      encrypt     = true
      kms_key_id  = "arn:aws:kms:sa-east-1:767167112715:key/8735bec3-adab-41a1-a96c-9ed5559f6d81"
   }
}