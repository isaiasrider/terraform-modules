variable "instance_type" {
  description = "instance size"
  default = "t2.micro"
}

variable "user_data" {}

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

variable "ami" {
  type = string
  default = "ami-0a0ad6b70e61be944"
}

variable "container_version" {
  type = string
}