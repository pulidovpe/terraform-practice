# listeners.tf

resource "aws_lb_listener" "listener_ssh" {
  load_balancer_arn = var.nlb_arn
  protocol          = "TCP"
  port              = var.ssh_port

  default_action {
    target_group_arn = aws_lb_target_group.ssh.arn
    type             = "forward"
  }
}

resource "aws_lb_listener_rule" "listener_443_rule" {
  listener_arn = var.listener_sup_rule_arn
  #priority     = 99    
  ## Leaving it unset will automatically set the rule with next available priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.superset.arn
  }

  condition {
    host_header {
      values = ["${var.dns_host}"]
    }
  }
}

resource "aws_lb_listener_rule" "listener_8080_rule" {
  count        = var.etl ? 1 : 0 ## Contition to create
  listener_arn = var.listener_etl_rule_arn
  #priority     = 99    
  ## Leaving it unset will automatically set the rule with next available priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.etl[count.index].arn
  }

  condition {
    host_header {
      values = ["${var.dns_host}"]
    }
  }
}