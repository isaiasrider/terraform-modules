resource "aws_launch_configuration" "asg_web_launch_configuration" {
  image_id = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.asg_security_group.id]
  user_data = var.user_data
  key_name = "terraform"
  iam_instance_profile = var.instance_profile

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_autoscaling_group" "asg_web" {
  launch_configuration = aws_launch_configuration.asg_web_launch_configuration.name
  max_size = var.max_size
  min_size = var.min_size
  vpc_zone_identifier = data.aws_subnet_ids.default.ids
  name = "${var.cluster_name}-${aws_launch_configuration.asg_web_launch_configuration.name}"
  target_group_arns = [aws_lb_target_group.target_group_asg.arn]
  health_check_type = "ELB"
  min_elb_capacity = var.min_size
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key = "Name"
    propagate_at_launch = true
    value = "${var.cluster_name}-asg"

  }
  dynamic "tag" {
    for_each = var.custom_tags
    content {
      key = tag.key
      value = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_lb" "lb_web" {
  name = "${var.cluster_name}"
  load_balancer_type = "application"
  subnets = data.aws_subnet_ids.default.ids
  security_groups = [aws_security_group.asg_security_group.id]
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.lb_web.arn
  port = var.server_port
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

resource "aws_lb_target_group" "target_group_asg" {
  name = "${var.cluster_name}-terraform-example"
  port = var.server_port
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

resource "aws_lb_listener_rule" "listener_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
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

