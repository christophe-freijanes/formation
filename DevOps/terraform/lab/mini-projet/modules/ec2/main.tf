data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["099720109477"]
  filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-bionic*"]
    }
  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}
resource "aws_instance" "myec2" {
  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  availability_zone      = var.zone
  tags                   = var.aws_common_tag
  security_groups        = ["${var.security_group_name}"]
  user_data              = file("./modules/ec2/install_nginx.sh")
#  tags = {
#    Name = "${var.product}.${var.environment}-myec2"
#  }
#  provisioner "remote-exec" {
#    inline = [
#      "sudo apt-get install -y nginx",
#      "sudo systemctl start nginx"
#    ]
#  }
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file(var.ssh_key_path)
    host = self.public_ip
  }
  root_block_device {
    delete_on_termination = true
  } 
}