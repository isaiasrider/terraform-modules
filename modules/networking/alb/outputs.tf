output "alb_dns_name" {
  value = aws_lb.lb_web.dns_name
  description = "alb dns name"
}

output "alb_http_listener_arn" {
  value = aws_lb_listener.http_listener.arn
  description = "The arn of the HTTP listener"
}

output "alb_security_group_id" {
  value = aws_security_group.alb_security_group.id
}