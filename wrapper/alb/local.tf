locals {
  test-app_alb_sg_tags = {
    component   = "test-app"
    type        = "sg"
    environment = "test"
    terraform   = "true"
  }
  test-app_alb_tags = {
    component   = "test-app"
    type        = "alb"
    environment = "test"
    terraform   = "true"
  }
}
