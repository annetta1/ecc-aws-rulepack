resource "aws_ecr_repository" "this" {
  name                 = "376_ecr_respository_green"
  image_tag_mutability = "IMMUTABLE"
}
