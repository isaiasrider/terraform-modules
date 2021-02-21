variable "instance_type" {
  description = "instance size"
  default = "t2.micro"
}

variable "server_name" {
  type = string
}

variable "server_port" {
  default = 80
}

variable "cluster_name" {
  description = "the name used for all the clusters resources"
  type = string
}


variable "min_size" {
  description = "set up minimum size over ASGs"
  type = number
}

variable "max_size" {
  description = "set up minimum size over ASGs"
  type = number
}

variable "custom_tags" {
  type = map(string)
  default = {}
}

variable "enable_autoscaling" {
  description = "scale in and out depending of the hour"
  type = bool
}


variable "server_text" {
  description = "text showed up to index page"
  type = string
}

variable "ami" {
  type = string
  default = "ami-0a0ad6b70e61be944"
}

variable "subnet_ids" {
  type = list(string)
}

variable "target_group_arns" {
  type = list(string)
  default = []
}

variable "heal_check_type" {
  type = string
  default = "ELB"
}

variable "user_data" {
  type = string
  default = " "
}