resource "aws_vpc" "dev_vpc" {
	cidr_block = var.cidr_block
	instance_tenancy = "default"
	enable_dns_hostnames = true
	enable_dns_support = true
	tags = {
	Name = var.env
	}
}

resource "aws_subnet" "dev_subnet_one" {
	vpc_id = aws_vpc.dev_vpc.id
	cidr_block = element(var.public_subnets_cidr, 0)
	availability_zone = element(var.availability_zones, 0)
	tags = {
	Name = var.env
	}
}

resource "aws_subnet" "dev_subnet_two" {
	vpc_id = aws_vpc.dev_vpc.id
	cidr_block = element(var.public_subnets_cidr, 1)
	availability_zone = element(var.availability_zones, 1)
	tags = {
	Name = var.env
	}
}

resource "aws_internet_gateway" "igw" {
	vpc_id = aws_vpc.dev_vpc.id
	
	tags = {
	Name = var.env
	}
	
}

resource "aws_route_table" "rt" {
	vpc_id = aws_vpc.dev_vpc.id
	
	route {
	cidr_block = "0.0.0.0/0"
	gateway_id = aws_internet_gateway.igw.id
	}
	
	tags = {
	Name = var.env
	}
}
