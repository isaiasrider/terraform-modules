module "asg" {
  source = "../../cluster/asg-rolling-deploy"
  cluster_name = "hello-world-${var.environment}"
  user_data = data.template_file.user-data.rendered
  db_remote_state_bucket = ""
  db_remote_state_key = ""
  enable_autoscaling = false
  enable_new_user_data = false
  max_size = var.max_size
  min_size = var.min_size
  subnet_ids = data.aws_subnet_ids.default.ids
  server_name = "teste-deploy"
  server_text = "deployando por terraform modules"
  custom_tags = var.custom_tags

}

module "alb" {
  source = "../../networking/alb"

  alb_name = "teste-deploy${var.environment}"
  subnet_ids = data.aws_subnet_ids.default.ids
}