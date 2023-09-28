//output "alb_listener_id" {
//  value = aws_lb_listener.banana_sock_http_listener.id
//}

# output "target_group_id" {
#   value = aws_lb_target_group.banana_sock_tg.id

# }
output "security_group_id" {
  value = aws_security_group.alb_sg.id
}

