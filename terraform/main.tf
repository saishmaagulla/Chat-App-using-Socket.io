module "vpc" {
	source = ".//modules/vpc"
	cidr_block = var.cidr_block
	env = var.env
	local_ip = var.local_ip
	availability_zones = var.availability_zones
}

module "ec2" {
	source = ".//modules/ec2"
	env = var.env
	availability_zones = var.availability_zones
	subnet_id_one = module.vpc.subnet_id_one
	subnet_id_two = module.vpc.subnet_id_two
 	sg_id = module.vpc.sg_id
	sg_lb = module.vpc.sg_lb
	vpc_id = module.vpc.vpc_id
}
