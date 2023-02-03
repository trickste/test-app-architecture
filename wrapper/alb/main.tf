module "test-app_alb_sg" {
  source = "../../modules/sg/"
  name   = "${local.test-app_alb_sg_tags.component}-${local.test-app_alb_sg_tags.type}-${local.test-app_alb_sg_tags.environment}"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "allow access to ALB"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "outbound rule public"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  tags = local.test-app_alb_sg_tags
}

module "alb" {
  source             = "../../modules/alb"
  name               = "${local.test-app_alb_tags.component}-${local.test-app_alb_tags.type}-${local.test-app_alb_tags.environment}"
  load_balancer_type = "application"
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnets
  security_groups    = [module.test-app_alb_sg.security_group_id]
  target_groups = [
    {
      name             = "${local.test-app_alb_tags.component}-${local.test-app_alb_tags.type}-${local.test-app_alb_tags.environment}-default"
      backend_protocol = "HTTP"
      backend_port     = 9000
      target_type      = "instance"
      targets          = []
      health_check = {
        enabled             = true
        path                = "/api/shop/menu"
        port                = "traffic-port"
        protocol            = "HTTP"
        interval            = 10
        healthy_threshold   = 2
        unhealthy_threshold = 2
        matcher             = "200-350"
      }
    }
  ]
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      action_type        = "forward"
    }
  ]
  tags = local.test-app_alb_tags
}
