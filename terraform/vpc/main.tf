

resource "aws_subnet" "main" {
  for_each = var.vpc_id
  vpc_id     = var.vpc_id
  cidr_block = each.value["cidr"]
  availability_zone = each.value["az"]

  tags = {
    Name = each.key
  }
}