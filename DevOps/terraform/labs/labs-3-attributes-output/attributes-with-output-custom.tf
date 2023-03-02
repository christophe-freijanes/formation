provider "aws" {
	region		=	"us-east-1"
	access_key	=	"<AWS_ACCESS_KEY>"
	secret_key	=	"<AWS_SECRET_KEY>"
}
# Creation d'une elastic IP AWS nommee lb
# Parametrage du vpc a true
# vpc est un attribue de la resource de type aws_eip
# lb sera le nom dans terraform
resource "aws_eip" "lb" {
  vpc = true
}
# Integration du block output
# Recuperation de la resource .lb.id UNIQUEMENT
output "eip" {
  value = aws_eip.lb.id
}
# Simulation de la creation d'un s3 bucket
# Dont la valeur sera christophe-bucket et qui aura pour nom dans terraform tests3
resource "aws_s3_bucket" "tests3" {
  bucket = "christophe-bucket"
  force_destroy = "true"
}
# Integration du block output
# Recuperation de la resource .tests3.id UNIQUEMENT
output "tests3bucket" {
  value = aws_s3_bucket.tests3.id
}

# Command from terminal
# Into the folder working
# terraform init
# terraform plan
# terraform apply
# terraform destroy

# Pour connaitre les ressources qui peuvent donnee une sortie dans notre exemple pour aws_eip

# Pour definir la valeur de notre resource
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip#argument-reference

# Pour definir les attributes de notre output  
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip#attributes-reference