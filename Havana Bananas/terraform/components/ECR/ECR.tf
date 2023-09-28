module "ECR" {
  source = "../../modules/ECR"

  name_con = var.name_con

  ecr_iam_policy_documet = local.ecr_iam_policy_documet

  ecr_lifecycle_policy_document = local.ecr_lifecycle_policy_document
}