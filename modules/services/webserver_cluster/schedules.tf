resource "aws_autoscaling_schedule" "scale-out-during-business-hours" {
  scheduled_action_name = "${var.cluster_name}-scale-out-during-business-hour"
  count = var.enable_autoscaling ? 1 : 0
  min_size = 2
  max_size = 10
  desired_capacity = 10
  recurrence = "0 9 * * *"
  autoscaling_group_name = aws_autoscaling_group.asg_web.name
}

resource "aws_autoscaling_schedule" "scale-in-at-nigh" {
  scheduled_action_name = "${var.cluster_name}-scale-in-at-night"
  count = var.enable_autoscaling ? 0 : 1
  min_size = 1
  max_size = 2
  desired_capacity = 2
  recurrence = "0 17 * * *"
  autoscaling_group_name = aws_autoscaling_group.asg_web.name
}