# Permettre de travailler en remotetly avec Terraform Cloud
# Scenario : On va creer un utilisateur sur AWS
# IDE -> Terraform Cloud -> AWS

terraform {
  backend "remote" {}
}

resource "aws_iam_user" "lb" {
  name = var.nameuser
  path = "/system/"
  tags = {
      Name = var.nameuser
  }
}

provider "aws" {
	region		=	var.region
	access_key	=	var.access_key
	secret_key	=	var.secret_key
}

# COMMANDS
# Connexion vers Terraform cloud puis creation de l'API token
# terraform login

# Exemple de API token
# e3At2Fw16lQh3A.atlasv1.N8GTtjUNUFqPe3zN6E22dzUaXnhjdfhjhgfjhfgUYBHeV65464G8m0wfjghvxvd8b7x67BynzhQrVIs

# Configuration du init pour ce connecter au projet
# terraform init -backend-config="backend.hcl"

# Verification du plan
# terraform plan
