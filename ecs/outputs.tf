# output "instance_security_group" {
#   value = "${aws_security_group.aniket_application_sg.id}"
# }

output "launch_configuration" {
  value = aws_launch_configuration.aniket_app.id
}

output "asg_name" {
  value = aws_autoscaling_group.aniket_app.id
}

output "elb_hostname" {
  value = aws_alb.main.dns_name
}

