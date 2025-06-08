variable "aws_region" {
  default = "eu-central-1"
}

variable "vpc_cidr" {
  default = "10.200.123.0/24"
}

variable "public_subnet_cidr" {
  default = "10.200.123.0/26"
}

variable "private_subnet_cidr" {
  default = "10.200.123.64/26"
}