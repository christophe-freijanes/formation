provider "aws" {
	region		=	"us-east-1"
	access_key	=	"<AWS_ACCESS_KEY>"
	secret_key	=	"<AWS_SECRET_KEY>"
}

# Creation de nos utilisateurs
resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

# Lors de la creation afficher les informations de l'arn des utilisateurs crees dans un ordre numerique
output "arns" {
  value = aws_iam_user.lb[*].arn
}