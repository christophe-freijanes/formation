provider "aws" {
	region		=	"us-east-1"
	access_key	=	"<AWS_ACCESS_KEY>"
	secret_key	=	"<AWS_SECRET_KEY>"
}

resource "aws_elb" "backend" {
  # Exploitation de la variable .elb_name qui se trouve dans le fichier terraform.tfvars
  name               = var.elb_name
  # Exploitation de la variable .az pour definir la liste de disponibilitees
  availability_zones = var.az

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  # Exploitation de la variable .timeout qui se trouve dans le fichier terraform.tfvars
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = "christophe-terraform-elb"
  }
}