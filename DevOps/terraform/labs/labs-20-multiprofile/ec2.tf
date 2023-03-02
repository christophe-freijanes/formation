# Utilisation de la notion de profile pour securiser davantages nos ressources vers une region desiree
resource "aws_instance" "ServerEast" {
	provider  =  aws.aws01
	ami				=  var.amiidEast
	instance_type	=  var.ec2type
	key_name		=  var.keyname-east
	tags = {
		Name = var.ec2nameEast
	}
}

resource "aws_instance" "ServerWest" {
	provider  =  aws.aws02
	ami				=  var.amiidWest
	instance_type	=  var.ec2type
	key_name		=  var.keyname-west
	tags = {
		Name = var.ec2nameWest
	}
}