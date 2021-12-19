provider aws {
  region     = "us-east-1"
  access_key = "AKIxxxxxxxxxxxxxxXF7Y"
  secret_key = "cz1VHxxxxxxxxxxxxxxxxxxxxxT3uNlhhjU9"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-freijac"
    key    = "freijac-dev.tfstate"
    region = "us-east-1"
    access_key = "AKIAXxxxxxxxxxxxxxCXF7Y"
    secret_key = "cz1xxxxxxxxxxxxxxxxxxxuNlhhjU9"
  }
}

module "ec2" {
  source = "../modules/ec2module"
  instancetype = "t2.nano"
  aws_common_tag = {
    Name = "ec2-dev-freijac"
  }
  sg_name = "sg-dev-freijac"
}