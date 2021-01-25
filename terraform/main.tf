module "vpc" {
	source = "/modules/vpc"
	cidr_block = var.cidr_block
	env = var.env
	availability_zones = var.availability_zones
}
