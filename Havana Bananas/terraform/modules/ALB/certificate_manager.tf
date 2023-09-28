resource "aws_acm_certificate" "banana_sock_nlb_cert" {
  domain_name       = "${aws_lb.nlb.name}.${data.aws_route53_zone.kpa23_public_zone.name}"
  validation_method = "DNS"

  tags = {
    Name = "${var.name_con}nlb_certificate"
  }

  lifecycle {
    create_before_destroy = true
  }
}