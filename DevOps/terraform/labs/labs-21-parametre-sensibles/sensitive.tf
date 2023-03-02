locals {
  db_password = {
    admin = "password"
  }
}

output "db_password" {
  value = local.db_password
  # Activer le parametrer sensitive pour cacher des donnees sensibles
  sensitive   = true
}

# p\Pour le test faire directement :
# terraform plan