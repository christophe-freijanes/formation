provider "aws" {
    alias  = "aws01"
    region  = "us-east-1"
    shared_credentials_files = ["../credentials"]
}

provider "aws" {
    alias  = "aws02"
    region  = "us-west-1"
    shared_credentials_files = ["../credentials"]
}