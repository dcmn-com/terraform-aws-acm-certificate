data "aws_route53_zone" "default" {
  name         = "${var.hosted_zone}"
  private_zone = false
}

resource "aws_acm_certificate" "default" {
  domain_name               = "${var.domain_name}"
  validation_method         = "DNS"
  subject_alternative_names = "${concat(var.alternative_domain_names, list(format("*.%s", var.domain_name)))}"

  tags = "${merge(
    map(
      Name, "${var.name}"
    ),
  "${var.tags}")}"

}

resource "aws_route53_record" "default" {
  name    = "${aws_acm_certificate.default.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.default.domain_validation_options.0.resource_record_type}"
  zone_id = "${data.aws_route53_zone.default.id}"
  records = ["${aws_acm_certificate.default.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "default" {
  certificate_arn         = "${aws_acm_certificate.default.arn}"
  validation_record_fqdns = ["${aws_route53_record.default.fqdn}"]
}
