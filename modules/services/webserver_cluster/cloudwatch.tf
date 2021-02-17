resource "aws_cloudwatch_metric_alarm" "high-cpu-utilization" {
  alarm_name = "${var.cluster_name}-high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 1
  namespace = "AWS/EC2"
  metric_name = "CPUUtilization"
  period = 300
  statistic = "Average"
  threshold = 90
  unit = "Percent"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_web.name
  }
}

resource "aws_cloudwatch_metric_alarm" "low-cpu-credit-balance" {
  count = format("%.1s", var.instance_type == "t" ? 1 : 0)
  alarm_name = "${var.cluster_name}-low-cpu-credit-balance"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = 1
  namespace = "AWS/EC2"
  metric_name = "CPUCreditBalance"
  period = 300
  statistic = "Minimum"
  threshold = 10
  unit = "Count"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_web.name
  }
}