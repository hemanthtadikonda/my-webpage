resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags       = merge(local.tags,{ Name = "${var.env}-myapp-vpc" })
}

module "subnets" {
  source = "./subnets"
  for_each = var.subnets
  vpc_id   = aws_vpc.main.id
  subnets  = each.value
  env      = var.env
  tags     = local.tags

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(local.tags,{ Name = "${var.env}-myapp-igw" })
}

resource "aws_route" "igw" {
  for_each               = lookup(lookup(module.subnets,"public",null ),"route_table_ids",null)

  route_table_id         = each.value["id"]
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_eip" "ngw" {
  count  = length(local.public_subnets_id)
  domain = "vpc"
  tags   = merge(local.tags,{ Name = "${var.env}-myapp-eip-${count.index+1}" })
}

resource "aws_nat_gateway" "ngw" {
  count         = length(local.public_subnets_id)

  allocation_id = element(aws_eip.ngw.*.id,count.index )
  subnet_id     = element(local.public_subnets_id,count.index )
  tags          = merge(local.tags,{ Name = "${var.env}-myapp-ngw-${count.index+1}" })
}

resource "aws_route" "ngw-route" {
  count                  = length(local.app_subnets_id)
  route_table_id         = element(local.app_subnets_id,count.index )
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.ngw.*.id,count.index )
}