# Create a new load balancer
resource "aws_elb" "web" {
  name               = "${var.project_name}-elb-web"
  
  subnets = "${data.aws_subnet_ids.selected.ids}"

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
    timeout             = 2
    target              = "HTTP:80/"
    interval            = 5
  }

  # instances                   = ["${aws_instance.foo.id}"]

  tags = {
    Name = "${var.project_name}-elb-web"
  }
}