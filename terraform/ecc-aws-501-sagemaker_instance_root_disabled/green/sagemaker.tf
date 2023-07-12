resource "aws_sagemaker_notebook_instance" "this" {
  name                   = "501-sagemaker-notebook-instance-green"
  role_arn               = aws_iam_role.this.arn
  instance_type          = "ml.t2.medium"
  root_access            = "Disabled"
}

resource "aws_iam_role" "this" {
  name = "501_role_green"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "sagemaker.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}
