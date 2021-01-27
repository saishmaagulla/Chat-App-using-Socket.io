resource "aws_launch_configuration" "dev_lc" {
	name = var.env
	image_id = var.ami_id
	instance_type = var.instance_type
	associate_public_ip_address = true
	key_name = var.key_name
	enable_monitoring = false
	security_groups = [var.sg_id]
	ebs_optimized = false
        user_data = file("${path.module}/script.sh")
	root_block_device {
	delete_on_termination = true
	encrypted = false
	volume_size = 10
	volume_type = "gp2"
	}
	
	
	
	lifecycle {
	create_before_destroy = true
	}
}
