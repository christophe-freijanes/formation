provider "aws" {
	region		=	"us-east-1"
	access_key	=	"<AWS_ACCESS_KEY>"
	secret_key	=	"<AWS_SECRET_KEY>"
}

resource "aws_instance" "myec2" {
  ami           = "ami-012cc038cc685a0d7"
  # On va exploiter dans notre liste une machine de type "m5.large"
  instance_type = var.types['us-east-1']
}

# Definition d'une liste de type de machine
# m5.large = 0, m5.xlarge = 1 etc...
variable "list" {
  type = list
  default = ["m5.large","m5.xlarge","t2.medium"]
}

# Definition d'une map de type de machine dans une zone de disponibilitee
variable "types" {
  type = map
  default = {
    us-east-1 = "t2.micro"
	us-west-2 = "t2.nano"
	ap-south-1 = "t2.small"`
  }
}