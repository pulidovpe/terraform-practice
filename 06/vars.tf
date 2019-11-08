# vars.tf

variable "TF_VAR_aws_region" {
  description = "The AWS region things are created in"
}

variable "TF_VAR_ecs_task_execution_role_name" {
  description = "ECS task execution role name"
}

variable "TF_VAR_ecs_auto_scale_role_name" {
  description = "ECS auto scale role Name"
}

variable "TF_VAR_az_count" {
  description = "Number of AZs to cover in a given region"
}

variable "TF_VAR_app_image" {
  description = "Docker image to run in the ECS cluster"
}

variable "TF_VAR_app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
}

variable "TF_VAR_app_count" {
  description = "Number of docker containers to run"
}

variable "TF_VAR_health_check_path" {}
variable "TF_VAR_min_size" {}
variable "TF_VAR_max_size" {}
variable "TF_VAR_desired_capacity" {}
variable "TF_VAR_health_check_grace_period" {}
variable "TF_VAR_elb_health_check_interval" {}
variable "TF_VAR_key_name" {}
variable "TF_VAR_instance_type" {}
variable "TF_VAR_environment" {}
variable "TF_VAR_project_name" {}

variable "TF_VAR_fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
}

variable "TF_VAR_fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
}