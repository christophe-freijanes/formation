provider "aws" {
  region     = "us-east-1"
  access_key = "AKIXXXXXXXXXXXA"
  secret_key = "sAqLXXXXXXXXXXXXXXXXXXw+/R/2cT"
}
data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  } 
}
resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instancetype
  key_name      = "devops-freijac"
  tags = var.aws_common_tag
  security_groups = [aws_security_group.allow_http_https.id]
}

resource "aws_security_group" "allow_http_https" {
  name        = "allow http/https"
  description = "Allow http and https traffic"
}
resource "aws_security_group_rule" "permit_80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_http_https.id
}
resource "aws_security_group_rule" "permit_443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_http_https.id
}
resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  vpc      = true
}