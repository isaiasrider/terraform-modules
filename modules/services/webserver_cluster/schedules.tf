resource "aws_autoscaling_group" "scale-out-during-business-hours" {
  schedule_action_name = "${var.cluster_name}-scale-out-during-business-hour"
  count = var.enable_autoscaling ? 1 : 0
  max_size = 2
  min_size = 10
  desired_capacity = 10
  recurrence = "0 9 * * *"
  autoscaling_group_name = aws_autoscaling_group.asg_web.name
}

resource "aws_autoscaling_group" "scale-in-at-nigh" {
  schedule_action_name = "${var.cluster_name}-scale-in-at-night"
  count = var.enable_autoscaling ? 0 : 1
  max_size = 2
  min_size = 10
  desired_capacity = 2
  recurrence = "0 17 * * *"
  autoscaling_group_name = aws_autoscaling_group.asg_web.name
}