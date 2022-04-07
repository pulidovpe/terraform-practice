resource "aws_autoscaling_group" "aventura_ecs" {
  name                 = "aventura_ecs"
  vpc_zone_identifier  = ["${module.vpc.private_subnets}"]
  launch_configuration = "${aws_launch_configration.aventura_ecs.name}"

  desired_capacity = 3
  min_size         = 3
  max_size         = 3
}