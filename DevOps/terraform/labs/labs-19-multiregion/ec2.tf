# Utilisation de la notion d'alias pour cibler nos ressources vers une region desiree
resource "aws_instance" "myec2e" {
	provider  =  aws.aws01
	ami				= "ami-006dcf34c09e50022"
	instance_type	= "t2.micro"
	key_name		= "devops-christophe"
	tags = {
		Name = "terraform-training-east"
	}
}

resource "aws_instance" "myec2w" {
	provider  =  aws.aws02
	ami				= "ami-060d3509162bcc386"
	instance_type	= "t2.micro"
	key_name		= "devops-christophe"
	tags = {
		Name = "terraform-training-west"
	}
}