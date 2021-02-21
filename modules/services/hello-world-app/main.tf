resource "aws_lb_listener_rule" "listener_rule" {
  listener_arn = module.alb.alb_http_listener_arn
  priority = 100
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.target_group_asg.arn
  }
  condition {
    path_pattern {
      values = ["*"]
    }
  }
}

resource "aws_lb_target_group" "target_group_asg" {
  name = "hello-world-${var.environment}"
  port = local.http_port
  protocol = "HTTP"
  vpc_id = data.aws_vpc.default.id
  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}
