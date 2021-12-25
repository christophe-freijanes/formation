resource "aws_eip" "lb" {
  vpc      = true
#  provisioner "local-exec" {
#    command = "echo The PUBLIC IP: ${aws_eip.lb.public_ip} ; ID: ${var.ec2_instance_id} ; AZ: ${aws_instance.myec2.availability_zone} ; >> infos_myec2.txt"
#  }
  tags = {
    Name = "${var.product}.${var.environment}-myec2-eip"
  }
}
resource "aws_security_group" "myec2-sg" {
  name        = "${var.product}.${var.environment}-myec2-sg"
  description = "Security group for ${var.details}; ${var.product}.${var.environment}"
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all port"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.product}.${var.environment}-myec2-sg"
  }
}