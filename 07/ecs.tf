# ecs
provider "aws" {
   region = "${var.TF_VAR_region}"
}

module "ecs" {
   source = "./modules/ecs"

   environment          = "${var.TF_VAR_environment}"
   cluster              = "${var.TF_VAR_environment}"
   cloudwatch_prefix    = "${var.TF_VAR_environment}"           #See ecs_instances module when to set this and when not!
   vpc_cidr             = "${var.TF_VAR_vpc_cidr}"
   public_subnet_cidrs  = "${var.TF_VAR_public_subnet_cidrs}"
   private_subnet_cidrs = "${var.TF_VAR_private_subnet_cidrs}"
   availability_zones   = "${var.TF_VAR_availability_zones}"
   max_size             = "${var.TF_VAR_max_size}"
   min_size             = "${var.TF_VAR_min_size}"
   desired_capacity     = "${var.TF_VAR_desired_capacity}"
   key_name             = "${aws_key_pair.ecs.key_name}"
   instance_type        = "${var.TF_VAR_instance_type}"
   ecs_aws_ami          = "${data.aws_ami.ubuntu.id}"
}

output "default_alb_target_group" {
   value = "${module.ecs.default_alb_target_group}"
}