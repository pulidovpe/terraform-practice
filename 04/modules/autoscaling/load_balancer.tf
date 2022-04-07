# Create a new load_balancer
resource "aws_elb" "web" {
  name            = "${var.TF_VAR_project_name}-elb-web"
  
  subnets         = "${data.aws_subnet_ids.selected.ids}"

  #allocation_id   = "${aws_eip.instance_eip.id}"

  security_groups = [
    "${aws_security_group.allow_http_anywhere.id}"
  ]

  # availability_zones = [
  #   "${var.myregion}a", 
  #   "${var.myregion}b", 
  #   "${var.myregion}c"
  # ]

  # access_logs {
  #   bucket        = "foo"
  #   bucket_prefix = "bar"
  #   interval      = 60
  # }

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = var.TF_VAR_elb_health_check_interval
  }

  # instances                   = ["${aws_instance.foo.id}"]

  tags = {
    Name = "${var.TF_VAR_project_name}-elb-web"
  }
}