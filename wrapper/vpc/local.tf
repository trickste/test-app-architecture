locals {
  common_tags = {
    component    = "infra"
    subcomponent = "netarc"
    environment  = "test"
    terraform    = "true"
  }
  vpc_tags = {
    type = "vpc"
  }
  igw_tags = {
    type = "igw"
  }
  public_route_table_tags = {
    type = "rt"
  }
  private_route_table_tags = {
    type = "rt"
  }
  public_subnet_tags = {
    type = "subnet"
  }
  private_subnet_tags = {
    type = "subnet"
  }
  public_acl_tags = {
    type = "public-nacl"
  }
  private_acl_tags = {
    type = "private-nacl"
  }
  nat_eip_tags = {
    type = "eip"
  }
  nat_gateway_tags = {
    type = "nat"
  }
}
