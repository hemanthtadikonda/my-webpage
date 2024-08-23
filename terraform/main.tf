resource "aws_vpc" "main" {
  cidr_block = var.vpc["cidr"]
}


module "vpc" {
  source = "./vpc"
  for_each = var.vpc.each.value["subnets"]

  vpc_id = aws_vpc.main.id

}