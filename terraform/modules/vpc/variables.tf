varaible "cidr_block" {
	type = string
	default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
	type = list
	description = "CIDR for subnets"
	
}
