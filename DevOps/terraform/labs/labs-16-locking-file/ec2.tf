# Le locking file (tfstate) permet de centraliser le remote management
# Pour eviter des problemes de gestion, il faut verrouiller la mise a jour de l'infrastructure
# Le fait verrouiller le tfstate, cela permet donc d'eviter de creer des ressources identiques en meme temps
# PREREQUIS
# Depuis AWS, il faut installer 'DynamoDB' qui une bdd de type NoSQL
# 1- Avant cela si cela n'est pas on va creer un compartiment S3
# 2- Puis on va creer notre bdd 'DynamoDB'

resource "aws_instance" "myec2" {
	ami				= "ami-012cc038cc685a0d7"
	instance_type	= "t2.micro"
	key_name		= "devops-christophe"
	tags = {
		Name = "ec2-christophe"
	}
}