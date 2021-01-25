varaible "cidr_block" {
	type = string
	default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
	type = list
	description = "CIDR for subnets"
	default = [
	"10.0.1.0/24",
	"10.0.2.0/24"
	]	
}

variable "env" {
	type = string
}

variable "availability_zones" {
	type = list
}
