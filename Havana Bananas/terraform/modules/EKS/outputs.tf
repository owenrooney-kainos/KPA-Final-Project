output "endpoint" {
  value = aws_eks_cluster.banana_eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.banana_eks_cluster.certificate_authority[0].data
}

output "scaling_group_id" {
  value = aws_eks_node_group.banana_node_group.resources.auto_scaling_groups.name
}
