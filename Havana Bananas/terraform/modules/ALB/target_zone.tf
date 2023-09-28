/*
resource "aws_lb_target_group" "banana_sock_alb_tg" {
  name     = "${var.name_con}alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"
  health_check {
    path                = "/"
    port                = 80
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
  }


}
*/

# Create NLB target group that forwards traffic to alb
# https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_CreateTargetGroup.html
resource "aws_lb_target_group" "banana_sock_nlb_tg" {
    name         = "${var.name_con}nlb-tg"
    port         = 30001
    protocol     = "TCP"
    vpc_id       = var.vpc_id
    target_type  = "instance"

    health_check {
    path                = "/"
    port                = 80
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
  }
}