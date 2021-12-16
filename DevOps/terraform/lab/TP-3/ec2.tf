provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAXOLBRZOBASR64VTA"
  secret_key = "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"
}
data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = "amzn2-ami-hvm*"
  } 
}
resource "aws_instance" "ec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instancetype
  key_name      = "devops-freijac"
  tags = var.aws_common_tag
  security_group = ["$(aws_security_group.allow_http_https.id)"]
}

resource "aws_security_group" "allow_http_https" {
  name        = "freijac-security-grp"
  description = "Allow http and https traffic"

  ingress {
    description      = "http from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.ec2.id
  vpc      = true
}

root_block_device {
  delete_on_termination = true
  }