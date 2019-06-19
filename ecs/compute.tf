#Compute
#Launches EC2 autoscale grooup

resource "aws_autoscaling_group" "aniket_app" {
  name                 = "aniket-autoscale-group"
  vpc_zone_identifier  = [var.dc_subnet_1, var.dc_subnet_2]
  min_size             = var.asg_min
  max_size             = var.asg_max
  desired_capacity     = var.asg_desired
  launch_configuration = aws_launch_configuration.aniket_app.name
}

data "template_file" "userdata" {
  template = file("${path.module}/userdata.tpl")
  vars = {
    ecs_cluster_name = aws_ecs_cluster.main.name
  }
}

resource "aws_launch_configuration" "aniket_app" {
  security_groups = [var.dc_security_group, var.infosec_security_group]

  key_name                    = var.key_name
  image_id                    = var.ami
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.app.name
  user_data                   = data.template_file.userdata.rendered
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

