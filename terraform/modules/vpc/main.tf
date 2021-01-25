resource "aws_vpc" "test_vpc" {
	cidr_block = var.cidr_block
	instance_tenancy = "default"
	enable_dns_hostnames = true
	enable_dns_support = true
	tags = {
	Name = var.env
	}
}

resource "aws_subnet" "test_subnet" {
	vpc_id = aws_vpc.test_vpc.id
	count = length(var.public_subnets_cidr)
	cidr_block = element(var.public_subnets_cidr, count.index)
	availability_zone = element(var.availability_zones, count.index)
	tags = {
	Name = var.env
	}
}
