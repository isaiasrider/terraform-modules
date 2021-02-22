output "alb_dns_name" {
  value = module.alb.alb_dns_name
  description = "alb dns name"
}

output "alb_http_listener_arn" {
  value = module.alb.alb_http_listener_arn
  description = "The arn of the HTTP listener"
}

output "alb_security_group_id" {
  value = module.alb.alb_security_group_id
}