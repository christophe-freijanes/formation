# Sentinel Policy
# Cette policy va verifier si un tag est present

#import "tfplan"
#
#main = rule {
#  all tfplan.resources.aws_instance as _, instances {
#    all instances as _, r {
#      (length(r.applied.tags) else 0) > 0
#    }
#  }
#}

#Source : https://www.terraform.io/cloud-docs/sentinel/examples

provider "aws" {
	region		=	"us-east-1"
}

resource "aws_instance" "myec2" {
	ami				= "ami-012cc038cc685a0d7"
	instance_type	= "t2.micro"
	key_name		= "devops-christophe-east-1"
	tags = {
		Name = "ec2-christophe"
	}
}