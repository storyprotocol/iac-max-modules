provider "aws" {
  region = var.region
}

# Filter out local zones not currently supported
# with managed node groups
data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

module "iac-max-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "iac-max-vpc"

  cidr = "10.0.0.0/16"
  azs  = [data.aws_availability_zones.available.names[0]]

  public_subnets  = ["10.0.1.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    Terraform = "true"
    Environment = var.env
  }

}
