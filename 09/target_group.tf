# target_group.tf

resource "aws_lb_target_group" "ssh" {
  name     = "${var.environment}-${var.ec2_instance_name}-SSH-${var.SSH_PORT}"
  port     = var.SSH_PORT
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "ssh" {
  target_group_arn = aws_lb_target_group.ssh.arn
  target_id        = aws_instance.ec2_instance.id
  port             = var.SSH_PORT
}

resource "aws_lb_target_group" "superset" {
  name     = "${var.environment}-${var.ec2_instance_name}-SUP-${var.SUP_PORT}"
  port     = var.SUP_PORT
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 10
    port                = var.SUP_PORT
    path                = "/health"
    protocol            = "HTTP"
    interval            = 30
    matcher             = "200"
  }
}

resource "aws_lb_target_group_attachment" "superset" {
  target_group_arn = aws_lb_target_group.superset.arn
  target_id        = aws_instance.ec2_instance.id
  port             = var.SUP_PORT
}

resource "aws_lb_target_group" "etl" {
  count    = var.etl ? 1 : 0 ## Contition to create
  name     = "${var.environment}-${var.ec2_instance_name}-ETL-${var.ETL_PORT}"
  port     = var.ETL_PORT
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 10
    port                = var.ETL_PORT
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    matcher             = "200"
  }
}

resource "aws_lb_target_group_attachment" "etl" {
  count            = var.etl ? 1 : 0 ## Contition to create
  target_group_arn = aws_lb_target_group.etl[count.index].arn
  target_id        = aws_instance.ec2_instance.id
  port             = var.ETL_PORT
}