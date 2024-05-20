output "vpc_id" {
  value       = module.iac-max-vpc.vpc_id
  description = "The ID of the VPC created."
}

output "public_subnet_ids" {
  value       = module.iac-max-vpc.public_subnets
  description = "List of IDs of public subnets."
}
