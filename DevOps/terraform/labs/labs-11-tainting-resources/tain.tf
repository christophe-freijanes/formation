provider "aws" {
	region		=	"us-east-1"
	access_key	=	"<AWS_ACCESS_KEY>"
	secret_key	=	"<AWS_SECRET_KEY>"
}

# 1 - Creation d'une instance de base qui sera taint
# Command
# terraform taint aws_instance.testec2

#resource "aws_instance" "testec2" {
#	ami				= "ami-012cc038cc685a0d7"
#	instance_type	= "t2.micro"
#	key_name		= "devops-christophe"
#	tags = {
#		Name = "ec2-christophe-test"
#	}
#}

# 2 - Restoration d'une instance de base avec un autre nom pour revenir a une configuration nominal
# Command
# terraform plan
# terraform apply
resource "aws_instance" "testec2" {
	ami				= "ami-012cc038cc685a0d7"
	instance_type	= "t2.micro"
	key_name		= "devops-christophe"
	tags = {
		Name = "ec2-christophe-test-new"
	}
}