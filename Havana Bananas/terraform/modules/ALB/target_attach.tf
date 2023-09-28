//resource "aws_lb_target_group_attachment" "banana_sock_alb_attach" {
//
 // count            = length(var.target_group_instance_ids)
 // target_group_arn = aws_lb_target_group.banana_sock_alb_tg.arn
 // target_id        = var

//}

# Create target group attachment
# More details: https://docs.aws.amazon.com//latest/APIReference/API_TargetDescription.html
# https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_RegisterTargets.html


resource "aws_lb_target_group_attachment" "banana_sock_alb_attach" {
    target_group_arn = aws_lb_target_group.banana_sock_alb_tg.arn
    # attach the ALB to this target group
    target_id        = "10.0.1.37"
    #  If the target type is alb, the targeted Application Load Balancer must have at least one listener whose port matches the target group port.
    port             = 8079
}

resource "aws_lb_target_group_attachment" "banana_sock_nlb_attach" {
    targettarget_group_arn = aws_lb_target_group.banana_sock_nlb_tg.arn
    port = 30001
    target_id = var.nlb_target_group
}
