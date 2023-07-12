resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "333_vpc_green"
  }
}

resource "aws_security_group" "this" {
  name        = "333_security_group_green"
  description = "333_security_group_description_green"
}

resource "aws_vpc_endpoint" "this" {
  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.this.id,
  ]

  depends_on = [aws_security_group.this, aws_vpc.this]
}