variable "project_name" {
  default = "NAME_OF_THE_PROJECT"
}

variable "environment" {
  default = "Production"
}

variable "aws_region" {
  default = "us-east-2"
}

variable "acl" {
  default = "private"
}

variable "bucket_name" {
  default = "another-bucket-for-test-lock-state"
}

variable "tags" {
  type = map(string)
  default = { Environment = "Production", CreatedBy = "Terraform" }
}
#instance_type  = "t3.micro"
