data "aws_route53_zone" "kpa23_public_zone" {
  private_zone = false
  name         = "kainos-platform-academy.com"


}

resource "aws_route53_record" "nlb_cert_ssl_record" {
  for_each = {
    for dvo in aws_acm_certificate.banana_sock_nlb_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.kpa23_public_zone.zone_id
}

resource "aws_acm_certificate_validation" "nlb_cert_ssl_record_validiation" {
  certificate_arn         = aws_acm_certificate.banana_sock_nlb_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.nlb_cert_ssl_record : record.fqdn]
}

resource "aws_route53_record" "nlb_dns_record" {
  zone_id = data.aws_route53_zone.kpa23_public_zone.zone_id
  name    = "${aws_lb.nlb.name}.${data.aws_route53_zone.kpa23_public_zone.name}"
  type    = "A"
  alias {
    name                   = "dualstack.${aws_lb.nlb.dns_name}"
    zone_id                = aws_lb.nlb.zone_id
    evaluate_target_health = true
  }
}