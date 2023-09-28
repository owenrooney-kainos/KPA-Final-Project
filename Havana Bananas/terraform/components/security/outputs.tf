output "ec2_sg" {
  value = module.security.ec2_sg
}

output "eks_sg" {
  value = module.security.eks_sg
}