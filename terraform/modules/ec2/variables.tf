variable "env" {
	type = string	
}

variable "availability_zones" {
	type = list
}
variable "vpc_id" {
	type = string
}

variable "subnet_id_one" {
	type = string	
}

variable "subnet_id_two" {
	type = string	
}

variable "sg_id" {
	type = string	
}

variable "sg_lb" {
	type = string	
}

variable "ami_id" {
	type = string
	default = "ami-0f593aebffc0070e1"
}

variable "instance_type" {
	type = string
	default = "t2.micro"
}

variable "key_name" {
	type = string
	default = "testkey"
}

variable "max_size" {
	type = number
	default = 1
}

variable "min_size" {
	type = number
	default = 1
}

variable "desired_capacity" {
	type = number
	default = 1
}
	
