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
