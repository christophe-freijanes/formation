output "sg-name" {
  description = "Name of Security group"
  value       = aws_security_group.myec2-sg.name
}
output "eip-id" {
  description = "ID of eip"
  value       = aws_eip.lb.id
}