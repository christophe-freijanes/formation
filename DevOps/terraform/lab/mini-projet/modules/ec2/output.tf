output "ec2-id" {
  description = "ID of EC2 Instance"
  value       = aws_instance.myec2.id
}