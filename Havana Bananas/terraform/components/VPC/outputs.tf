output "private_subnet_ids" {
  value = module.VPC.private_subnet_ids
}
output "vpc_id" {
  value = module.VPC.vpc_id
}
output "public_subnet_ids" {
  value = module.VPC.public_subnet_ids
}
output "private_subnet_cidr_blocks" {
  value = module.VPC.private_subnet_cidr
}
output "public_subnet_cidr_blocks" {
  value = module.VPC.public_subnet_cidr
}
# output "internet_gateway_id" {
#   value = aws_internet_gateway.banana_sock_igw.id
# }

# output "nat_gateway_id" {
#   value = aws_nat_gateway.banana_sock_nat.*.id
# }

# output "nat_gateway_public_ip" {
#   value = aws_nat_gateway.banana_sock_nat.*.public_ip
# }
