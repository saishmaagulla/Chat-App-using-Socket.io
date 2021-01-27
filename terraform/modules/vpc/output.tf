output "vpc_id" {
	value = aws_vpc.dev_vpc.id
}

output "subnet_id_one" {
	value = aws_subnet.dev_subnet_one.id
}

output "subnet_id_two" {
	value = aws_subnet.dev_subnet_two.id	
}

output "sg_id" {
	value = aws_security_group.sg_one.id
}

output "sg_lb" {
	value = aws_security_group.sg_lb.id	
}
