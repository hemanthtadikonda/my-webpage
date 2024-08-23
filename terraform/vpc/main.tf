

resource "aws_subnet" "main" {
  for_each = each.value
  vpc_id     = var.vpc_id
  cidr_block = each.value["cidr"]
  availability_zone = each.value["az"]

  tags = {
    Name = each.key
  }
}