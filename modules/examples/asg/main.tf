provider "aws" {
  region = "us-east-2"
}

module "asg" {
  source = "../../cluster/asg-rolling-deploy"

  cluster_name = var.cluster_name
  instance_type = "t2.micro"
  max_size = 1
  min_size = 1
  enable_autoscaling = false
  subnet_ids = data.aws_subnet_ids.default.ids
  server_name = "MEU_SERVER"
  server_text = "teste meu server"
}

data "aws_vpc" "default" {
  default = true
}
data "aws_subnet_ids" "default" {
vpc_id = data.aws_vpc.default.id
}