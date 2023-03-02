output "Server-IP-East" {
  value = aws_instance.ServerEast.public_ip
}

output "Server-IP-West" {
  value = aws_instance.ServerWest.public_ip
}