resource "aws_lb" "dev_lb" {
	name = var.env
	internal = false
	load_balancer_type = "application"
	security_groups = [ var.sg_lb ]
	subnets = [ var.subnet_id_one, var.subnet_id_two]
	
	enable_deletion_protection = false
	
	tags = {
	Name = var.env
	} 
	
}

resource "aws_lb_target_group" "dev_tg" {
	name = var.env
	port = 80
	protocol = "HTTP"
	vpc_id = var.vpc_id
}

resource "aws_lb_listener" "front" {
	load_balancer_arn = aws_lb.dev_lb.arn
	port = "80"
	protocol = "HTTP"
	
	default_action {
	type = "forward"
	target_group_arn = aws_lb_target_group.dev_tg.arn
	}
}
