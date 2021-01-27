resource "aws_security_group" "sg_one" {
	name = "application-sg"
	vpc_id = aws_vpc.dev_vpc.id
	
	ingress{
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = [aws_vpc.dev_vpc.cidr_block, var.local_ip]
	}
	
	ingress{
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = [aws_vpc.dev_vpc.cidr_block]
	}
		
	egress{
	from_port = 0
	to_port	  = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
	}
	
	tags = {
	Name = var.env
	}
depends_on = [aws_vpc.dev_vpc]
}

resource "aws_security_group" "sg_lb" {
	name = "lb-sg"
	ingress {
	from_port = 80
	to_port = 80
	protocol = "http"
	cidr_blocks = ["0.0.0.0/0"]
	}
	egress {
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
	}	
	tags = {
	Name = format("fm, %s!", var.env)
	}
}
