variable "cidr_block" {
	type = string
	default = "10.0.0.0/24"
}

variable "public_subnets_cidr" {
	type = list
	description = "CIDR for subnets"
	default = [
	"10.0.0.0/25",
	"10.0.0.128/25"
	]	
}
variable "local_ip" {
	type = string
}

variable "env" {
	type = string
}

variable "availability_zones" {
	type = list
}
