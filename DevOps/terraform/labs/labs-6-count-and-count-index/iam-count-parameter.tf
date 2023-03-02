provider "aws" {
	region		=	"us-east-1"
	access_key	=	"<AWS_ACCESS_KEY>"
	secret_key	=	"<AWS_SECRET_KEY>"
}

# Creation d'une variable contenant une liste de nom
variable "elb_names" {
  type = list
  default = ["dev-loadbalancer", "stage-loadbalanacer","prod-loadbalancer"]
}

# Creation des utilisateurs ayant comme nom la liste ci-dessus
# 0=dev-loadbalancer, 1=stage-loadbalanacer, 2=prod-loadbalancer
resource "aws_iam_user" "lb" {
  # Appel de la variable elb_names en fournissant le count.index
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}