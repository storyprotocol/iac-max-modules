# Filter out local zones not currently supported
# with managed node groups
data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

locals {
  region  = var.region
  vpc_cidr = "10.0.0.0/16"
}

module "iac-max-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "iac-max-vpc"

  cidr = local.vpc_cidr
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Terraform = "true"
    Environment = var.env
  }

}
