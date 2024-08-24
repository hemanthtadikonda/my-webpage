

module "vpc" {
  source = "./vpc"
  for_each = var.vpc

  cidr    = each.value[ "cidr" ]
  subnets = each.value [ "subnets" ]

  tags = var.tags
  env  = var.env
  default_vpc_id = var.default_vpc_id
  default_vpc_cidr_block = var.default_vpc_cidr_block
  def_route_table_id    = var.def_route_table_id



}
