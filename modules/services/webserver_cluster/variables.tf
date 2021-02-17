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

variable "db_remote_state_bucket" {
  description = "the name of s3 bucket used to point db's tf-remote-state"
  type = string
}

variable "db_remote_state_key" {
  description = "path to reach the tf-remote-state db"
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

variable "enable_new_user_data" {
  type = bool
}

