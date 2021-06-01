variable "name" {
  type        = string
  description = "Name tag for the aws acm certificate"
}

variable "hosted_zone" {
  type        = string
  description = "Public hosted zone that will be used for certificate validation"
}

variable "domain_name" {
  type        = string
  description = "Domain name for which will be issued certificate"
}

variable "alternative_domain_names" {
  type        = list(string)
  description = "Alternative domain names for which will be issued certificate"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "https://docs.aws.amazon.com/ARG/latest/userguide/tagging-resources.html"
  default     = {}
}
