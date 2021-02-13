# Terraform block to configure Terraform and Provider Version
terraform {
  required_version = "~> 0.14.6" # To allow upgrade of 0.14.x versions.

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
  }
}