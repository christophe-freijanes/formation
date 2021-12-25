provider aws {
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-freijac"
    key    = "freijac-dev.tfstate"
  }
}
module "network" {
  source      = "./modules/network"
  product     = "app"
  environment = "dev"
  details     = "Allow in and out traffic"
}
module "ec2" {
  source              = "./modules/ec2"
  instance_type       = "t2.nano"
  product             = "app"
  environment         = "dev"
  security_group_name = module.network.sg-name
  aws_common_tag = {
    Name = "ec2-freijac-dev"
  }
}
module "ebs_volume" {
  source = "./modules/ebs"
  zone   = "us-east-1b"
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs_volume.ebs-id
  instance_id = module.ec2.ec2-id
}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2.ec2-id
  allocation_id = module.network.eip-id
}