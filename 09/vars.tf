# vars.tf

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-east-2"
}

variable "vpc_id" {
  description = "VPC in use"
  default     = VARIABLE_FOR_VPC
}

variable "private_subnet_id" {
  description = "Subnet in use"
  default     = VARIABLE_FOR_SUBNET
}

variable "instance_type" {
  default = "t2.micro"
}

variable "dns_host" {
  default = VARIABLE_FOR_DNS
}

variable "ec2_instance_name" {
  default = "Testing-terraform"
}

variable key_name {
  default = VARIABLE_FOR_KEY_NAME
}

variable "SSH_PORT" {
  default = 22
}

variable "SUP_PORT" {
  default = 8888
}

variable "ETL_PORT" {
  default = 9999
}

variable "security_group_alb_id" {
  default = VARIABLE_FOR_SECURITY_GROUP
}

variable "security_group_pg_id" {
  default = VARIABLE_FOR_SECURITY_GROUP
}

variable "etl" {
  default = false
}

variable "environment" {
  default = "Test"
}

variable "listener_sup_rule_arn" {
  default = VARIABLE_FOR_ARNs
}

variable "listener_etl_rule_arn" {
  default = VARIABLE_FOR_ARNs
}

variable "nlb_arn" {
  default = VARIABLE_FOR_ARNs
}

/*variable "uptime_aws_ami" {}*/

/*variable "bucket_name" {
  default = "another-bucket-for-test-lock-state"
}*/

/*variable "listener_rule_priority" {
  description = "Leaving it unset will automatically set the rule with next available priority"
}*/