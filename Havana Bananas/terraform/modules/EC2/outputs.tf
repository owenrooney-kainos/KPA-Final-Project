output "target_group_instance_ids" {
    value = aws_instance.banana_sock_ec2.*.id
}