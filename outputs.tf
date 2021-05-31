output "arn" {
  value       = aws_acm_certificate.default.arn
  description = "ACM certificate's arn"
}
