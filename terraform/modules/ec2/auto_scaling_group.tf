resource "aws_placement_group" "dev_pg" {
	name = var.env
	strategy = "spread"
}

resource "aws_autoscaling_group" "dev_asg" {
	name = var.env
	launch_configuration = aws_launch_configuration.dev_lc.name
	max_size = var.max_size
	min_size = var.min_size
	desired_capacity = var.desired_capacity
	health_check_type = "ELB"
	force_delete = true
	placement_group = aws_placement_group.dev_pg.id
	vpc_zone_identifier = [var.subnet_id_one, var.subnet_id_two]
	#availability_zones = var.availability_zones
	#launch_template {
	#id = aws_launch_template.dev_launch_template.id
	#version = "$Default"
	#}
	lifecycle {
	create_before_destroy = true
	}
	
	target_group_arns = [aws_lb_target_group.dev_tg.arn]
}

resource "aws_autoscaling_policy" "dev_asp" {
	name = var.env
	adjustment_type = "ChangeInCapacity"
#	cooldown = 300
	autoscaling_group_name = aws_autoscaling_group.dev_asg.name
	policy_type = "TargetTrackingScaling"
	
	target_tracking_configuration {
	predefined_metric_specification {
	predefined_metric_type = "ASGAverageCPUUtilization"
	}
	
	target_value = 60.0
	
	}
}

