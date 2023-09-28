resource "aws_ecr_repository" "banana_ecr" {
  name                 = "${var.name_con}ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}ecr_repo" })
  )
}

resource "aws_ecr_lifecycle_policy" "lifecycle_policy" {
  repository = aws_ecr_repository.banana_ecr.name
  policy     = var.ecr_lifecycle_policy_document
}

resource "aws_ecr_repository_policy" "repo_policy" {
  repository = aws_ecr_repository.banana_ecr.name
  policy     = var.ecr_iam_policy_documet
}
