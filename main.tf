data "aws_route53_zone" "default" {
  name         = var.hosted_zone
  private_zone = false
}

resource "aws_acm_certificate" "default" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = concat(var.alternative_domain_names, [format("*.%s", var.domain_name)])

  tags = merge(
    {
      "Name" = var.name
    },
  var.tags)
}

resource "aws_route53_record" "default" {
  for_each = {
    for e in aws_acm_certificate.default.domain_validation_options : e.domain_name => {
      name   = e.resource_record_name
      record = e.resource_record_value
      type   = e.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  type            = each.value.type
  records         = [each.value.record]
  ttl             = 60
  zone_id         = data.aws_route53_zone.default.id
}

resource "aws_acm_certificate_validation" "default" {
  certificate_arn         = aws_acm_certificate.default.arn
  validation_record_fqdns = [for record in aws_route53_record.default : record.fqdn]

}
