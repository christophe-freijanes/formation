provider "aws" {
	region		=	"us-east-1"
	access_key	=	"<AWS_ACCESS_KEY>"
	secret_key	=	"<AWS_SECRET_KEY>"
}
# ENV DEV
# Si la variable istest est a 'true' alors 3 machines seront cree dans l'environnement de dev
# Si la variable istest est a 'false' alors 0 machine sera cree dans l'environnement de dev
resource "aws_instance" "dev" {
   ami = "ami-012cc038cc685a0d7"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0
}

# ENV PROD
# Si la variable istest est a 'false' alors 1 machine sera cree dans l'environnement de prod
# Si la variable istest est a 'true' alors 0 machine sera cree dans l'environnement de prod
resource "aws_instance" "prod" {
   ami = "ami-012cc038cc685a0d7"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0
}

variable "istest" {}

# Generation du plan
# terraform plan -out=plan-infra-ec2
# Aller sur le lien suivant
# https://dreampuf.github.io/GraphvizOnline/

# Execution du plan
# terraform apply plan-infra-ec2