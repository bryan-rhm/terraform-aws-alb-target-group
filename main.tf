resource "aws_lb_target_group" "this" {
  name        = var.name
  name_prefix = substr(var.name_prefix,0,6)
  port        = var.port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  dynamic "health_check" {
    for_each = var.health_check != null ? [1] : []
    content {
      path                = try(var.health_check.path, null)
      timeout             = var.health_check.timeout
      matcher             = try(var.health_check.matcher, null)
      interval            = var.health_check.interval
      protocol            = try(var.health_check.protocol, null)
      healthy_threshold   = try(var.health_check.healthy_threshold, null)
      unhealthy_threshold = try(var.health_check.unhealthy_threshold, null)
    }
  }

  dynamic "stickiness" {
    for_each = var.stickiness != null ? [1] : []
    content {
      type            = var.stickiness.type
      cookie_name     = try(var.stickiness.cookie_name, null)
      cookie_duration = try(var.stickiness.cookie_duration, null)
    }
  }

  tags = var.tags
}
