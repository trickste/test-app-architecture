locals {
  bastion_sg_tags = {
    component   = "bastion"
    type        = "sg"
    environment = "test"
    terraform   = "true"
  }
  bastion_tags = {
    component   = "bastion"
    type        = "ec2"
    environment = "test"
    terraform   = "true"
  }
}
