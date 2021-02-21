variable "environment" {
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

variable "server_text" {
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
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default     = {}
}

