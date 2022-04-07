module "test-module" {
   source   = "./modules/autoscaling"

   TF_VAR_project_name              = var.TF_VAR_project_name
   TF_VAR_environment               = var.TF_VAR_environment
   TF_VAR_myregion                  = var.TF_VAR_myregion
   TF_VAR_key_name                  = var.TF_VAR_key_name
   TF_VAR_acl                       = var.TF_VAR_acl
   TF_VAR_bucket_name               = var.TF_VAR_bucket_name
   TF_VAR_instance_type             = var.TF_VAR_instance_type
   TF_VAR_min_size                  = var.TF_VAR_min_size
   TF_VAR_max_size                  = var.TF_VAR_max_size
   TF_VAR_desired_capacity          = var.TF_VAR_desired_capacity
   TF_VAR_health_check_grace_period = var.TF_VAR_health_check_grace_period
   TF_VAR_elb_health_check_interval = var.TF_VAR_elb_health_check_interval
}