provider "aws" {
	region		=	"us-east-1"
	access_key	=	"<AWS_ACCESS_KEY>"
	secret_key	=	"<AWS_SECRET_KEY>"
}

# Creation de 3 instances identiques
resource "aws_instance" "instance-1" {
   ami = "ami-012cc038cc685a0d7"
   instance_type = "t2.micro"
   count = 3
}