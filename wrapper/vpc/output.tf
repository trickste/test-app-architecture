output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.netarc.vpc_id
}

output "vpc_cidr_block" {
  description = "The ID of the VPC"
  value       = module.netarc.vpc_cidr_block
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.netarc.private_subnets
}

output "private_subnet_zone_a" {
  description = "List of IDs of private subnets"
  value       = module.netarc.private_subnets[0]
}

output "private_subnet_zone_b" {
  description = "List of IDs of private subnets"
  value       = module.netarc.private_subnets[1]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.netarc.public_subnets
}

output "public_subnet_zone_a" {
  description = "List of IDs of public subnets"
  value       = module.netarc.public_subnets[0]
}

output "public_subnet_zone_b" {
  description = "List of IDs of public subnets"
  value       = module.netarc.public_subnets[1]
}

output "route_table_ids" {
  description = "List of IDs of private route tables"
  value       = concat(module.netarc.private_route_table_ids, module.netarc.public_route_table_ids)
}

