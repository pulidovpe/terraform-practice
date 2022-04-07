resource "aws_autoscaling_group" "web" {
  name                 = "${var.TF_VAR_project_name}-web"
  launch_configuration = "${aws_launch_configuration.web.name}"

  min_size             = var.TF_VAR_min_size
  max_size             = var.TF_VAR_max_size
  desired_capacity     = var.TF_VAR_desired_capacity

  load_balancers       = [
    "${aws_elb.web.name}"
  ]

  health_check_type         = "ELB"   ## ELB or EC2
  health_check_grace_period = var.TF_VAR_health_check_grace_period

  vpc_zone_identifier  = "${data.aws_subnet_ids.selected.ids}"

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                = "Name"
    value              = "${var.TF_VAR_project_name}-web-asg"
    propagate_at_launch= true
  }
}