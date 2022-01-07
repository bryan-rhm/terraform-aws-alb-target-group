# Terraform AWS Load Balancer Target group module

## Basic Usage Example
```
module "target_group" {
  source      = "github.com/bryan-rhm/terraform-aws-alb-target-group?ref=v1.0.0"
  name        = "my-target"
  vpc_id      = var.vpc_id
  target_type = "ip"
  stickiness = {
    type = "lb_cookie"
  }
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.71.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | Health Check configuration block. | <pre>object({<br>    path                = string<br>    timeout             = number<br>    matcher             = optional(string)<br>    interval            = number<br>    protocol            = optional(string)<br>    healthy_threshold   = optional(number)<br>    unhealthy_threshold = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional, Forces new resource) Name of the target group. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name. Cannot be longer than 6 characters. | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | Port on which targets receive traffic, unless overridden when registering a specific target. | `number` | `80` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Should be one of GENEVE, HTTP, HTTPS, TCP, TCP\_UDP, TLS, or UDP | `string` | `"HTTP"` | no |
| <a name="input_stickiness"></a> [stickiness](#input\_stickiness) | Stickiness configuration block. | <pre>object({<br>    type            = string           # The only current possible values are lb_cookie, app_cookie for ALBs, and source_ip for NLBs.<br>    cookie_name     = optional(string) # Only needed when type is app_cookie.<br>    cookie_duration = optional(number) # Only used when the type is lb_cookie. Default value 86400<br>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the target group. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(any)` | `null` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Type of target that you must specify when registering targets with this target group. Valid values: ip\|instance\|lambda | `string` | `"instance"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Identifier of the VPC in which to create the target group. Required when target\_type is instance or ip | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output"></a> [output](#output\_output) | Target group attributes |
