variable "env" {}
variable "vpc_id" {}
variable "tags" {}
variable "ssh_ingress_cidr" {}
variable "app_listen_port" {}
variable "sg_ingress_cidr" {}
variable "instance_type" {}
variable "app_subnet_ids" {}
variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}
variable "default_vpc_id" {}
variable "zone_id" {}
variable "public_alb_name" {}
variable "private_alb_listener" {}
variable "lb_priority" {}
variable "public_alb_listener" {}
variable "private_alb_name" {}