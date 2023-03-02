resource "aws_instance" "myec2" {
	ami				= "ami-006dcf34c09e50022"
	instance_type	= "t2.micro"
	key_name		= "devops-christophe"
	tags = {
		Name = "terraform-training"
	}
}