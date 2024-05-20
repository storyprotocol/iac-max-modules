module "vpc" {
  source = "./vpc"

  env = var.env
  region = var.region
  name = var.name
}
