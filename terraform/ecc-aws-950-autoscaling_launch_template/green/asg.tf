resource "aws_launch_template" "this" {
  name_prefix   = "950_launch_template_green"
  image_id      = data.aws_ami.this.id
  instance_type = "t2.micro"
}

data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_autoscaling_group" "this" {
  availability_zones        = ["us-east-1a"]
  desired_capacity          = 0
  max_size                  = 0
  min_size                  = 0
  health_check_grace_period = 300
  health_check_type         = "ELB"

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }
}