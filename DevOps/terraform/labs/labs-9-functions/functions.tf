provider "aws" {
	region		=	"us-east-1"
	access_key	=	"<AWS_ACCESS_KEY>"
	secret_key	=	"<AWS_SECRET_KEY>"
}

# Creation d'un local pour recuperer la date dans un format particulier dans time
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

# Liste des instances a creer avec une valeur par defaut firstec2 et secondec2
variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

# Configuration d'une map pour placer nos instances en fonction d'une region
variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-0323c3dd2da7fb37d"
    "us-west-2" = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
}

# Variable pour definir la region a utiliser
variable "region" {
  default = "ap-south-1"
}

# Creation des instances
resource "aws_instance" "app-dev" {
   # Pour la creation de notre ami on utilise la fonction lookup
   # Celle-ci va recuperer par les variables predefini en amont ami et la region
   ami = lookup(var.ami,var.region)
   instance_type = "t2.micro"
   # Recuperation du nom de la cle voir ci-dessous
   key_name = aws_key_pair.loginkey.key_name
   count = 2
   # Utilisation de la fonction element pour recuperer la nom par defaut des instances depuis la variable tags
   # puis de recuperer le nombre d'instances a creer defini par la variable count
   tags = {
     Name = element(var.tags,count.index)
   }
}

# Creation d'une key pair
# Il faut que notre dossier contient la cle publique
resource "aws_key_pair" "loginkey" {
  key_name   = "login-christophe-key"
  public_key = file("${path.module}/id_rsa.pub")
}

# Definition de l'output ayant pour nom timestamp
output "timestamp" {
  # Recuperation de la valeur predefini dans locals
  value = local.time
}