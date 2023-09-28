output "vpc_id" {
  value = aws_vpc.banana-sock-vpc.id
}

output "private_subnet_ids" {
  value       = aws_subnet.private.*.id
  description = "list of ids of all public subnets in vpc"

}
output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnet_cidr" {
  value = aws_subnet.private.*.cidr_block
}

output "public_subnet_cidr" {
  value = aws_subnet.public.*.cidr_block
}
output "internet_gateway_id" {
  value = aws_internet_gateway.banana_sock_igw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.banana_sock_nat.*.id
}

output "nat_gateway_public_ip" {
  value = aws_nat_gateway.banana_sock_nat.*.public_ip
}
# output "all_route_tables_ids" {
#   value = compact([
#     length(aws_route_table.public.*) == 1 ? aws_route_table.public[0].id : "",
#     length(aws_route_table.private.*) == 1 ? aws_route_table.private[0].id : "",
#   ])
# }

output "public_route_table_ids" {
  value = aws_route_table.public.*.id
}

output "private_route_table_ids" {
  value = aws_route_table.private.*.id
}
