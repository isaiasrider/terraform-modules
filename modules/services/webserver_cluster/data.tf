data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    key = var.db_remote_state_key
    bucket = var.db_remote_state_bucket
    region = "us-east-2"

  }

}

data template_file "user-data" {
  count = var.enable_new_user_data ? 0 : 1
  template = "${file("${path.module}/script/user-data.sh")}"
  vars = {
    database_address = data.terraform_remote_state.db.outputs.db_url
    database_port = data.terraform_remote_state.db.outputs.db_port

  }
}
data template_file "new-user-data" {
  count = var.enable_new_user_data ? 1 : 0
  template = file("${path.module}/script/new-user-data.sh")
  vars = {
    database_address = data.terraform_remote_state.db.outputs.db_url
    database_port = data.terraform_remote_state.db.outputs.db_port
    server_name = var.server_name

  }
}