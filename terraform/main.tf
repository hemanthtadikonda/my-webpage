

module "vpc" {
  source = "./vpc"
  for_each = var.vpc

  cidr    = each.value[ "cidr" ]
  subnets = each.value [ "subnets" ]


  vpc_id = aws_vpc.main.id
}
