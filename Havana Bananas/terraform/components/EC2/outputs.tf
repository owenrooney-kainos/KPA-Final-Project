output "target_group_instance_ids" {
  value = module.EC2.target_group_instance_ids
}
# output "target_group_instance_ids" {
#   value = aws_instance.banana_sock_ec2.*.id
# }