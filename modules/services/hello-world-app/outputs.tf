output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "asg_name" {
  value = module.asg.asg_name
}

output "instance_security_group_id" {
  value = module.asg.instance_security_group_id
}

output "lb_target_group_arn" {
  value = aws_lb_target_group.target_group_asg.arn
}