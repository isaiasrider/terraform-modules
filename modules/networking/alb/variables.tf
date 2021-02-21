variable "alb_name" {
  description = "The name to use for this ALB"
  type = string
}

variable "subnet_ids" {
  description = "subnet ids list"
  type = list(string)
}

variable "target_group_arns" {
  description = "The ARNs of ELB target groups in which to register Instances"
  type        = list(string)
  default     = []
}