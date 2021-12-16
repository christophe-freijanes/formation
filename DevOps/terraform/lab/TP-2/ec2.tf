provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA...............VTA"
  secret_key = "sAqLGGoICW..................../R/2cT"
}

resource "aws_instance" "testec2" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
  key_name      = "devops-freijac"
  tags = {
    Name = "ec2-freijac"
  }
  root_block_device {
    delete_on_termination = true
  }
}