# terraform-aws-acm-certificate
A Terraform module to create an Amazon Web Services (AWS) ACM certificate

## Inputs

| Name                       | Description                                                             |  Type  | Default  | Required |
| -------------------------- | ----------------------------------------------------------------------- | :----: | :------: | :------: |
| alternative\_domain\_names | Alternative domain names for which will be issued certificate           |  list  | `<list>` |    no    |
| domain\_name               | Domain name for which will be issued certificate                        | string |   n/a    |   yes    |
| hosted\_zone               | Public hosted zone that will be used for certificate validation         | string |   n/a    |   yes    |
| name                       | Name tag for the aws acm certificate                                    | string |   n/a    |   yes    |
| tags                       | https://docs.aws.amazon.com/ARG/latest/userguide/tagging-resources.html |  map   | `<map>`  |    no    |

## Outputs

| Name | Description           |
| ---- | --------------------- |
| arn  | ACM certificate's arn |
