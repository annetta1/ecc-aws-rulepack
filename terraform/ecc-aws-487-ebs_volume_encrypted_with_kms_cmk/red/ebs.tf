resource "aws_ebs_volume" "this" {
  availability_zone = "us-east-1a"
  size              = 5
  encrypted         = true
  
  tags = {
    Name = "487-ebs-volume-red"
  }
}
