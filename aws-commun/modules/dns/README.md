# DNS

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws.iac | n/a |
| aws.root | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_route53_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) |
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) |
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| tags | Tags à appliquer sur toutes les ressources | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| sub\_domain\_name | n/a |
