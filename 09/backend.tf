terraform {
   backend "s3" {
      bucket         = "THE_NAME_FOR_THE_BUCKET"
      key            = "Production/terraform.tfstate"
      region         = "us-east-2"
      dynamodb_table = "THE_NAME_FOR_THE_TABLE"
   }
}