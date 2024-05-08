output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC created."
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "List of IDs of public subnets."
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "List of IDs of private subnets."
}
