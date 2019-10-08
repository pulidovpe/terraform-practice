resource "aws_autoscaling_group" "web" {
  name                 = "${var.project_name}-web"
  launch_configuration = "${aws_launch_configuration.web.name}"

  min_size             = 0
  max_size             = 2
  desired_capacity     = 0

  load_balancers       = [
    "${aws_elb.web.name}"
  ]

  health_check_type    = "ELB"
  health_check_grace_period = 10

  vpc_zone_identifier  = "${data.aws_subnet_ids.selected.ids}"

  tag {
    key                = "Name"
    value              = "${var.project_name}-web-asg"
    propagate_at_launch= true
  }
}