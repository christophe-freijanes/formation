output "keyvalue" {
  value     = tls_private_key.ssh-key.public_key_openssh
  sensitive = true
}

output "Server-IP" {
  value = aws_instance.Server.public_ip
}