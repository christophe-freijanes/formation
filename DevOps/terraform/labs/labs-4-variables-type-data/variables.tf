# Sur-charge des variables par defaut

# Mise en place d'une variable de type string
variable "elb_name" {
  type = string
}

# Mise en place d'une variable de type list
# Definition de la zone de disponibilite ou sera actif notre elb
variable "az" {
  type = list
}

# Mise en place d'une variable de type number
# Definition d'un timeout pour permettre un Health Check des backends pour savoir s'ils sont toujours disponibles
variable "timeout" {
  type = number
}