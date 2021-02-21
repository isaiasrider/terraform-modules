<h1>Module Asg</h1>
<h4>This modules is used to deploy a simple and powerfull AutoScalingGroup</h4>

**Syntax**

###setup provider
```
provider "aws" {
region = "us-east-2"
}
```
###calling module
```
module "asg" {
source = "../../cluster/asg-rolling-deploy"
```
```
cluster_name = var.cluster_name
instance_type = "t2.micro"
max_size = 1
min_size = 1
enable_autoscaling = false
subnet_ids = data.aws_subnet_ids.default.ids
server_name = "MEU_SERVER"
server_text = "teste meu server"
}
```
###feed with data sources 
```
data "aws_vpc" "default" {
default = true
}
data "aws_subnet_ids" "default" {
vpc_id = data.aws_vpc.default.id
}
```
