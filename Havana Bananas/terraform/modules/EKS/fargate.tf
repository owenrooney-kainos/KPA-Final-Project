/*
resource "aws_eks_fargate_profile" "fargate_profile" {
  cluster_name           = aws_eks_cluster.banana_eks_cluster.name
  fargate_profile_name   = "${local.name_con}fargate"
  pod_execution_role_arn = aws_iam_role.eks_role.arn
  //testing
  subnet_ids             = var.private_subnet_ids

  selector {
    namespace = "sock-shop" //namespace defined in sock-shop demo
  }

  depends_on = [ aws_eks_cluster.banana_eks_cluster ]

   tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}ecr_repo" })
  )
}

resource "aws_eks_fargate_profile" "core_dns_fargate" {
  cluster_name           = aws_eks_cluster.banana_eks_cluster.name
  fargate_profile_name   = "${local.name_con}fargate_dns"
  pod_execution_role_arn = aws_iam_role.eks_role.arn
  subnet_ids             = var.private_subnet_ids

  selector {
    namespace = "kube-system" //namespace for dns
    //labels = {"k8s-app"="kube-dns"}
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSFargatePodExecutionRolePolicy,
    aws_eks_cluster.banana_eks_cluster
  ]

   tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.name_con}ecr_repo" })
  )
}

//patch to use fargate over ec2

data "aws_eks_cluster_auth" "eks" {
  name = aws_eks_cluster.banana_eks_cluster.id
}
/*

resource "null_resource" "k8s_patcher" {
  depends_on = [aws_eks_fargate_profile.core_dns_fargate]

  triggers = {
    endpoint = aws_eks_cluster.banana_eks_cluster.endpoint
    ca_crt   = base64decode(aws_eks_cluster.banana_eks_cluster.certificate_authority[0].data)
    token    = data.aws_eks_cluster_auth.eks.token
  }

  provisioner "local-exec" {
    command = <<EOH
cat >/tmp/ca.crt <<EOF
${base64decode(aws_eks_cluster.banana_eks_cluster.certificate_authority[0].data)}
EOF
kubectl \
  --server="${aws_eks_cluster.banana_eks_cluster.endpoint}" \
  --certificate_authority=/tmp/ca.crt \
  --token="${data.aws_eks_cluster_auth.eks.token}" \
  patch deployment coredns \
  -n kube-system --type json \
  -p='[{"op": "remove", "path": "/spec/template/metadata/annotations/eks.amazonaws.com~1compute-type"}]'
EOH
  }

  lifecycle {
    ignore_changes = [triggers]
  }
}

data "tls_certificate" "eks" {
  url = aws_eks_cluster.banana_eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.banana_eks_cluster.identity[0].oidc[0].issuer
}
*/
