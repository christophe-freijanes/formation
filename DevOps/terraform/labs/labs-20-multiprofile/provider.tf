# Pour utiliser le module profile modifier le fichier credentials en rajoutant les secrets
provider "aws" {
    alias  = "aws01"
    region  = "us-east-1"
    profile  = "account-east"
    shared_credentials_files = ["../credentials"]
}

provider "aws" {
    alias  = "aws02"
    region  = "us-west-1"
    profile  = "account-west"
    shared_credentials_files = ["../credentials"]
}