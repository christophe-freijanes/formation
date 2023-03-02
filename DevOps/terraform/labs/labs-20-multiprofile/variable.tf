variable "amiidEast" {
  default = "ami-006dcf34c09e50022"
}

variable "amiidWest" {
  default = "ami-060d3509162bcc386"
}

variable "ec2type" {
  default = "t2.micro"
}

variable "keyname-east" {
  default = "devops-christophe-east-1"
}

variable "keyname-west" {
  default = "devops-christophe-west-1"
}

variable "ec2nameEast" {
  default = "terraform-training-east"
}

variable "ec2nameWest" {
  default = "terraform-training-west"
}