variable "region" {
	type = string
}

variable "cidr_block" {
	type = string
}

variable "env" {
	type = string
}

variable "availability_zones" {
	type = list
	default = ["us-east-1a", "us-east-1b"]
}

variable "local_ip" {
	type = string
}
