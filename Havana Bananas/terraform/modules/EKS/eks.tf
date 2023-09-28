
resource "aws_eks_cluster" "banana_eks_cluster" {
  name     = "${local.name_con}eks"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = concat(var.public_subnet_ids)

    public_access_cidrs = [ "0.0.0.0/0" ]

    endpoint_private_access = true
    endpoint_public_access = true

    security_group_ids = [ var.eks_sg ]
  }

  # depends on roles 
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEKSFargatePodExecutionRolePolicy
  ]
}
