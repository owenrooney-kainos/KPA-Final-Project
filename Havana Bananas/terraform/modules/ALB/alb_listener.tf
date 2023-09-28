
/*
resource "aws_lb_listener" "banana_sock_https_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = aws_acm_certificate.banana_sock_alb_cert.arn


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.banana_sock_alb_tg.arn
  }

}

resource "aws_lb_listener" "banana_sock_http_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 80
  protocol          = "HTTP"
  //ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  //certificate_arn   = aws_acm_certificate.banana_sock_alb_cert.arn


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.banana_sock_alb_tg.arn
  }

}
*/