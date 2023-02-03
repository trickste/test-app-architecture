module "bastion_sg" {
  source = "../../modules/sg/"
  name   = "${local.bastion_sg_tags.component}-${local.bastion_sg_tags.type}-${local.bastion_sg_tags.environment}"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "allow ssh fsg-0f9b434d7cdb717ebrom netmagic firewall"
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
  tags = local.bastion_sg_tags
}

module "bastion_instance" {
  source                  = "../../modules/ec2/"
  name                    = "${local.bastion_tags.component}-${local.bastion_tags.type}-${local.bastion_tags.environment}"
  ami                     = data.aws_ami.ami.id
  instance_type           = "t3a.medium"
  iam_instance_profile    = "EC2Role"
  subnet_id               = data.terraform_remote_state.vpc.outputs.public_subnet_zone_b
  vpc_security_group_ids  = [module.bastion_sg.security_group_id]
  key_name                = "mumbai-pem"
  disable_api_termination = true
  tags                    = local.bastion_tags
}
