# 1-Generate key-pair(public key, private key) using ssh keygen
# Linux / Windows
# ssh-keygen -t rsa -b 2048
# 2-Use public key to start EC2 instance
# 3-Use the private key to SSH into EC2 instance
# 4-Generate pem file from AWS console and use the file to SSH into EC2
# Source : https://jhooq.com/terraform-ssh-into-aws-ec2/ and https://github.com/kujalk/Terraform-EC2-SSH

resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 2048

  provisioner "local-exec" {
    command     = <<EOT
    '${tls_private_key.ssh-key.private_key_pem}' | % {$_ -replace "`r", ""} | Set-Content -NoNewline ./'${var.keyname}.pem' -Force
    EOT
    interpreter = ["PowerShell", "-Command"]
  }
}

resource "aws_key_pair" "generated-key" {
  key_name   = var.keyname
  public_key = tls_private_key.ssh-key.public_key_openssh
}

resource "aws_instance" "Server" {
  ami           = var.amiid
  instance_type = var.ec2type
  key_name      = aws_key_pair.generated-key.key_name

  tags = {
    Name = var.ec2name
  }
}
resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}