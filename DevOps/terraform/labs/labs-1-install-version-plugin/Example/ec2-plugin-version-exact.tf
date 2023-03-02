provider "aws" {
# Integration de la notion de version du plugin Terraform avec une version precise 2.7
	version		=	"2.7"
	region		=	"us-east-1"
	access_key	=	"<AWS_ACCESS_KEY>"
	secret_key	=	"<AWS_SECRET_KEY>"
}

resource "aws_instance" "myec2" {
	ami				= "ami-012cc038cc685a0d7"
	instance_type	= "t2.micro"
	key_name		= "devops-christophe"
	tags = {
		Name = "ec2-christophe"
	}
}