resource "aws_instance" "myec2" {
  ami           = "ami-012cc038cc685a0d7"
  # lookup permet de parcourir une map
  instance_type = lookup(var.instance_type, terraform.workspace)
}

variable "instance_type" {
  type = map

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod     = "t2.large"
  }
}

# COMMANDS

# Afficher l'aide des workspace
# terraform workspace -h

# Voir les workspace creer
# terraform workspace show

# Creer un workspace
# terraform workspace new <ENV>

# Selectionner un workspace
# terraform workspace select <ENV>

# Check
# terraform plan