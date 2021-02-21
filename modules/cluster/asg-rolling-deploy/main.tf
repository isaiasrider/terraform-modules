resource "aws_launch_configuration" "asg_web_launch_configuration" {
  image_id = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.asg_security_group_instances.id]
  user_data = var.user_data
  key_name = "terraform"

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_autoscaling_group" "asg_web" {

  name = "${var.cluster_name}-${aws_launch_configuration.asg_web_launch_configuration.name}"
  launch_configuration = aws_launch_configuration.asg_web_launch_configuration.name
  max_size = var.max_size
  min_size = var.min_size
  vpc_zone_identifier = var.subnet_ids
  target_group_arns = var.target_group_arns
  health_check_type = var.heal_check_type
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





