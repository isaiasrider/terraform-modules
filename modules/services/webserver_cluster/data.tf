data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

data template_file "user-data" {
  template = "${file("${path.module}/script/user-data.sh")}"
  vars = {
    container_version = var.container_version
  }
}
