<h1>Module Alb</h1>
<h4>This modules is used to deploy a simple alb and attach a http_listener(listening http port)</h4>

**Syntax**

###setup provider
```
provider "aws" {
region = "us-east-2"
}
```
###calling module

```
module "alb" {
  source = "../../networking/alb"

  alb_name = var.alb_name
  subnet_ids = data.aws_subnet_ids.default.ids

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
