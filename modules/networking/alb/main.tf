resource "aws_lb" "lb_web" {
  name = var.alb_name
  load_balancer_type = "application"
  subnets = var.subnet_ids
  security_groups = [aws_security_group.alb_security_group.id]
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.lb_web.arn
  port = local.http_port
  protocol = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: ow doido, nem existe essa page"
      status_code = 404
    }
  }
}

