resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/26"
  availability_zone = "us-east-1"

  tags = {
    Name = "Main"
  }
}