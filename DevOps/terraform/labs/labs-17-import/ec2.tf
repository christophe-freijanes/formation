# Import d'une instance ec2 deja cree manuellement dans AWS
# Afin de la gerer automatiquement avec Terraform
# 1- Recuperation des donnees manuellement depuis AWS

# Instance a importer
#resource "aws_instance" "myec2" {
#	ami				= "ami-006dcf34c09e50022"
#	instance_type	= "t2.micro"
#	key_name		= "devops-christophe"
#	vpc_security_group_ids = ["sg-00f2b16c0135ad9fc"]
#	subnet_id = "subnet-02088a902e82c259f"
#	tags = {
#		Name = "terraform"
#	}
#}

# 2- Import de l'instance recuperer depuis AWS <ID instance>
# terraform init
# terraform import aws_instance.myec2 i-09d1c385501f5f4b6

# 3- Creation d'une nouvelle instance grace a notre import
# terraform plan
resource "aws_instance" "myec2" {
	ami				= "ami-006dcf34c09e50022"
	instance_type	= "t2.micro"
	key_name		= "devops-christophe"
	vpc_security_group_ids = ["sg-00f2b16c0135ad9fc"]
	subnet_id = "subnet-02088a902e82c259f"
	tags = {
		Name = "terraform-2"
	}
}

# 4- Appliquer le changement
# terraform apply