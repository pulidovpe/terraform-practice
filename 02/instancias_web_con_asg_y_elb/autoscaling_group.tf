resource "aws_autoscaling_group" "web" {
  name                 = "${var.project_name}-web"
  launch_configuration = "${aws_launch_configuration.web.name}"
  min_size             = 0
  max_size             = 2
  desired_capacity     = 0
  vpc_zone_identifier  = [
    "subnet-1a993541",
    "subnet-7501a713"
  ]

  tag {
    key                = "Name"
    value              = "${var.project_name}-web-asg"
    propagate_at_launch= true
  }
}