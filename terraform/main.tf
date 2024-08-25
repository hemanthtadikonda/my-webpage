module "vpc" {
  source   = "./vpc"
  for_each = var.vpc

  cidr    = each.value[ "cidr" ]
  subnets = each.value [ "subnets" ]

  tags                   = var.tags
  env                    = var.env
  default_vpc_id         = var.default_vpc_id
  default_vpc_cidr_block = var.default_vpc_cidr_block
  def_route_table_id     = var.def_route_table_id

}

module "alb" {
  source   = "./alb"
  for_each = var.alb

  tags                = var.tags
  env                 = var.env
  acm_certificate_arn = var.acm_certificate_arn

  internal        = each.value[ "internal" ]
  lb_type         = each.value[ "lb_type" ]
  sg_port         = each.value[ "sg_port" ]
  sg_ingress_cidr = each.value[ "sg_ingress_cidr" ]

  vpc_id  = each.value[ "internal" ] ? local.vpc_id : var.default_vpc_id
  subnets = each.value[ "internal" ] ? local.app_subnets : data.aws_subnets.main.ids

}

module "app" {

  depends_on = [module.alb]
  source = "./app"
  for_each = var.app

  app_listen_port = each.value["app_listen_port"]
  instance_type = each.value["instance_type"]
  desired_capacity = each.value["desired_capacity"]
  max_size = each.value["max_size"]
  min_size = each.value["min_size"]
  lb_priority = each.value["lb_priority"]

  env = var.env
  tags = var.tags
  default_vpc_id = var.default_vpc_id
  zone_id = var.zone_id
  ssh_ingress_cidr = var.ssh_ingress_cidr

  vpc_id = local.vpc_id
  app_subnet_ids = local.app_subnets
  sg_ingress_cidr = local.app_subnets_cidr

  public_alb_name  = lookup(lookup(lookup(module.alb , "public" , null) , "alb" ,null), "dns_name",null)
  private_alb_name = lookup(lookup(lookup(module.alb , "private" , null) , "alb" ,null), "dns_name",null)
  public_alb_listener =lookup(lookup(lookup(module.alb , "public" ,null ), "lb_listener" , null) , "arn" , null )
  private_alb_listener = lookup(lookup(lookup(module.alb , "private" ,null ), "lb_listener" , null) , "arn" , null )
}



