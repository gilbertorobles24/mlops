resource "aws_route53_zone" "main" {
  name = var.domain
}

resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.subdomain_1
  type    = "A"

  alias {
    name                   = "dualstack.${aws_lb.default.dns_name}"
    zone_id                = aws_lb.default.zone_id
    evaluate_target_health = true
  }
}

output "fqdn" {
  value = aws_route53_record.main.fqdn
}
