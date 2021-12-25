resource "aws_ebs_volume" "myec2-data" {
  availability_zone = var.zone
  size              = var.ebs_size

  tags = {
    Name = "${var.product}.${var.environment}-myec2-data"
  }
}