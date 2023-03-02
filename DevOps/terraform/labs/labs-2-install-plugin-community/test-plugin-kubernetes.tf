# Installation du plugin k8s
# Source : https://registry.terraform.io/providers/hashicorp/kubernetes/latest
terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.18.1"
    }
  }
}

provider "kubernetes" {
  # Configuration options
}