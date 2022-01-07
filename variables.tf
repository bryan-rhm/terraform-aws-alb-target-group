variable "name" {
  description = "(Optional, Forces new resource) Name of the target group. If omitted, Terraform will assign a random, unique name."
  default     = null
  type        = string
}

variable "name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name. Cannot be longer than 6 characters."
  default     = null
  type        = string
}

variable "port" {
  description = "Port on which targets receive traffic, unless overridden when registering a specific target."
  default     = 80
  type        = number
}

variable "protocol" {
  description = "Should be one of GENEVE, HTTP, HTTPS, TCP, TCP_UDP, TLS, or UDP"
  default     = "HTTP"
  type        = string
}

variable "vpc_id" {
  description = "Identifier of the VPC in which to create the target group. Required when target_type is instance or ip"
  default     = null
  type        = string
}

variable "target_type" {
  description = "Type of target that you must specify when registering targets with this target group. Valid values: ip|instance|lambda"
  default     = "instance"
  type        = string
}

variable "health_check" {
  description = "Health Check configuration block."
  default     = null
  type = object({
    path                = string
    timeout             = number
    matcher             = optional(string)
    interval            = number
    protocol            = optional(string)
    healthy_threshold   = optional(number)
    unhealthy_threshold = optional(number)
  })
  # Example:
  # path                = "/"
  # timeout             = 10
  # matcher             = "200-399"
  # interval            = 15
  # protocol            = "HTTP"
  # healthy_threshold   = 2
  # unhealthy_threshold = 2
}

variable "stickiness" {
  description = "Stickiness configuration block."
  default     = null
  type = object({
    type            = string           # The only current possible values are lb_cookie, app_cookie for ALBs, and source_ip for NLBs.
    cookie_name     = optional(string) # Only needed when type is app_cookie.
    cookie_duration = optional(number) # Only used when the type is lb_cookie. Default value 86400
  })
}

variable "tags" {
  type        = map(any)
  default     = null
  description = "A map of tags to assign to the target group. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
