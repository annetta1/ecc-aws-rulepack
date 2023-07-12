resource "aws_s3_bucket" "this" {
  bucket        = "bucket-968-green"
  force_destroy = true
}


resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.this.json
}