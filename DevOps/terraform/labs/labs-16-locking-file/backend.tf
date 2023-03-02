terraform {
  backend "s3" {
    bucket = "training-terraform-s3"
    key  = "remote.tfstate"
    region		=	"us-east-1"
    shared_credentials_file = "C:\\Users\\PRO\\.aws\\credentials"
    dynamodb_table = "s3-state-lock"
  }
}