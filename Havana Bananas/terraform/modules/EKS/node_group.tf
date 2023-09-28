
/*
resource "aws_eks_node_group" "banana_node" {
  cluster_name    = aws_eks_cluster.banana_eks_cluster.name
  node_group_name = "${local.name_con}node"
  node_role_arn   = aws_iam_role.example.arn
  subnet_ids      = var.private_subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}
*/

resource "aws_eks_node_group" "banana_node_group" {
  cluster_name    = aws_eks_cluster.banana_eks_cluster.name
  node_group_name = "${local.name_con}node_group"
  node_role_arn   = aws_iam_role.eks_role.arn
  subnet_ids      = var.public_subnet_ids

  scaling_config {
    desired_size = 3
    max_size     = 4
    min_size     = 1
  }

  instance_types  = [var.instance_type]

  depends_on = [ aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
                 aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
                 aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
                 aws_eks_cluster.banana_eks_cluster ]

}