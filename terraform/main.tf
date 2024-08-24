

module "vpc" {
  source = "./vpc"
  for_each = var.vpc

  cidr    = each.value[ "cidr" ]
  subnets = each.value [ "subnets" ]

  tags = var.tags
  env  = var.env



}
