provider "aws" {
	region		=	"us-east-1"
	access_key	=	"<AWS_ACCESS_KEY>"
	secret_key	=	"<AWS_SECRET_KEY>"
}

locals {
  common_tags = {
    Owner = "Christophe"
    Service = "Backend"
  }
}

resource "aws_instance" "app-dev" {
  ami           = "ami-012cc038cc685a0d7"
  instance_type = "t2.micro"
  tags = local.common_tags
}

resource "aws_instance" "db-dev" {
  ami           = "ami-012cc038cc685a0d7"
  instance_type = "t2.micro"
  tags = local.common_tags
}

resource "aws_ebs_volume" "db-ebs" {
  availability_zone = "us-west-2a"
  size = 8
  tags = local.common_tags
}