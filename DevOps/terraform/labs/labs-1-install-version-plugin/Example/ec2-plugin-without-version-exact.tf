provider "aws" {
# Integration SANS la notion de version du plugin Terraform
	#version		=	"2.7"
	region		=	"us-east-1"
	access_key	=	"AKIAW23EUVKDKR26HA6W"
	secret_key	=	"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"
}

resource "aws_instance" "myec2" {
	ami				= "ami-012cc038cc685a0d7"
	instance_type	= "t2.micro"
	key_name		= "devops-christophe"
	tags = {
		Name = "ec2-christophe"
	}
}