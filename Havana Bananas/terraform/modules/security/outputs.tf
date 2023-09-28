output "ec2_sg" {
  value = aws_security_group.banana-sock-sg.id
}

output "eks_sg" {
  value = aws_security_group.banana-sock-eks_sg.id
}