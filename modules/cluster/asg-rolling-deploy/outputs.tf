output "asg_name" {
  value = aws_autoscaling_group.asg_web.name
  description = "The name of the auto scaling group"
}

output "instance_security_group_id" {
  value = aws_security_group.asg_security_group_instances.id
}
