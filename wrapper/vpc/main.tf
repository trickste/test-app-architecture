module "netarc" {
  source = "../../modules/vpc"

  name = "${local.common_tags.component}-${local.common_tags.subcomponent}-${local.vpc_tags.type}-${local.common_tags.environment}"
  
  cidr = "10.0.0.0/24"

  azs                = ["ap-south-1a", "ap-south-1b"]
  public_subnets     = ["10.0.0.0/27", "10.0.0.32/27"]
  private_subnets    = ["10.0.0.64/26", "10.0.0.128/26"]

  enable_ipv6 = true

  enable_nat_gateway = true
  single_nat_gateway = false
  one_nat_gateway_per_az = false

  tags = local.common_tags

  vpc_tags = {
    Name = "vpc-name"
  }
}
