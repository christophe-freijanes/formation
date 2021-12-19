provider aws {
  region     = "us-east-1"
  access_key = "AKIAxxxxxxxxxxxxxVCXF7Y"
  secret_key = "cz1VHjxxxxxxxxxxxxxxxxxxxxCc5WT3uNlhhjU9"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-freijac"
    key    = "freijac-prod.tfstate"
    region = "us-east-1"
    access_key = "AKIAxxxxxxxxxxxxSVCXF7Y"
    secret_key = "cz1xxxxxxxxxxxxxxxU9"
  }
}

module "ec2" {
  source = "../modules/ec2module"
  instancetype = "t2.micro"
  aws_common_tag = {
    Name = "ec2-prod-freijac"
  }
  sg_name = "sg-prod-freijac"
}