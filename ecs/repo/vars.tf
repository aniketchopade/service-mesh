variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AWS_ACCESS_KEY" {
}
variable "AWS_SECRET_KEY" {
}
variable "PRIVATE_KEY" {
}
variable "DC_SUBNET_1" {
}
variable "DC_SUBNET_2" {
}
variable "DC_SECURTIY_GROUP" {
}
variable "INFOSEC_SECURTIY_GROUP" {
}
variable "ECS_INSTANCE_TYPE" {
  default = "t2.micro"
}
variable "ECS_AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-5e414e24"
  }
}