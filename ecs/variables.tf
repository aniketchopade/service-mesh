variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default     = "2"
}

variable "key_name" {
  description = "Name of AWS key pair"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "AWS instance type"
}

variable "asg_min" {
  description = "Min numbers of servers in ASG"
  default     = "1"
}

variable "asg_max" {
  description = "Max numbers of servers in ASG"
  default     = "2"
}

variable "asg_desired" {
  description = "Desired numbers of servers in ASG"
  default     = "1"
}

variable "ami" {
  description = "Amazon machine image"
}

variable "vpc_id" {
  description = "VPC where this app will launch"
}

variable "access_key" {
  description = "AWS access key"
  default     = "AKIAJJTIBLBT4S55A27A"
}

variable "secret_key" {
  description = "AWS secret key"
  default     = "oUgq1UW2qsfZyJKwPPcPF0saYQCkT26C5dgrTWEr"
}

variable "dc_subnet_1" {
  description = "First Subnet for DC application"
}

variable "dc_subnet_2" {
  description = "Second Subnet for DC application"
}

variable "dc_security_group" {
  description = "DC security group"
}

variable "infosec_security_group" {
  description = "Infosec security group"
}

#variable "instance_profile_name" {
#  description = "Instance role's container"
#}

#variable "service_role" {
#  description = "Role to enable Amazon ECS to manage your cluster."
#}

#variable "instance_role" {
#  description = "Role which Allows EC2 to call AWS services on your behalf."
#}

variable "booking_image_url" {
}

variable "movie_image_url" {
}

variable "showtime_image_url" {
}

